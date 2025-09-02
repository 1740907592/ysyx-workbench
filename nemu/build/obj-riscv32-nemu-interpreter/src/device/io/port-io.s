	.file	"port-io.i"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"src/device/io/port-io.c"
.LC1:
	.string	"nr_map < NR_MAP"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"addr + len <= PORT_IO_SPACE_MAX"
	.align 8
.LC3:
	.string	"\033[1;34m[%s:%d %s] Add port-io map '%s' at [0x%08x, 0x%08x]\033[0m\n"
	.text
	.p2align 4
	.globl	add_pio_map
	.type	add_pio_map, @function
add_pio_map:
.LFB62:
	.cfi_startproc
	endbr64
	movslq	nr_map(%rip), %rax
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	cmpl	$15, %eax
	jg	.L13
	movzwl	%si, %esi
	addl	%esi, %ecx
	cmpl	$65535, %ecx
	ja	.L14
	leaq	maps(%rip), %rbx
	salq	$5, %rax
	subl	$1, %ecx
	movq	%rdi, %r9
	addq	%rbx, %rax
	leaq	.LC0(%rip), %r12
	leaq	.LC3(%rip), %rbp
	movq	%rdi, (%rax)
	movl	$2, %edi
	movl	%esi, 8(%rax)
	movl	%ecx, 12(%rax)
	movq	%rdx, 16(%rax)
	movq	%r12, %rdx
	movq	%r8, 24(%rax)
	leaq	__func__.2(%rip), %r8
	xorl	%eax, %eax
	pushq	%rcx
	.cfi_def_cfa_offset 40
	movl	$30, %ecx
	pushq	%rsi
	.cfi_def_cfa_offset 48
	movq	%rbp, %rsi
	call	__printf_chk@PLT
	xorl	%eax, %eax
	call	log_enable@PLT
	popq	%rdx
	.cfi_def_cfa_offset 40
	popq	%rcx
	.cfi_def_cfa_offset 32
	testb	%al, %al
	je	.L4
	movq	log_fp(%rip), %rdi
	testq	%rdi, %rdi
	je	.L4
	subq	$8, %rsp
	.cfi_def_cfa_offset 40
	movl	$30, %r8d
	movq	%r12, %rcx
	movq	%rbp, %rdx
	movslq	nr_map(%rip), %rax
	leaq	__func__.2(%rip), %r9
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
.L4:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	addl	$1, nr_map(%rip)
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L14:
	.cfi_restore_state
	leaq	__PRETTY_FUNCTION__.3(%rip), %rcx
	movl	$27, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	call	__assert_fail@PLT
.L13:
	leaq	__PRETTY_FUNCTION__.3(%rip), %rcx
	movl	$26, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE62:
	.size	add_pio_map, .-add_pio_map
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"addr + len - 1 < PORT_IO_SPACE_MAX"
	.section	.rodata.str1.1
.LC5:
	.string	"mapid != -1"
	.text
	.p2align 4
	.globl	pio_read
	.type	pio_read, @function
pio_read:
.LFB63:
	.cfi_startproc
	endbr64
	movzwl	%di, %edi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	leal	(%rdi,%rsi), %eax
	cmpl	$65535, %eax
	jg	.L23
	movl	nr_map(%rip), %ecx
	testl	%ecx, %ecx
	jle	.L17
	leaq	8+maps(%rip), %rax
	xorl	%edx, %edx
.L20:
	cmpl	(%rax), %edi
	jb	.L18
	cmpl	%edi, 4(%rax)
	jb	.L18
	movslq	%edx, %rdx
	leaq	maps(%rip), %rax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	salq	$5, %rdx
	addq	%rax, %rdx
	jmp	map_read@PLT
	.p2align 4,,10
	.p2align 3
.L18:
	.cfi_restore_state
	addl	$1, %edx
	addq	$32, %rax
	cmpl	%edx, %ecx
	jne	.L20
.L17:
	leaq	__PRETTY_FUNCTION__.1(%rip), %rcx
	movl	$40, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC5(%rip), %rdi
	call	__assert_fail@PLT
.L23:
	leaq	__PRETTY_FUNCTION__.1(%rip), %rcx
	movl	$38, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC4(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE63:
	.size	pio_read, .-pio_read
	.p2align 4
	.globl	pio_write
	.type	pio_write, @function
pio_write:
.LFB64:
	.cfi_startproc
	endbr64
	movzwl	%di, %edi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	leal	(%rdi,%rsi), %eax
	cmpl	$65535, %eax
	jg	.L32
	movl	nr_map(%rip), %r8d
	testl	%r8d, %r8d
	jle	.L26
	leaq	8+maps(%rip), %rax
	xorl	%ecx, %ecx
.L29:
	cmpl	(%rax), %edi
	jb	.L27
	cmpl	%edi, 4(%rax)
	jb	.L27
	movslq	%ecx, %rcx
	leaq	maps(%rip), %rax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	salq	$5, %rcx
	addq	%rax, %rcx
	jmp	map_write@PLT
	.p2align 4,,10
	.p2align 3
.L27:
	.cfi_restore_state
	addl	$1, %ecx
	addq	$32, %rax
	cmpl	%ecx, %r8d
	jne	.L29
.L26:
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx
	movl	$47, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC5(%rip), %rdi
	call	__assert_fail@PLT
.L32:
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx
	movl	$45, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC4(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE64:
	.size	pio_write, .-pio_write
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 10
__PRETTY_FUNCTION__.0:
	.string	"pio_write"
	.align 8
	.type	__PRETTY_FUNCTION__.1, @object
	.size	__PRETTY_FUNCTION__.1, 9
__PRETTY_FUNCTION__.1:
	.string	"pio_read"
	.align 8
	.type	__func__.2, @object
	.size	__func__.2, 12
__func__.2:
	.string	"add_pio_map"
	.align 8
	.type	__PRETTY_FUNCTION__.3, @object
	.size	__PRETTY_FUNCTION__.3, 12
__PRETTY_FUNCTION__.3:
	.string	"add_pio_map"
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
