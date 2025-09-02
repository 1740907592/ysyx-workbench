	.file	"dut.i"
	.text
	.p2align 4
	.globl	isa_difftest_checkregs
	.type	isa_difftest_checkregs, @function
isa_difftest_checkregs:
.LFB62:
	.cfi_startproc
	endbr64
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE62:
	.size	isa_difftest_checkregs, .-isa_difftest_checkregs
	.p2align 4
	.globl	isa_difftest_attach
	.type	isa_difftest_attach, @function
isa_difftest_attach:
.LFB63:
	.cfi_startproc
	endbr64
	ret
	.cfi_endproc
.LFE63:
	.size	isa_difftest_attach, .-isa_difftest_attach
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
