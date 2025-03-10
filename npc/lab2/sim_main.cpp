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

void step_and_dump_wave() {
    top->clk = 0;
    top->eval();
    tfp->dump(contextp->time());
    contextp->timeInc(1);
    top->clk = 1;
    top->eval();
    tfp->dump(contextp->time());
    contextp->timeInc(1);
}
void reset(int n) {
  top->rst = 1;
  while (n -- > 0) step_and_dump_wave();
  top->rst = 0;
}

void sim_init() {
    contextp = new VerilatedContext;
    top = new Vtop("top");
    tfp = new VerilatedVcdC;
    contextp->traceEverOn(true);
    top->trace(tfp, 0);  // 设置波形级别，99是通常的详细级别
    tfp->open("waveform.vcd");  // 打开 VCD 文件
}

void sim_exit() {
    step_and_dump_wave();
    tfp->close();
    delete top;
    delete tfp;
}

int main() {
    sim_init();
    top->en=0b0; top->x =0b0000; step_and_dump_wave();
               top->x =0b0001; step_and_dump_wave();
               top->x =0b0010; step_and_dump_wave();
               top->x =0b0100; step_and_dump_wave();
               top->x =0b1000; step_and_dump_wave();
  top->en=0b1; top->x =0b0000; step_and_dump_wave();
               top->x =0b0001; step_and_dump_wave();
               top->x =0b0010; step_and_dump_wave();
               top->x =0b0100; step_and_dump_wave();
               top->x =0b1000; step_and_dump_wave();
               top->x =0b1100; step_and_dump_wave();
               top->x =0b0110; step_and_dump_wave();



    sim_exit();
}
