	.file	"ref.i"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"src/cpu/difftest/ref.c"
.LC1:
	.string	"0"
	.text
	.p2align 4
	.globl	difftest_memcpy
	.type	difftest_memcpy, @function
difftest_memcpy:
.LFB54:
	.cfi_startproc
	endbr64
	pushq	%rax
	.cfi_def_cfa_offset 16
	popq	%rax
	.cfi_def_cfa_offset 8
	leaq	__PRETTY_FUNCTION__.3(%rip), %rcx
	movl	$22, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	__assert_fail@PLT
	.cfi_endproc
.LFE54:
	.size	difftest_memcpy, .-difftest_memcpy
	.p2align 4
	.globl	difftest_regcpy
	.type	difftest_regcpy, @function
difftest_regcpy:
.LFB55:
	.cfi_startproc
	endbr64
	pushq	%rax
	.cfi_def_cfa_offset 16
	popq	%rax
	.cfi_def_cfa_offset 8
	leaq	__PRETTY_FUNCTION__.2(%rip), %rcx
	movl	$26, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	__assert_fail@PLT
	.cfi_endproc
.LFE55:
	.size	difftest_regcpy, .-difftest_regcpy
	.p2align 4
	.globl	difftest_exec
	.type	difftest_exec, @function
difftest_exec:
.LFB56:
	.cfi_startproc
	endbr64
	pushq	%rax
	.cfi_def_cfa_offset 16
	popq	%rax
	.cfi_def_cfa_offset 8
	leaq	__PRETTY_FUNCTION__.1(%rip), %rcx
	movl	$30, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	__assert_fail@PLT
	.cfi_endproc
.LFE56:
	.size	difftest_exec, .-difftest_exec
	.p2align 4
	.globl	difftest_raise_intr
	.type	difftest_raise_intr, @function
difftest_raise_intr:
.LFB57:
	.cfi_startproc
	endbr64
	pushq	%rax
	.cfi_def_cfa_offset 16
	popq	%rax
	.cfi_def_cfa_offset 8
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx
	movl	$34, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	__assert_fail@PLT
	.cfi_endproc
.LFE57:
	.size	difftest_raise_intr, .-difftest_raise_intr
	.p2align 4
	.globl	difftest_init
	.type	difftest_init, @function
difftest_init:
.LFB58:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	call	init_mem@PLT
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	init_isa@PLT
	.cfi_endproc
.LFE58:
	.size	difftest_init, .-difftest_init
	.section	.rodata
	.align 16
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 20
__PRETTY_FUNCTION__.0:
	.string	"difftest_raise_intr"
	.align 8
	.type	__PRETTY_FUNCTION__.1, @object
	.size	__PRETTY_FUNCTION__.1, 14
__PRETTY_FUNCTION__.1:
	.string	"difftest_exec"
	.align 16
	.type	__PRETTY_FUNCTION__.2, @object
	.size	__PRETTY_FUNCTION__.2, 16
__PRETTY_FUNCTION__.2:
	.string	"difftest_regcpy"
	.align 16
	.type	__PRETTY_FUNCTION__.3, @object
	.size	__PRETTY_FUNCTION__.3, 16
__PRETTY_FUNCTION__.3:
	.string	"difftest_memcpy"
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
