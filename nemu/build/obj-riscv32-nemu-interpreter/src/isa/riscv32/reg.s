	.file	"reg.i"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%s = 0X%X\n"
	.text
	.p2align 4
	.globl	isa_reg_display
	.type	isa_reg_display, @function
isa_reg_display:
.LFB55:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	.LC0(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	leaq	regs(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leaq	cpu(%rip), %rbx
	leaq	128(%rbx), %r13
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	.p2align 4,,10
	.p2align 3
.L2:
	movl	(%rbx), %ecx
	movq	0(%rbp), %rdx
	movq	%r12, %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	addq	$4, %rbx
	addq	$8, %rbp
	call	__printf_chk@PLT
	cmpq	%r13, %rbx
	jne	.L2
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE55:
	.size	isa_reg_display, .-isa_reg_display
	.section	.rodata.str1.1
.LC1:
	.string	"false reg %s\n"
	.text
	.p2align 4
	.globl	isa_reg_str2val
	.type	isa_reg_str2val, @function
isa_reg_str2val:
.LFB56:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	regs(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	xorl	%ebx, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movb	$0, (%rsi)
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L7:
	addq	$1, %rbx
	cmpq	$32, %rbx
	je	.L12
.L9:
	movq	(%r12,%rbx,8), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L7
	movslq	%ebx, %rbx
	leaq	cpu(%rip), %rax
	movb	$1, 0(%r13)
	movl	(%rax,%rbx,4), %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L12:
	.cfi_restore_state
	movq	%rbp, %rdx
	leaq	.LC1(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE56:
	.size	isa_reg_str2val, .-isa_reg_str2val
	.globl	regs
	.section	.rodata.str1.1
.LC2:
	.string	"$0"
.LC3:
	.string	"ra"
.LC4:
	.string	"sp"
.LC5:
	.string	"gp"
.LC6:
	.string	"tp"
.LC7:
	.string	"t0"
.LC8:
	.string	"t1"
.LC9:
	.string	"t2"
.LC10:
	.string	"s0"
.LC11:
	.string	"s1"
.LC12:
	.string	"a0"
.LC13:
	.string	"a1"
.LC14:
	.string	"a2"
.LC15:
	.string	"a3"
.LC16:
	.string	"a4"
.LC17:
	.string	"a5"
.LC18:
	.string	"a6"
.LC19:
	.string	"a7"
.LC20:
	.string	"s2"
.LC21:
	.string	"s3"
.LC22:
	.string	"s4"
.LC23:
	.string	"s5"
.LC24:
	.string	"s6"
.LC25:
	.string	"s7"
.LC26:
	.string	"s8"
.LC27:
	.string	"s9"
.LC28:
	.string	"s10"
.LC29:
	.string	"s11"
.LC30:
	.string	"t3"
.LC31:
	.string	"t4"
.LC32:
	.string	"t5"
.LC33:
	.string	"t6"
	.section	.data.rel.local,"aw"
	.align 32
	.type	regs, @object
	.size	regs, 256
regs:
	.quad	.LC2
	.quad	.LC3
	.quad	.LC4
	.quad	.LC5
	.quad	.LC6
	.quad	.LC7
	.quad	.LC8
	.quad	.LC9
	.quad	.LC10
	.quad	.LC11
	.quad	.LC12
	.quad	.LC13
	.quad	.LC14
	.quad	.LC15
	.quad	.LC16
	.quad	.LC17
	.quad	.LC18
	.quad	.LC19
	.quad	.LC20
	.quad	.LC21
	.quad	.LC22
	.quad	.LC23
	.quad	.LC24
	.quad	.LC25
	.quad	.LC26
	.quad	.LC27
	.quad	.LC28
	.quad	.LC29
	.quad	.LC30
	.quad	.LC31
	.quad	.LC32
	.quad	.LC33
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
