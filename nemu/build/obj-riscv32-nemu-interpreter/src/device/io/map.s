	.file	"map.i"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"\033[1;31maddress (0x%08x) is out of bound at pc = 0x%08x\033[0m\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"src/device/io/map.c"
.LC2:
	.string	"map != ((void *)0)"
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"\033[1;31maddress (0x%08x) is out of bound {%s} [0x%08x, 0x%08x] at pc = 0x%08x\033[0m\n"
	.align 8
.LC4:
	.string	"addr <= map->high && addr >= map->low"
	.text
	.p2align 4
	.type	check_bound, @function
check_bound:
.LFB65:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	testq	%rdi, %rdi
	je	.L8
	movq	%rdi, %rbx
	cmpl	%esi, 12(%rdi)
	jb	.L3
	cmpl	8(%rdi), %esi
	jnb	.L1
.L3:
	movq	stdout(%rip), %rdi
	call	fflush@PLT
	movl	128+cpu(%rip), %eax
	movq	(%rbx), %r8
	movl	%ebp, %ecx
	movq	stderr(%rip), %rdi
	leaq	.LC3(%rip), %rdx
	movl	$2, %esi
	pushq	%rax
	.cfi_def_cfa_offset 40
	movl	12(%rbx), %eax
	pushq	%rax
	.cfi_def_cfa_offset 48
	movl	8(%rbx), %r9d
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movq	log_fp(%rip), %rdi
	call	fflush@PLT
	xorl	%eax, %eax
	call	assert_fail_msg@PLT
	popq	%rax
	.cfi_def_cfa_offset 40
	popq	%rdx
	.cfi_def_cfa_offset 32
	cmpl	%ebp, 12(%rbx)
	jb	.L5
	cmpl	8(%rbx), %ebp
	jb	.L5
.L1:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L5:
	.cfi_restore_state
	leaq	__PRETTY_FUNCTION__.1(%rip), %rcx
	movl	$39, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC4(%rip), %rdi
	call	__assert_fail@PLT
.L8:
	movq	stdout(%rip), %rdi
	call	fflush@PLT
	movl	128+cpu(%rip), %r8d
	movl	%ebp, %ecx
	xorl	%eax, %eax
	movq	stderr(%rip), %rdi
	leaq	.LC0(%rip), %rdx
	movl	$2, %esi
	call	__fprintf_chk@PLT
	movq	log_fp(%rip), %rdi
	call	fflush@PLT
	xorl	%eax, %eax
	call	assert_fail_msg@PLT
	leaq	__PRETTY_FUNCTION__.1(%rip), %rcx
	movl	$37, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE65:
	.size	check_bound, .-check_bound
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"p_space - io_space < IO_SPACE_MAX"
	.text
	.p2align 4
	.globl	new_space
	.type	new_space, @function
new_space:
.LFB64:
	.cfi_startproc
	endbr64
	leal	4095(%rdi), %eax
	movq	p_space(%rip), %rdx
	andl	$-4096, %eax
	cltq
	addq	%rdx, %rax
	movq	%rax, p_space(%rip)
	subq	io_space(%rip), %rax
	cmpq	$33554431, %rax
	jg	.L14
	movq	%rdx, %rax
	ret
.L14:
	pushq	%rax
	.cfi_def_cfa_offset 16
	leaq	__PRETTY_FUNCTION__.4(%rip), %rcx
	movl	$31, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC5(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE64:
	.size	new_space, .-new_space
	.section	.rodata.str1.1
.LC6:
	.string	"io_space"
	.text
	.p2align 4
	.globl	init_map
	.type	init_map, @function
init_map:
.LFB67:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$33554432, %edi
	call	malloc@PLT
	movq	%rax, io_space(%rip)
	testq	%rax, %rax
	je	.L18
	movq	%rax, p_space(%rip)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L18:
	.cfi_restore_state
	leaq	__PRETTY_FUNCTION__.3(%rip), %rcx
	movl	$51, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE67:
	.size	init_map, .-init_map
	.section	.rodata.str1.1
.LC7:
	.string	"len >= 1 && len <= 8"
	.text
	.p2align 4
	.globl	map_read
	.type	map_read, @function
map_read:
.LFB68:
	.cfi_startproc
	endbr64
	leal	-1(%rsi), %eax
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	cmpl	$7, %eax
	ja	.L30
	movq	%rdx, %rbp
	movl	%edi, %ebx
	movl	%esi, %r12d
	movl	%edi, %esi
	movq	%rdx, %rdi
	call	check_bound
	movq	24(%rbp), %rax
	subl	8(%rbp), %ebx
	testq	%rax, %rax
	je	.L21
	xorl	%edx, %edx
	movl	%r12d, %esi
	movl	%ebx, %edi
	call	*%rax
.L21:
	addq	16(%rbp), %rbx
	cmpl	$2, %r12d
	je	.L22
	cmpl	$4, %r12d
	je	.L23
	xorl	%eax, %eax
	cmpl	$1, %r12d
	jne	.L19
	movzbl	(%rbx), %eax
.L19:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L23:
	.cfi_restore_state
	movl	(%rbx), %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L22:
	.cfi_restore_state
	movzwl	(%rbx), %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L30:
	.cfi_restore_state
	leaq	__PRETTY_FUNCTION__.2(%rip), %rcx
	movl	$56, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC7(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE68:
	.size	map_read, .-map_read
	.p2align 4
	.globl	map_write
	.type	map_write, @function
map_write:
.LFB69:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leal	-1(%rsi), %eax
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	cmpl	$7, %eax
	ja	.L38
	movq	%rcx, %rbp
	movl	%edi, %ebx
	movl	%esi, %r12d
	movl	%edi, %esi
	movq	%rcx, %rdi
	movl	%edx, %r13d
	call	check_bound
	subl	8(%rbp), %ebx
	movl	%ebx, %eax
	movq	%rax, %rdi
	addq	16(%rbp), %rax
	cmpl	$2, %r12d
	je	.L33
	cmpl	$4, %r12d
	je	.L34
	cmpl	$1, %r12d
	jne	.L35
	movb	%r13b, (%rax)
.L35:
	movq	24(%rbp), %rax
	testq	%rax, %rax
	je	.L31
.L39:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	%r12d, %esi
	movl	$1, %edx
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	*%rax
	.p2align 4,,10
	.p2align 3
.L34:
	.cfi_restore_state
	movl	%r13d, (%rax)
	movq	24(%rbp), %rax
	testq	%rax, %rax
	jne	.L39
.L31:
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
.L33:
	.cfi_restore_state
	movw	%r13w, (%rax)
	jmp	.L35
.L38:
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx
	movl	$65, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC7(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE69:
	.size	map_write, .-map_write
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 10
__PRETTY_FUNCTION__.0:
	.string	"map_write"
	.align 8
	.type	__PRETTY_FUNCTION__.1, @object
	.size	__PRETTY_FUNCTION__.1, 12
__PRETTY_FUNCTION__.1:
	.string	"check_bound"
	.align 8
	.type	__PRETTY_FUNCTION__.2, @object
	.size	__PRETTY_FUNCTION__.2, 9
__PRETTY_FUNCTION__.2:
	.string	"map_read"
	.align 8
	.type	__PRETTY_FUNCTION__.3, @object
	.size	__PRETTY_FUNCTION__.3, 9
__PRETTY_FUNCTION__.3:
	.string	"init_map"
	.align 8
	.type	__PRETTY_FUNCTION__.4, @object
	.size	__PRETTY_FUNCTION__.4, 10
__PRETTY_FUNCTION__.4:
	.string	"new_space"
	.local	p_space
	.comm	p_space,8,8
	.local	io_space
	.comm	io_space,8,8
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
