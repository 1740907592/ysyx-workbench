/***************************************************************************************
* Copyright (c) 2014-2024 Zihao Yu, Nanjing University
*
* NEMU is licensed under Mulan PSL v2.
* You can use this software according to the terms and conditions of the Mulan PSL v2.
* You may obtain a copy of Mulan PSL v2 at:
*          http://license.coscl.org.cn/MulanPSL2
*
* THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
* EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
* MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
*
* See the Mulan PSL v2 for more details.
***************************************************************************************/

#include <isa.h>

/* We use the POSIX regex functions to process regular expressions.
 * Type 'man regex' for more information about POSIX regex functions.
 */
#include <regex.h>

enum {
  TK_NOTYPE = 256, TK_EQ,
  TK_NUM = 1,TK_KUOHAO,
  TK_ADD,TK_SUB,TK_DIV,TK_ZUO,TK_YOU,
  TK_HEX,TK_REG,TK_MUL,TK_NOEQ,TK_OR,
  TK_AND,TK_LEQ
  /* TODO: Add more token types */

};

static struct rule {
  const char *regex;
  int token_type;
} rules[] = {

  /* TODO: Add more rules.
   * Pay attention to the precedence level of different rules.
   */

   {"\\(", TK_ZUO},          
   {"\\)", TK_YOU},       
   {"0[xX][0-9a-fA-F]+", TK_HEX},  
   {"\\$[a-zA-Z0-9]+", TK_REG},    
   {"-?[1-9][0-9]*", TK_NUM},      
   {"==", TK_EQ},          
   {"!=", TK_NOEQ},
   {"\\|\\|", TK_OR},
   {"&&", TK_AND},
   {"<=", TK_LEQ},
   {"\\+", TK_ADD},        
   {"-", TK_SUB},
   {"\\*", TK_MUL},
   {"/", TK_DIV},
   {"!", '!'},
   {" +", TK_NOTYPE}       
 
};

#define NR_REGEX ARRLEN(rules)

static regex_t re[NR_REGEX] = {};

/* Rules are used for many times.
 * Therefore we compile them only once before any usage.
 */
void init_regex() {
  int i;
  char error_msg[128];
  int ret;

  for (i = 0; i < NR_REGEX; i ++) {
    ret = regcomp(&re[i], rules[i].regex, REG_EXTENDED);
    if (ret != 0) {
      regerror(ret, &re[i], error_msg, 128);
      panic("regex compilation failed: %s\n%s", error_msg, rules[i].regex);
    }
  }
}

typedef struct token {
  int type;
  char str[32];
} Token;

uint32_t len;
static Token tokens[32] __attribute__((used)) = {};
static int nr_token __attribute__((used))  = 0;

static bool make_token(char *e) {
  int position = 0;
  nr_token = 0;

  while (e[position] != '\0') {
    bool matched = false;
    for (int i = 0; i < NR_REGEX; i++) {
      regmatch_t pmatch;
      if (regexec(&re[i], e + position, 1, &pmatch, 0) == 0 && pmatch.rm_so == 0) {
        int substr_len = pmatch.rm_eo;
        char *substr = e + position;
        
        // 记录token
        switch (rules[i].token_type) {
          case TK_ADD: case TK_SUB: case TK_MUL: case TK_DIV:
          case TK_ZUO: case TK_YOU: case TK_EQ: case TK_NOEQ:
          case TK_OR: case TK_AND: case TK_LEQ: { 
            tokens[nr_token++].type = rules[i].token_type;
            break;
          }

          case TK_NUM:
          case TK_REG:
          case TK_HEX:
            tokens[nr_token].type = rules[i].token_type;
            strncpy(tokens[nr_token].str, substr, substr_len);
            tokens[nr_token].str[substr_len] = '\0';

            nr_token++;
            break;

          case TK_NOTYPE: break;
          default: 
            printf("no token type: %d\n", rules[i].token_type);
            return false;
        }

        position += substr_len;
        matched = true;
        break;
      }
    }
    if (!matched) {
      printf("Unexpected character: %c\n", e[position]);
      return false;
    }
  }
  return true;
}



static uint32_t getRegVal(const char *reg, bool *success) {
  if (strcmp(reg, "$x0") == 0) return 0;
  return 114514;
}
int check_parenthese(uint32_t l, uint32_t r) {
  if (tokens[l].type != TK_ZUO || tokens[r].type != TK_YOU) {
    return 0;
  }
  int balance = 0;
  for (int i = l; i <= r; i++) {
    if (tokens[i].type == TK_ZUO) balance++;
    if (tokens[i].type == TK_YOU) balance--;
    //左括号可以多余右括号,但是右括号不能多于左括号,否则一定匹配失败
    if (balance < 0) return 0;
  }
  return balance == 0;
}
const int priority[] = {
  [TK_OR]  = 5, [TK_AND] = 4,
  [TK_EQ]  = 3, [TK_NOEQ] = 3, [TK_LEQ] = 3,
  [TK_ADD] = 2, [TK_SUB] = 2,
  [TK_MUL] = 1, [TK_DIV] = 1
};
uint32_t eval(uint32_t l, uint32_t r) {
  if (l > r) {
    return INT32_MAX;
  } else if (l == r) {
    //单独负号隔离出发进行讨论
    
    switch (tokens[l].type) {
      case TK_NUM: return atoi(tokens[l].str);
      case TK_HEX: return strtol(tokens[l].str, NULL, 16);
      case TK_REG: {
        bool reg_valid = true;
        uint32_t val = getRegVal(tokens[l].str + 1, &reg_valid);
        if (!reg_valid) {
          printf("Invalid register: %s\n", tokens[l].str);
        }
        return val;
      }
      case TK_SUB: return -eval(l + 1, r);
      default: 
        return INT32_MAX;
    }

  } else if (check_parenthese(l, r)) {
    return eval(l + 1, r - 1);
  } else {
    int kuo = 0;
    int op_pos = -1;
    int min_priority = INT32_MAX;

    /* 运算符优先级表 */
    

    /* 从右向左查找主运算符 */
    for (int i = r; i >= l; i--) {
      if (tokens[i].type == TK_YOU) kuo++;
      if (tokens[i].type == TK_ZUO) kuo--;
      if (kuo != 0) continue;

      int curr_pri = INT32_MAX;
      if (priority[tokens[i].type]) {
        curr_pri = priority[tokens[i].type];
      }

      if (curr_pri < min_priority) {
        min_priority = curr_pri;
        op_pos = i;
      }
    }

    if (op_pos == -1) {
      return INT32_MAX;
    }

    /* 处理一元负号 */
    if (tokens[op_pos].type == TK_SUB) {
      if (op_pos == l || 
          tokens[op_pos-1].type == TK_ADD ||
          tokens[op_pos-1].type == TK_SUB ||
          tokens[op_pos-1].type == TK_MUL ||
          tokens[op_pos-1].type == TK_DIV) 
      {
        return -eval(op_pos+1, r);
      }
    }

    /* 递归求值 */
    uint32_t val1 = eval(l, op_pos-1);
    
    uint32_t val2 = eval(op_pos+1, r);

    /* 执行运算 */
    switch (tokens[op_pos].type) {
      case TK_ADD: return val1 + val2;
      case TK_SUB: return val1 - val2;
      case TK_MUL: return val1 * val2;
      case TK_DIV: 
        if (val2 == 0) {
          printf("Division by zero\n");
          return INT32_MAX;
        }
        return val1 / val2;
      case TK_EQ:  return val1 == val2;
      case TK_NOEQ:return val1 != val2;
      case TK_OR: return val1 || val2;
      case TK_AND: return val1 && val2;
      case TK_LEQ: return val1 <= val2;
      default: 
        printf("false operator: %d\n", tokens[op_pos].type);
        return INT32_MAX;
    }
  }

}
word_t expr(char *e, bool *success) {
  if (!make_token(e)) {
    *success = false;
    return 0;
  }

  /* TODO: Insert codes to evaluate the expression. */
  uint32_t t = eval(0, nr_token - 1);
  if (t == INT32_MAX) {
    *success = false;
    return 0;
  }
  return t;
}
