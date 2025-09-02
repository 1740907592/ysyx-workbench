	.file	"expr.i"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"\033[1;31mregex compilation failed: %s\n%s\033[0m\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"src/monitor/sdb/expr.c"
.LC2:
	.string	"0"
	.text
	.p2align 4
	.globl	init_regex
	.type	init_regex, @function
init_regex:
.LFB54:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	leaq	re(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leaq	rules(%rip), %rbx
	leaq	240(%rbx), %r13
	subq	$152, %rsp
	.cfi_def_cfa_offset 192
	movq	%fs:40, %rax
	movq	%rax, 136(%rsp)
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L3:
	movq	(%rbx), %r12
	movl	$1, %edx
	movq	%rbp, %rdi
	movq	%r12, %rsi
	call	regcomp@PLT
	testl	%eax, %eax
	jne	.L8
	addq	$16, %rbx
	addq	$64, %rbp
	cmpq	%r13, %rbx
	jne	.L3
	movq	136(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L9
	addq	$152, %rsp
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
.L8:
	.cfi_restore_state
	movq	%rsp, %rbx
	movl	$128, %ecx
	movq	%rbp, %rsi
	movl	%eax, %edi
	movq	%rbx, %rdx
	call	regerror@PLT
	movq	stdout(%rip), %rdi
	call	fflush@PLT
	movq	%rbx, %rcx
	movl	$2, %esi
	movq	%r12, %r8
	movq	stderr(%rip), %rdi
	leaq	.LC0(%rip), %rdx
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movq	log_fp(%rip), %rdi
	call	fflush@PLT
	xorl	%eax, %eax
	call	assert_fail_msg@PLT
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx
	movl	$77, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	call	__assert_fail@PLT
.L9:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE54:
	.size	init_regex, .-init_regex
	.p2align 4
	.globl	intToString
	.type	intToString, @function
intToString:
.LFB55:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rsi, %r9
	subq	$48, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	testq	%rdi, %rdi
	jne	.L11
	movb	$48, (%rsp)
	movl	$1, %r10d
	movq	%rsp, %rsi
	xorl	%r8d, %r8d
	movl	$1, %edi
.L12:
	leaq	(%rsi,%r8), %rdx
	movq	%r9, %rax
	addq	%r9, %rdi
	.p2align 4,,10
	.p2align 3
.L16:
	movzbl	(%rdx), %ecx
	addq	$1, %rax
	subq	$1, %rdx
	movb	%cl, -1(%rax)
	cmpq	%rdi, %rax
	jne	.L16
	movb	$0, (%r9,%r10)
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L22
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L11:
	.cfi_restore_state
	movq	%rdi, %rcx
	movl	$0, %ebx
	js	.L23
.L13:
	movabsq	$7378697629483820647, %r11
	movq	%rsp, %rsi
	xorl	%r8d, %r8d
	movq	%rsi, %r10
	.p2align 4,,10
	.p2align 3
.L14:
	movq	%rcx, %rax
	movl	%r8d, %edi
	addq	$1, %r10
	addl	$1, %r8d
	imulq	%r11
	movq	%rcx, %rax
	sarq	$63, %rax
	sarq	$2, %rdx
	subq	%rax, %rdx
	leaq	(%rdx,%rdx,4), %rax
	addq	%rax, %rax
	subq	%rax, %rcx
	addl	$48, %ecx
	movb	%cl, -1(%r10)
	movq	%rdx, %rcx
	testq	%rdx, %rdx
	jne	.L14
	testl	%ebx, %ebx
	je	.L15
	addl	$2, %edi
	movslq	%r8d, %r8
	movslq	%edi, %rdi
	movb	$45, (%rsp,%r8)
	movq	%rdi, %r10
	movb	$0, (%rsp,%rdi)
	jmp	.L12
	.p2align 4,,10
	.p2align 3
.L23:
	negq	%rcx
	movl	$1, %ebx
	jmp	.L13
	.p2align 4,,10
	.p2align 3
.L15:
	movslq	%r8d, %r10
	movslq	%edi, %r8
	movb	$0, (%rsp,%r10)
	movq	%r10, %rdi
	jmp	.L12
.L22:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE55:
	.size	intToString, .-intToString
	.p2align 4
	.globl	check_parenthese
	.type	check_parenthese, @function
check_parenthese:
.LFB57:
	.cfi_startproc
	endbr64
	movl	%edi, %eax
	leaq	tokens(%rip), %rdx
	leaq	(%rax,%rax,8), %rcx
	xorl	%eax, %eax
	cmpl	$6, (%rdx,%rcx,4)
	jne	.L24
	movl	%esi, %ecx
	leaq	(%rcx,%rcx,8), %rcx
	cmpl	$7, (%rdx,%rcx,4)
	jne	.L24
	cmpl	%edi, %esi
	jb	.L32
	movslq	%edi, %rax
	xorl	%ecx, %ecx
	leaq	(%rax,%rax,8), %rax
	leaq	(%rdx,%rax,4), %rax
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L27:
	cmpl	$7, %edx
	jne	.L28
	subl	$1, %ecx
	jb	.L33
.L28:
	addl	$1, %edi
	addq	$36, %rax
	cmpl	%edi, %esi
	jb	.L35
.L29:
	movl	(%rax), %edx
	cmpl	$6, %edx
	jne	.L27
	addl	$1, %edi
	addl	$1, %ecx
	addq	$36, %rax
	cmpl	%edi, %esi
	jnb	.L29
.L35:
	xorl	%eax, %eax
	testl	%ecx, %ecx
	sete	%al
	ret
	.p2align 4,,10
	.p2align 3
.L33:
	xorl	%eax, %eax
.L24:
	ret
.L32:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE57:
	.size	check_parenthese, .-check_parenthese
	.p2align 4
	.globl	max
	.type	max, @function
max:
.LFB58:
	.cfi_startproc
	endbr64
	cmpq	%rsi, %rdi
	movq	%rsi, %rax
	cmovge	%rdi, %rax
	ret
	.cfi_endproc
.LFE58:
	.size	max, .-max
	.section	.rodata.str1.1
.LC3:
	.string	"enter valid expr"
.LC4:
	.string	"division zero, fault"
.LC5:
	.string	"NO type"
	.text
	.p2align 4
	.globl	eval
	.type	eval, @function
eval:
.LFB59:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
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
	cmpl	%esi, %edi
	jg	.L38
	movl	%edi, %r8d
	movl	%esi, %ebx
	jne	.L40
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L42:
	subl	$1, %ebx
	addl	$1, %r8d
	cmpl	%r8d, %ebx
	jl	.L38
	je	.L39
.L40:
	movl	%ebx, %esi
	movl	%r8d, %edi
	call	check_parenthese
	testl	%eax, %eax
	jne	.L42
	cmpl	%ebx, %r8d
	jg	.L44
	movslq	%r8d, %rax
	leaq	tokens(%rip), %r10
	xorl	%edi, %edi
	xorl	%r9d, %r9d
	leaq	(%rax,%rax,8), %rdx
	movl	$-1, %ebp
	leaq	(%r10,%rdx,4), %rcx
	xorl	%edx, %edx
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L46:
	cmpl	$7, %esi
	jne	.L48
	leal	-1(%rdx), %esi
	movl	%esi, %edx
	orl	%edi, %edx
	je	.L81
	movl	%esi, %edx
.L47:
	addq	$1, %rax
	addq	$36, %rcx
	cmpl	%eax, %ebx
	jl	.L82
.L53:
	movl	(%rcx), %esi
	cmpl	$6, %esi
	jne	.L46
	addl	$1, %edx
	movl	%edx, %esi
	orl	%edi, %esi
	cmove	%r9d, %edx
	cmove	%r9d, %edi
	addq	$1, %rax
	addq	$36, %rcx
	cmpl	%eax, %ebx
	jge	.L53
.L82:
	cmpl	$-1, %ebp
	je	.L44
	movslq	%ebp, %rax
	movl	%r8d, %edi
	leal	-1(%rbp), %esi
	leaq	(%rax,%rax,8), %rax
	movl	(%r10,%rax,4), %r13d
	call	eval
	movl	%ebx, %esi
	leal	1(%rbp), %edi
	movq	%rax, %r12
	call	eval
	movq	%rax, %rbx
	cmpl	$13, %r13d
	jg	.L55
	cmpl	$2, %r13d
	jle	.L56
	subl	$3, %r13d
	cmpl	$10, %r13d
	ja	.L56
	leaq	.L58(%rip), %rdx
	movslq	(%rdx,%r13,4), %rax
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L58:
	.long	.L64-.L58
	.long	.L63-.L58
	.long	.L62-.L58
	.long	.L56-.L58
	.long	.L56-.L58
	.long	.L56-.L58
	.long	.L56-.L58
	.long	.L61-.L58
	.long	.L60-.L58
	.long	.L59-.L58
	.long	.L57-.L58
	.text
	.p2align 4,,10
	.p2align 3
.L48:
	movl	%edx, %r11d
	orl	%edi, %r11d
	jne	.L47
	cmpl	$10, %esi
	je	.L49
	jg	.L50
	cmpl	$4, %esi
	jle	.L83
	cmpl	$5, %esi
	jne	.L70
.L49:
	movslq	%ebp, %rbp
	cmpq	%rbp, %rax
	cmovge	%rax, %rbp
	xorl	%edx, %edx
	xorl	%edi, %edi
	jmp	.L47
.L83:
	cmpl	$2, %esi
	jg	.L52
.L70:
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L81:
	xorl	%edi, %edi
	jmp	.L47
	.p2align 4,,10
	.p2align 3
.L39:
	movslq	%r8d, %r8
	leaq	tokens(%rip), %rax
	xorl	%esi, %esi
	leaq	(%r8,%r8,8), %rdx
	leaq	4(%rax,%rdx,4), %rdi
	movl	$10, %edx
	call	strtol@PLT
	movslq	%eax, %rbx
.L37:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movq	%rbx, %rax
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
.L50:
	.cfi_restore_state
	cmpl	$14, %esi
	jle	.L52
	cmpl	$257, %esi
	jne	.L70
.L52:
	movslq	%ebp, %rbp
	movl	$1, %edi
	cmpq	%rbp, %rax
	cmovge	%rax, %rbp
	xorl	%edx, %edx
	jmp	.L47
.L55:
	cmpq	%rax, %r12
	sete	%bl
	movzbl	%bl, %ebx
	cmpl	$257, %r13d
	je	.L37
	.p2align 4,,10
	.p2align 3
.L56:
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	.p2align 4,,10
	.p2align 3
.L38:
	movl	$2147483647, %ebx
	jmp	.L37
.L57:
	andq	%r12, %rbx
	jmp	.L37
.L59:
	orq	%r12, %rbx
	jmp	.L37
.L60:
	cmpq	%rbx, %r12
	setne	%bl
	movzbl	%bl, %ebx
	jmp	.L37
.L61:
	imulq	%r12, %rbx
	jmp	.L37
.L64:
	addq	%r12, %rbx
	jmp	.L37
.L62:
	testq	%rbx, %rbx
	je	.L84
	movq	%r12, %rax
	cqto
	idivq	%rbx
	movq	%rax, %rbx
	jmp	.L37
.L63:
	subq	%rbx, %r12
	movq	%r12, %rbx
	jmp	.L37
.L44:
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	jmp	.L38
.L84:
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	jmp	.L37
	.cfi_endproc
.LFE59:
	.size	eval, .-eval
	.section	.rodata.str1.1
.LC6:
	.string	"no token type: %d\n"
.LC7:
	.string	""
.LC8:
	.string	"no match loc at %d\n%s\n %*.s^\n"
.LC9:
	.string	"couldn't transmit"
	.text
	.p2align 4
	.globl	expr
	.type	expr, @function
expr:
.LFB60:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	xorl	%r12d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	%rsi, 8(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	movl	$0, nr_token(%rip)
.L86:
	movslq	%r12d, %rbx
	addq	%r13, %rbx
	cmpb	$0, (%rbx)
	je	.L141
.L95:
	leaq	re(%rip), %r14
	xorl	%r15d, %r15d
	leaq	16(%rsp), %rbp
	.p2align 4,,10
	.p2align 3
.L93:
	xorl	%r8d, %r8d
	movq	%rbp, %rcx
	movl	$1, %edx
	movq	%rbx, %rsi
	movq	%r14, %rdi
	call	regexec@PLT
	orl	16(%rsp), %eax
	je	.L142
	addl	$1, %r15d
	addq	$64, %r14
	cmpl	$15, %r15d
	jne	.L93
	leaq	.LC7(%rip), %r9
	movl	%r12d, %r8d
	movq	%r13, %rcx
	movl	%r12d, %edx
	leaq	.LC8(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L94:
	movq	8(%rsp), %rax
	movb	$0, (%rax)
	xorl	%eax, %eax
.L85:
	movq	24(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L143
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L142:
	.cfi_restore_state
	movslq	%r15d, %r9
	leaq	rules(%rip), %rax
	movl	20(%rsp), %ebp
	salq	$4, %r9
	movl	8(%rax,%r9), %edx
	addl	%ebp, %r12d
	cmpl	$14, %edx
	jg	.L88
	cmpl	$9, %edx
	jg	.L89
	cmpl	$7, %edx
	jg	.L90
	cmpl	$2, %edx
	jg	.L89
	cmpl	$1, %edx
	jne	.L91
.L90:
	movslq	nr_token(%rip), %rax
	leaq	tokens(%rip), %rdi
	leaq	(%rax,%rax,8), %rcx
	movq	%rax, %r15
	salq	$2, %rcx
	movl	%edx, (%rdi,%rcx)
	leaq	4(%rcx), %rax
	movl	$1152, %edx
	addq	%rax, %rdi
	cmpq	%rdx, %rax
	cmovb	%rdx, %rax
	xorl	%esi, %esi
	movl	$32, %edx
	subq	%rcx, %rax
	leaq	-4(%rax), %rcx
	call	__memset_chk@PLT
	movq	%rbx, %rsi
	movslq	%r12d, %rbx
	movslq	%ebp, %rdx
	movq	%rax, %rdi
	movl	$32, %ecx
	addq	%r13, %rbx
	call	__strncpy_chk@PLT
	leal	1(%r15), %r8d
	cmpb	$0, (%rbx)
	movl	%r8d, nr_token(%rip)
	jne	.L95
.L141:
	movl	nr_token(%rip), %r12d
	testl	%r12d, %r12d
	jle	.L96
	leaq	4+tokens(%rip), %rbx
	xorl	%ebp, %ebp
	leaq	16(%rsp), %r15
	.p2align 4,,10
	.p2align 3
.L116:
	movl	-4(%rbx), %eax
	movl	%ebp, %r13d
	addl	$1, %ebp
	cmpl	$9, %eax
	je	.L144
	cmpl	$8, %eax
	je	.L145
	cmpl	$4, %eax
	je	.L146
	cmpl	$10, %eax
	jne	.L106
	testl	%r13d, %r13d
	je	.L109
	movl	-40(%rbx), %eax
	leal	-8(%rax), %edx
	cmpl	$1, %edx
	jbe	.L106
	cmpl	$1, %eax
	jne	.L109
	.p2align 4,,10
	.p2align 3
.L106:
	movl	nr_token(%rip), %r12d
	leaq	36(%rbx), %r14
.L100:
	movq	%r14, %rbx
	cmpl	%ebp, %r12d
	jg	.L116
.L96:
	xorl	%edi, %edi
	leal	-1(%r12), %esi
	call	eval
	cmpq	$2147483647, %rax
	jne	.L85
	jmp	.L94
	.p2align 4,,10
	.p2align 3
.L88:
	cmpl	$256, %edx
	je	.L86
	cmpl	$257, %edx
	jne	.L91
.L89:
	movslq	nr_token(%rip), %rax
	leal	1(%rax), %ecx
	movl	%ecx, nr_token(%rip)
	leaq	(%rax,%rax,8), %rcx
	leaq	tokens(%rip), %rax
	movl	%edx, (%rax,%rcx,4)
	jmp	.L86
.L91:
	leaq	.LC6(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L86
.L109:
	leaq	36(%rbx), %r14
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%r14, %rdi
	call	strtol@PLT
	movl	32(%rbx), %edx
	cmpl	$8, %edx
	je	.L147
	cmpl	$1, %edx
	je	.L148
	cmpl	$9, %edx
	je	.L113
.L140:
	movl	%eax, %edi
.L111:
	movl	$4, %esi
	call	paddr_read@PLT
	movq	%r14, %rsi
	movslq	%eax, %rdi
	call	intToString
	movl	nr_token(%rip), %r12d
	cmpl	%ebp, %r12d
	jle	.L115
	leal	-2(%r12), %eax
	leaq	32(%rbx), %rsi
	subl	%r13d, %eax
	leaq	-4(%rbx), %rdi
	leaq	9(%rax,%rax,8), %rdx
	salq	$2, %rdx
	call	memmove@PLT
.L115:
	subl	$1, %r12d
	movl	%r12d, nr_token(%rip)
	jmp	.L100
.L146:
	cmpl	$1, -40(%rbx)
	je	.L149
	cmpl	$1, 32(%rbx)
	jne	.L106
	movl	%ebp, %r14d
.L105:
	movslq	%r14d, %rax
	leaq	tokens(%rip), %r8
	movl	$32, %edx
	leaq	(%rax,%rax,8), %rcx
	leaq	0(,%rcx,4), %r13
	leaq	3(%r8,%r13), %rsi
	leaq	4(%r8,%r13), %rdi
	call	memmove@PLT
	leaq	tokens(%rip), %r8
	leaq	(%r8,%r13), %rsi
	movb	$45, 4(%rsi)
	cmpl	%r12d, %r14d
	jge	.L150
	subl	$1, %r12d
	leaq	-36(%r8,%r13), %rdi
	movl	%r12d, %eax
	subl	%r14d, %eax
	leaq	9(%rax,%rax,8), %rdx
	salq	$2, %rdx
	call	memmove@PLT
.L108:
	movl	%r12d, nr_token(%rip)
	leaq	36(%rbx), %r14
	jmp	.L100
.L144:
	movq	%r15, %rsi
	movq	%rbx, %rdi
	movb	$1, 16(%rsp)
	call	isa_reg_str2val@PLT
	cmpb	$0, 16(%rsp)
	je	.L98
	movl	%eax, %edi
	movq	%rbx, %rsi
	call	intToString
	jmp	.L106
.L145:
	movl	$16, %edx
	xorl	%esi, %esi
	leaq	36(%rbx), %r14
	movq	%rbx, %rdi
	call	strtol@PLT
	movq	%rbx, %rsi
	movslq	%eax, %rdi
	call	intToString
	movl	nr_token(%rip), %r12d
	jmp	.L100
.L98:
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	jmp	.L106
.L149:
	testl	%r13d, %r13d
	jne	.L106
	movl	36+tokens(%rip), %r14d
	cmpl	$1, %r14d
	jne	.L106
	jmp	.L105
.L148:
	movq	%r14, %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movl	%eax, %edi
	jmp	.L111
.L147:
	movq	%r14, %rdi
	movl	$16, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movl	%eax, %edi
	jmp	.L111
.L113:
	leaq	16(%rsp), %rsi
	movq	%r14, %rdi
	movb	$0, 16(%rsp)
	call	isa_reg_str2val@PLT
	jmp	.L140
.L150:
	subl	$1, %r12d
	jmp	.L108
.L143:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE60:
	.size	expr, .-expr
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 11
__PRETTY_FUNCTION__.0:
	.string	"init_regex"
	.local	nr_token
	.comm	nr_token,4,4
	.local	tokens
	.comm	tokens,1152,32
	.globl	len
	.bss
	.align 4
	.type	len, @object
	.size	len, 4
len:
	.zero	4
	.local	re
	.comm	re,960,32
	.section	.rodata.str1.1
.LC10:
	.string	" +"
.LC11:
	.string	"\\+"
.LC12:
	.string	"\\-"
.LC13:
	.string	"\\*"
.LC14:
	.string	"\\/"
.LC15:
	.string	"\\("
.LC16:
	.string	"\\)"
.LC17:
	.string	"\\<\\="
.LC18:
	.string	"\\=\\="
.LC19:
	.string	"\\!\\="
.LC20:
	.string	"\\|\\|"
.LC21:
	.string	"\\&\\&"
.LC22:
	.string	"0[xX][0-9a-fA-F]+"
.LC23:
	.string	"[0-9]+"
.LC24:
	.string	"\\$?[a-zA-Z]*[0-9]*"
	.section	.data.rel.ro.local,"aw"
	.align 32
	.type	rules, @object
	.size	rules, 240
rules:
	.quad	.LC10
	.long	256
	.zero	4
	.quad	.LC11
	.long	3
	.zero	4
	.quad	.LC12
	.long	4
	.zero	4
	.quad	.LC13
	.long	10
	.zero	4
	.quad	.LC14
	.long	5
	.zero	4
	.quad	.LC15
	.long	6
	.zero	4
	.quad	.LC16
	.long	7
	.zero	4
	.quad	.LC17
	.long	14
	.zero	4
	.quad	.LC18
	.long	257
	.zero	4
	.quad	.LC19
	.long	11
	.zero	4
	.quad	.LC20
	.long	12
	.zero	4
	.quad	.LC21
	.long	13
	.zero	4
	.quad	.LC22
	.long	8
	.zero	4
	.quad	.LC23
	.long	1
	.zero	4
	.quad	.LC24
	.long	9
	.zero	4
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
