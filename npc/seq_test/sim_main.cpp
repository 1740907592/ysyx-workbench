#include "Vtop.h"
#include "verilated.h"
#include "verilated_vcd_c.h"  // VCD 文件生成支持
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
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
    top->s = 0b00;
    top->x0 = 0b00;
    step_and_dump_wave();
    top->x0 = 0b01;
        step_and_dump_wave();
        top->x0 = 0b10;
        step_and_dump_wave();
        top->x0 = 0b11;
        step_and_dump_wave();


  sim_exit();


}