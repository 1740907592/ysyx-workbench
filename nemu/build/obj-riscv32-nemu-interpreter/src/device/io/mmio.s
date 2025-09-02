	.file	"mmio.i"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"\033[1;31mMMIO region %s@[0x%08x, 0x%08x] is overlapped with %s@[0x%08x, 0x%08x]\033[0m\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"src/device/io/mmio.c"
.LC2:
	.string	"0"
	.text
	.p2align 4
	.type	report_mmio_overlap, @function
report_mmio_overlap:
.LFB64:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%r9d, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%r8d, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rcx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%edx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movq	stdout(%rip), %rdi
	call	fflush@PLT
	subq	$8, %rsp
	.cfi_def_cfa_offset 72
	movq	%rbx, %rcx
	movl	%r12d, %r9d
	pushq	%r15
	.cfi_def_cfa_offset 80
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	pushq	%r14
	.cfi_def_cfa_offset 88
	leaq	.LC0(%rip), %rdx
	movl	%ebp, %r8d
	pushq	%r13
	.cfi_def_cfa_offset 96
	call	__fprintf_chk@PLT
	movq	log_fp(%rip), %rdi
	addq	$32, %rsp
	.cfi_def_cfa_offset 64
	call	fflush@PLT
	xorl	%eax, %eax
	call	assert_fail_msg@PLT
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx
	movl	$31, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE64:
	.size	report_mmio_overlap, .-report_mmio_overlap
	.section	.rodata.str1.1
.LC3:
	.string	"nr_map < NR_MAP"
.LC4:
	.string	"pmem"
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"\033[1;34m[%s:%d %s] Add mmio map '%s' at [0x%08x, 0x%08x]\033[0m\n"
	.text
	.p2align 4
	.globl	add_mmio_map
	.type	add_mmio_map, @function
add_mmio_map:
.LFB65:
	.cfi_startproc
	endbr64
	movl	%esi, %r10d
	movslq	nr_map(%rip), %rsi
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	cmpl	$15, %esi
	jg	.L21
	movq	%rdx, %r9
	leal	(%r10,%rcx), %eax
	leal	-2147483648(%r10), %edx
	leal	-1(%rax), %r11d
	cmpl	$134217727, %edx
	jbe	.L6
	addl	$2147483647, %eax
	cmpl	$134217727, %eax
	jbe	.L6
	leaq	8+maps(%rip), %rax
	xorl	%edx, %edx
	testl	%esi, %esi
	jle	.L8
	.p2align 4,,10
	.p2align 3
.L10:
	movl	4(%rax), %ecx
	cmpl	%r10d, %ecx
	jb	.L9
	movl	(%rax), %ebx
	cmpl	%ebx, %r11d
	jnb	.L22
.L9:
	addl	$1, %edx
	addq	$32, %rax
	cmpl	%edx, %esi
	jne	.L10
.L8:
	salq	$5, %rsi
	leaq	maps(%rip), %rbx
	leaq	.LC1(%rip), %r12
	movl	$50, %ecx
	leaq	(%rbx,%rsi), %rax
	leaq	.LC5(%rip), %rbp
	movq	%r12, %rdx
	movq	%rdi, (%rax)
	movq	%rbp, %rsi
	movl	%r10d, 8(%rax)
	movl	%r11d, 12(%rax)
	movq	%r9, 16(%rax)
	movq	%rdi, %r9
	movl	$2, %edi
	movq	%r8, 24(%rax)
	leaq	__func__.1(%rip), %r8
	xorl	%eax, %eax
	pushq	%r11
	.cfi_def_cfa_offset 40
	pushq	%r10
	.cfi_def_cfa_offset 48
	call	__printf_chk@PLT
	xorl	%eax, %eax
	call	log_enable@PLT
	popq	%rdx
	.cfi_def_cfa_offset 40
	popq	%rcx
	.cfi_def_cfa_offset 32
	testb	%al, %al
	je	.L11
	movq	log_fp(%rip), %rdi
	testq	%rdi, %rdi
	je	.L11
	subq	$8, %rsp
	.cfi_def_cfa_offset 40
	movl	$50, %r8d
	movq	%r12, %rcx
	movq	%rbp, %rdx
	movslq	nr_map(%rip), %rax
	leaq	__func__.1(%rip), %r9
	movl	$2, %esi
	salq	$5, %rax
	addq	%rax, %rbx
	movl	12(%rbx), %eax
	pushq	%rax
	.cfi_def_cfa_offset 48
	movl	8(%rbx), %eax
	pushq	%rax
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	pushq	(%rbx)
	.cfi_def_cfa_offset 64
	call	__fprintf_chk@PLT
	movq	log_fp(%rip), %rdi
	addq	$32, %rsp
	.cfi_def_cfa_offset 32
	call	fflush@PLT
.L11:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	addl	$1, nr_map(%rip)
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L22:
	.cfi_restore_state
	movslq	%edx, %rax
	leaq	maps(%rip), %rdx
	movl	%ecx, %r9d
	movl	%ebx, %r8d
	salq	$5, %rax
	movl	%r10d, %esi
	movq	(%rdx,%rax), %rax
	movl	%r11d, %edx
	movq	%rax, %rcx
	call	report_mmio_overlap
.L6:
	movl	$-2013265921, %r9d
	movl	$-2147483648, %r8d
	movl	%r11d, %edx
	movl	%r10d, %esi
	leaq	.LC4(%rip), %rcx
	call	report_mmio_overlap
.L21:
	leaq	__PRETTY_FUNCTION__.2(%rip), %rcx
	movl	$37, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE65:
	.size	add_mmio_map, .-add_mmio_map
	.p2align 4
	.globl	mmio_read
	.type	mmio_read, @function
mmio_read:
.LFB66:
	.cfi_startproc
	endbr64
	movl	nr_map(%rip), %ecx
	testl	%ecx, %ecx
	jle	.L28
	leaq	8+maps(%rip), %rdx
	xorl	%eax, %eax
.L27:
	cmpl	(%rdx), %edi
	jb	.L25
	cmpl	%edi, 4(%rdx)
	jb	.L25
	movslq	%eax, %rdx
	movq	%rdx, %rax
	leaq	maps(%rip), %rdx
	salq	$5, %rax
	addq	%rax, %rdx
	jmp	map_read@PLT
	.p2align 4,,10
	.p2align 3
.L25:
	addl	$1, %eax
	addq	$32, %rdx
	cmpl	%eax, %ecx
	jne	.L27
.L28:
	xorl	%edx, %edx
	jmp	map_read@PLT
	.cfi_endproc
.LFE66:
	.size	mmio_read, .-mmio_read
	.p2align 4
	.globl	mmio_write
	.type	mmio_write, @function
mmio_write:
.LFB67:
	.cfi_startproc
	endbr64
	movl	nr_map(%rip), %r8d
	testl	%r8d, %r8d
	jle	.L35
	leaq	8+maps(%rip), %rcx
	xorl	%eax, %eax
.L34:
	cmpl	(%rcx), %edi
	jb	.L32
	cmpl	%edi, 4(%rcx)
	jb	.L32
	movslq	%eax, %rcx
	movq	%rcx, %rax
	leaq	maps(%rip), %rcx
	salq	$5, %rax
	addq	%rax, %rcx
	jmp	map_write@PLT
	.p2align 4,,10
	.p2align 3
.L32:
	addl	$1, %eax
	addq	$32, %rcx
	cmpl	%eax, %r8d
	jne	.L34
.L35:
	xorl	%ecx, %ecx
	jmp	map_write@PLT
	.cfi_endproc
.LFE67:
	.size	mmio_write, .-mmio_write
	.section	.rodata
	.align 16
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 20
__PRETTY_FUNCTION__.0:
	.string	"report_mmio_overlap"
	.align 8
	.type	__func__.1, @object
	.size	__func__.1, 13
__func__.1:
	.string	"add_mmio_map"
	.align 8
	.type	__PRETTY_FUNCTION__.2, @object
	.size	__PRETTY_FUNCTION__.2, 13
__PRETTY_FUNCTION__.2:
	.string	"add_mmio_map"
	.local	nr_map
	.comm	nr_map,4,4
	.local	maps
	.comm	maps,512,32
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
