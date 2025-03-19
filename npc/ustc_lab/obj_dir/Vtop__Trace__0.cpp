// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vtop__Syms.h"


void Vtop___024root__trace_chg_sub_0(Vtop___024root* vlSelf, VerilatedVcd::Buffer* bufp);

void Vtop___024root__trace_chg_top_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root__trace_chg_top_0\n"); );
    // Init
    Vtop___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vtop___024root*>(voidSelf);
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    Vtop___024root__trace_chg_sub_0((&vlSymsp->TOP), bufp);
}

void Vtop___024root__trace_chg_sub_0(Vtop___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root__trace_chg_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode + 1);
    // Body
    if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[0U])) {
        bufp->chgCData(oldp+0,(vlSelf->top__DOT__my_seg__DOT__segs[0]),8);
        bufp->chgCData(oldp+1,(vlSelf->top__DOT__my_seg__DOT__segs[1]),8);
        bufp->chgCData(oldp+2,(vlSelf->top__DOT__my_seg__DOT__segs[2]),8);
        bufp->chgCData(oldp+3,(vlSelf->top__DOT__my_seg__DOT__segs[3]),8);
        bufp->chgCData(oldp+4,(vlSelf->top__DOT__my_seg__DOT__segs[4]),8);
        bufp->chgCData(oldp+5,(vlSelf->top__DOT__my_seg__DOT__segs[5]),8);
        bufp->chgCData(oldp+6,(vlSelf->top__DOT__my_seg__DOT__segs[6]),8);
        bufp->chgCData(oldp+7,(vlSelf->top__DOT__my_seg__DOT__segs[7]),8);
    }
    bufp->chgCData(oldp+8,(vlSelf->b),4);
    bufp->chgCData(oldp+9,(vlSelf->h),8);
    bufp->chgBit(oldp+10,(vlSelf->en));
    bufp->chgCData(oldp+11,(vlSelf->x),8);
    bufp->chgCData(oldp+12,(vlSelf->y),3);
    bufp->chgBit(oldp+13,(vlSelf->wok));
    bufp->chgIData(oldp+14,(vlSelf->top__DOT__my_encode__DOT__st),32);
}

void Vtop___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root__trace_cleanup\n"); );
    // Init
    Vtop___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vtop___024root*>(voidSelf);
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    vlSymsp->__Vm_activity = false;
    vlSymsp->TOP.__Vm_traceActivity[0U] = 0U;
}
