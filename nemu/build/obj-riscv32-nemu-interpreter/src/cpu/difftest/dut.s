	.file	"dut.i"
	.text
	.p2align 4
	.globl	init_difftest
	.type	init_difftest, @function
init_difftest:
.LFB54:
	.cfi_startproc
	endbr64
	ret
	.cfi_endproc
.LFE54:
	.size	init_difftest, .-init_difftest
	.globl	ref_difftest_raise_intr
	.bss
	.align 8
	.type	ref_difftest_raise_intr, @object
	.size	ref_difftest_raise_intr, 8
ref_difftest_raise_intr:
	.zero	8
	.globl	ref_difftest_exec
	.align 8
	.type	ref_difftest_exec, @object
	.size	ref_difftest_exec, 8
ref_difftest_exec:
	.zero	8
	.globl	ref_difftest_regcpy
	.align 8
	.type	ref_difftest_regcpy, @object
	.size	ref_difftest_regcpy, 8
ref_difftest_regcpy:
	.zero	8
	.globl	ref_difftest_memcpy
	.align 8
	.type	ref_difftest_memcpy, @object
	.size	ref_difftest_memcpy, 8
ref_difftest_memcpy:
	.zero	8
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
