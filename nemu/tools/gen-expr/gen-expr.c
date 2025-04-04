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

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <assert.h>
#include <string.h>

// this should be enough
static char buf[65536] = {};
static char code_buf[65536 + 128] = {}; // a little larger than `buf`
static char *code_format =
"#include <stdio.h>\n"
"int main() { "
"  unsigned result = %s; "
"  printf(\"%%u\", result); "
"  return 0; "
"}";
int cnt = 0;
void gen_num() {
  int t = rand() % 10 + 1;
  buf[cnt++] = t + '0';
  int time = rand() % 30;
  while (time) {
    gen_num();
  }
}
static void gen(char a) {
  buf[cnt++] = a;
  int now = rand() % 2;
  while (now--) {
    buf[cnt++] = ' ';
  }
}
static void gen_rand_op() {
  int t = rand() % 4;
  switch (t) {
    case 0: buf[cnt++] = '+'; break;
    case 1: buf[cnt++] = '-'; break;
    case 2: buf[cnt++] = '*'; break;
    case 3: buf[cnt++] = '/'; break;

  }
  int now = rand() % 3;
  while (now--) {
    buf[cnt++] = ' ';
  }
  
}

static void gen_rand_expr() {
  if (cnt > 60000) {
    printf("too long\n");
  }
   int t = rand() % 3;
   if (strlen(buf) > 100) {
    return;
   }
   switch (t) {
      case 0: gen_num(); break;
      case 1: gen('('); gen_rand_expr(); gen(')'); break;
      default: gen_rand_expr(); gen_rand_op(); gen_rand_expr(); break;
   }
  
}

int main(int argc, char *argv[]) {
  int seed = time(0);
  srand(seed);
  int loop = 1;
  if (argc > 1) {
    sscanf(argv[1], "%d", &loop);
  }
  int i;
  for (i = 0; i < loop; i ++) {
    cnt = 0;
    gen_rand_expr();

    sprintf(code_buf, code_format, buf);

    FILE *fp = fopen("/tmp/.code.c", "w");
    assert(fp != NULL);
    fputs(code_buf, fp);
    fclose(fp);

    int ret = system("gcc /tmp/.code.c -o /tmp/.expr");
    if (ret != 0) continue;

    fp = popen("/tmp/.expr", "r");
    assert(fp != NULL);

    int result;
    ret = fscanf(fp, "%d", &result);
    pclose(fp);

    printf("%u %s\n", result, buf);
  }
  return 0;
}
