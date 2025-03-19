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
#include <memory/paddr.h>
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

  
   {" +", TK_NOTYPE},   
    {"\\+", TK_ADD},        
   {"\\-", TK_SUB},
   {"\\*", TK_MUL},
   {"\\/", TK_DIV},
   {"\\(", TK_ZUO},          
   {"\\)", TK_YOU},     
   {"\\<\\=", TK_LEQ},
  
   {"\\=\\=", TK_EQ},          
   {"\\!\\=", TK_NOEQ},
   {"\\|\\|", TK_OR},
   {"\\&\\&", TK_AND},
   {"0[xX][0-9a-fA-F]+", TK_HEX},  
      {"[0-9]+", TK_NUM},      

   {"\\$?[a-zA-Z]*[0-9]*", TK_REG},    

   
 
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
void intToString(long val, char res[]) {
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
    //正则表达式错误,导致一直循环表达式,段错误
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
            //静态数组,赋值前要先情况缓冲区,否则之前的数据保留在里面,导致错误出现

            tokens[nr_token].type = rules[i].token_type;
            memset(tokens[nr_token].str, 0, sizeof (tokens[nr_token].str));
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
      //评估也有这个问题,前面的结果好像影响到后面了,相互覆盖导致的?
      uint32_t val = isa_reg_str2val(tokens[i].str, &st);
      if (st) {
        intToString(val, tokens[i].str);
      } else {
        printf("couldn't transmit\n");
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
    //解引用条件用错了,错误寻址触发异常,使用两次pg *t0出现错误,当前解引用,后面的值直接消除了,reg,也直接评估了
    } else if ((tokens[i].type == TK_MUL && (i > 0) && (tokens[i - 1].type != TK_NUM
              && tokens[i - 1].type != TK_HEX && tokens[i - 1].type != TK_REG))
              || (tokens[i].type == TK_MUL && i == 0)) {
                uintptr_t val = (uintptr_t)atoi(tokens[i + 1].str);
                if (tokens[i + 1].type == TK_HEX) {
                  val = strtol(tokens[i + 1].str, NULL, 16);
                } else if (tokens[i + 1].type == TK_NUM) {
                  val = atoi(tokens[i + 1].str);
                } else if (tokens[i + 1].type == TK_REG) {
                  bool st = 0;
                  val = isa_reg_str2val(tokens[i + 1].str, &st);
                }
                uint32_t now =  paddr_read(val, 4);
                intToString((int)now, tokens[i + 1].str);

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
int eval(int l, int r) {
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
      
      
      
      

      }
    }
    int type = tokens[opLoc].type;
      uint32_t val1 = eval(l, opLoc - 1);
      uint32_t val2 = eval(opLoc + 1, r);
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
      }
      //括号放错位置导致错误
  }
  printf("entre right\n");
  return -1;
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
