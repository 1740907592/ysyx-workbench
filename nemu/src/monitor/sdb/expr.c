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
  TK_AND,TK_LEQ, TK_DEREFERENCE
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
   {"\\$[a-zA-Z]*[0-9]*", TK_REG},    
   {"[0-9]*", TK_NUM},      
   {"\\=\\=", TK_EQ},          
   {"\\!\\=", TK_NOEQ},
   {"\\|\\|", TK_OR},
   {"\\&\\&", TK_AND},
   {"\\<\\=", TK_LEQ},
   {"\\+", TK_ADD},        
   {"\\-", TK_SUB},
   {"\\*", TK_MUL},
   {"\\/", TK_DIV},
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
void intToString(int val, char res[]) {
  char buf[32];
  int len = 0;
  int fushu = 0;
  if (val == 0) {
    buf[len++] = '0';

  } else {
    if (val < 0) {
      fushu = 1;
      val = -val;
    }
    while (val) {
      buf[len++] = (val % 10) + '0';
      val /= 10;
    }
    if (fushu) {
      buf[len++] = '-';
    }
    buf[len] = '\0';
  }
    for (int j = 0; j < len; j++) {
      res[j] = buf[len - 1 - j];
    }
    res[len] = '\0';
  
}


static bool make_token(char *e) {
  int position = 0;
  nr_token = 0;
  int i;
  while (e[position] != '\0') {
    for (i = 0; i < NR_REGEX; i++) {
      regmatch_t pmatch;
      if (regexec(&re[i], e + position, 1, &pmatch, 0) == 0 && pmatch.rm_so == 0) {
        int substr_len = pmatch.rm_eo;
        position += substr_len;
        
        // token记录在rules里面,对rules进行匹配,决定是否要加入token
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
            strncpy(tokens[nr_token].str, &e[position - substr_len], substr_len);

            nr_token++;
            break;

          case TK_NOTYPE: break;
          default: 

            printf("no token type: %d\n", rules[i].token_type);
            break;
        }
        break;
      }
    }

    if (i == NR_REGEX) {
      printf("no match loc at %d\n%s\n %*.s^\n", position, e, position, "");
      return false;
    }
    
  }
  for (int i = 0; i < nr_token; i++) {
    if (tokens[i].type == TK_REG) {
      bool st = 1;
      int val = isa_reg_str2val(tokens[i].str, &st);
      if (st) {
        intToString(val, tokens[i].str);
      } else {
        printf("couldn't transmit\n");
        assert(0);
      }
    } else if (tokens[i].type == TK_HEX) {
      int val = strtol(tokens[i].str, NULL, 16);
      intToString(val, tokens[i].str);
      //负号前后判断,和解引用一样
    } else if ((tokens[i].type == TK_SUB && 
      tokens[i - 1].type != TK_NUM && tokens[i + 1].type == TK_NUM)
      || (tokens[i].type == TK_SUB && i == 0 && tokens[i + 1].type == TK_NUM)) {
        
        for (int j = 31; j >= 0; j--) {
          tokens[i + 1].str[j] = tokens[i + 1].str[j - 1];
        }
        tokens[i + 1].str[0]  = '-';
        for (int j = i + 1; j < nr_token; j++) {
          tokens[j - 1] = tokens[j];
        }
        nr_token--;
        
    // 解引用是地址,前面不能有数,比如寄存器解码的数,或者num,或者hex, 还有一种情况,在第一个,直接进行解码思考了
    } else if ((tokens[i].type == TK_MUL && (i > 0) && (tokens[i - 1].type != TK_NUM
              || tokens[i - 1].type != TK_HEX || tokens[i - 1].type != TK_REG))
              || (tokens[i].type == TK_MUL && i == 0)) {
                int val = atoi(tokens[i + 1].str);
                uintptr_t addr = (uintptr_t) val;
                int now = *((int*)addr);
                intToString(now, tokens[i + 1].str);

                for (int j = i + 1; j < nr_token; j++) {
                  tokens[j - 1] = tokens[j];
                }
                nr_token--;

    }
  }
  //检查每一个字符,直接先判断,减少后面思考量变成值,符号去掉
  //解耦思考,特别判断负号, 引用,  把hex转换为 num字符串, 解引用的值转换为num字符串
  //负数同理,对token进行增减思考,我只关心值,不关心他变化前是什么样子,所以把符号, 解引用, 全部转换为值就好了
  return true;
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

int max(int a, int b) {
  return a < b ? b : a;
}
uint32_t eval(uint32_t l, uint32_t r) {
  if (l > r) {
    //assert(0);
    return -1;
  } else if (l == r) {
    
    return atoi(tokens[l].str);

  } else if (check_parenthese(l, r)) {
    return eval(l + 1, r - 1);
  } else {
    //查找主运算符,越先运算越不是主运算符,括号内不能做主运算符
    //找到最左边的作为主符号,然后划分左右,位置越大越好, */优先级别高,遇到不改变ok,但是把主运算符位置改变
    int kuoNum = 0;
    int opLoc = -1;
    int ok = 0;

    for (int i = l; i <= r; i++) {
      if (tokens[i].type == TK_ZUO) {
        kuoNum++;
      }
      if (tokens[i].type == TK_YOU) {
        kuoNum--;
      }

      if (!kuoNum && !ok) {
        switch (tokens[i].type) {
          case TK_ADD: case TK_SUB: 
          case TK_EQ: case TK_NOEQ:
          case TK_OR: case TK_AND: case TK_LEQ: {
            ok = 1;
            opLoc = max(opLoc, i);
            break;
          }
          case TK_MUL : case TK_DIV : {
            opLoc = max(opLoc, i);
            break;
          }


        }
      //不关心ok,关心最后的位置
      int type = tokens[opLoc].type;
      uint32_t val1 = eval(l, opLoc - 1);
      uint32_t val2 = eval(opLoc - 1, r);
      //根据主运算符深度枚举,减少复杂度
      switch (type) {
        case TK_ADD:
          return val1 + val2;

        case TK_SUB:
          return val1 - val2;

        case TK_MUL:
          return val1 * val2;

        case TK_DIV:
          if (val2 == 0) {
            printf("division zero, fault\n");
            return 0;
          }
          return val1 / val2;

        case TK_EQ:
          return val1 == val2;

        case TK_NOEQ:
          return val1 != val2;

        case TK_OR:
          return val1 || val2;

        case TK_AND:
          return val1 && val2;

        default:
          printf("NO type\n");
          assert(0);
      }
      
      
      

      }
    }
    return 1;
  }

}
word_t expr(char *e, bool *success) {
  if (!make_token(e)) {
    *success = false;
    return 0;
  }

  /* TODO: Insert codes to evaluate the expression. */
  uint32_t t = eval(0, nr_token - 1);
  if (t == -1) {
    *success = false;
    return 0;
  }
  return t;
}
