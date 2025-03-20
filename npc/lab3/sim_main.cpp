#include "Vtop.h"
#include "verilated.h"
#include "verilated_vcd_c.h"  // VCD 文件生成支持
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <cassert>
using namespace std;
VerilatedContext* contextp = NULL;
VerilatedVcdC* tfp = NULL;
Vtop* top;
void step_and_dump_wave(){
  top->eval();
  contextp->timeInc(1);
  tfp->dump(contextp->time());
}
void sim_init() {
   contextp = new VerilatedContext;
    top = new Vtop("top");
    tfp = new VerilatedVcdC;
    contextp->traceEverOn(true); 
    top->trace(tfp, 0);  // 设置波形级别，99是通常的详细级别
    tfp->open("waveform.vcd");  // 打开 VCD 文件
}
void sim_exit(){
  step_and_dump_wave();
  tfp->close();
  delete top;
  delete tfp;
}
int main() {
    sim_init();
    for (int k = 0; k <= 7; k++) {
      top->fun_sel = k;
      int cout = 0,overflow = 0,res = 0;
      if (k == 0) {
        for (int i = -8; i <= 7; i++) {
          for (int j = -8; j <= 7; j++) {
            top->in_a = i;
            top->in_b = j;
            step_and_dump_wave();
            if (top->res != top->in_a + top->in_b) {
              printf("ina = %d,inb = %d,res = %d\n",top->in_a,top->in_b,top->res);
              
            }

          }
        }
      } else if (k == 1) {
        for (int i = -8; i <= 7; i++) {
          for (int j = -8; j <= 7; j++) {
            top->in_a = i;
            top->in_b = j;
            step_and_dump_wave();
          }
        }
      } else if (k == 2) {
        for (int i = -8; i <= 7; i++) {
          for (int j = -8; j <= 7; j++) {
            top->in_a = i;
            top->in_b = j;
            step_and_dump_wave();
          }
        }
      } else if (k == 3) {
        for (int i = -8; i <= 7; i++) {
          for (int j = -8; j <= 7; j++) {
            top->in_a = i;
            top->in_b = j;
            step_and_dump_wave();
          }
        }
      } else if (k == 4) {
        for (int i = -8; i <= 7; i++) {
          for (int j = -8; j <= 7; j++) {
            top->in_a = i;
            top->in_b = j;
            step_and_dump_wave();
          }
        }
      }else if (k == 5) {
        for (int i = -8; i <= 7; i++) {
          for (int j = -8; j <= 7; j++) {
            top->in_a = i;
            top->in_b = j;
            step_and_dump_wave();
          }
        }
      } else if (k == 6) {
        for (signed i = -8; i <= 7; i++) {
          for (signed j = -8; j <= 7; j++) {
            top->in_a = i;
            top->in_b = j;
            step_and_dump_wave();
          }
        }
      } else if (k == 7) {
        for (int i = -8; i <= 7; i++) {
          for (int j = -8; j <= 7; j++) {
            top->in_a = i;
            top->in_b = j;
            step_and_dump_wave();
            res = (i == j);
            assert(res == top->res);
          }
        }
      }
      
    }
    


  sim_exit();


}