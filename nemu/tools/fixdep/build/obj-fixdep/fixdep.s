	.file	"fixdep.i"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"fixdep"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4
	.type	xprintf, @function
xprintf:
.LFB70:
	.cfi_startproc
	subq	$216, %rsp
	.cfi_def_cfa_offset 224
	movq	%rsi, 40(%rsp)
	movq	%rdx, 48(%rsp)
	movq	%rcx, 56(%rsp)
	movq	%r8, 64(%rsp)
	movq	%r9, 72(%rsp)
	testb	%al, %al
	je	.L2
	movaps	%xmm0, 80(%rsp)
	movaps	%xmm1, 96(%rsp)
	movaps	%xmm2, 112(%rsp)
	movaps	%xmm3, 128(%rsp)
	movaps	%xmm4, 144(%rsp)
	movaps	%xmm5, 160(%rsp)
	movaps	%xmm6, 176(%rsp)
	movaps	%xmm7, 192(%rsp)
.L2:
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	movq	%rdi, %rdx
	leaq	224(%rsp), %rax
	movq	%rsp, %rcx
	movq	stdout(%rip), %rdi
	movq	%rax, 8(%rsp)
	movl	$2, %esi
	leaq	32(%rsp), %rax
	movl	$8, (%rsp)
	movl	$48, 4(%rsp)
	movq	%rax, 16(%rsp)
	call	__vfprintf_chk@PLT
	testl	%eax, %eax
	js	.L5
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L8
	addq	$216, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L8:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	xprintf.cold, @function
xprintf.cold:
.LFSB70:
.L5:
	.cfi_def_cfa_offset 224
	leaq	.LC0(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE70:
	.text
	.size	xprintf, .-xprintf
	.section	.text.unlikely
	.size	xprintf.cold, .-xprintf.cold
.LCOLDE1:
	.text
.LHOTE1:
	.section	.rodata.str1.1
.LC2:
	.string	"fixdep: error opening file: "
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"fixdep: error fstat'ing file: "
	.section	.rodata.str1.1
.LC4:
	.string	"fixdep: malloc"
.LC5:
	.string	"fixdep: read"
	.section	.text.unlikely
.LCOLDB6:
	.text
.LHOTB6:
	.p2align 4
	.type	read_file, @function
read_file:
.LFB79:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	xorl	%esi, %esi
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$168, %rsp
	.cfi_def_cfa_offset 208
	movq	%fs:40, %rax
	movq	%rax, 152(%rsp)
	xorl	%eax, %eax
	call	open@PLT
	testl	%eax, %eax
	js	.L19
	movq	%rsp, %rsi
	movl	%eax, %edi
	movl	%eax, %ebx
	call	fstat@PLT
	testl	%eax, %eax
	js	.L20
	movq	48(%rsp), %r12
	leaq	1(%r12), %r13
	movq	%r13, %rdi
	call	malloc@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L15
	movq	%r12, %rdx
	movq	%r13, %rcx
	movq	%rax, %rsi
	movl	%ebx, %edi
	call	__read_chk@PLT
	movq	%rax, %rdx
	movq	48(%rsp), %rax
	cmpq	%rdx, %rax
	jne	.L16
	movb	$0, 0(%rbp,%rax)
	movl	%ebx, %edi
	call	close@PLT
	movq	152(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L21
	addq	$168, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movq	%rbp, %rax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L19:
	.cfi_restore_state
	movq	stderr(%rip), %rcx
	movl	$28, %edx
	movl	$1, %esi
	leaq	.LC2(%rip), %rdi
.L18:
	call	fwrite@PLT
	movq	%rbp, %rdi
	call	perror@PLT
	movl	$2, %edi
	call	exit@PLT
.L21:
	call	__stack_chk_fail@PLT
.L20:
	movq	stderr(%rip), %rcx
	movl	$30, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rdi
	jmp	.L18
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	read_file.cold, @function
read_file.cold:
.LFSB79:
.L16:
	.cfi_def_cfa_offset 208
	.cfi_offset 3, -40
	.cfi_offset 6, -32
	.cfi_offset 12, -24
	.cfi_offset 13, -16
	leaq	.LC5(%rip), %rdi
	call	perror@PLT
	movl	$2, %edi
	call	exit@PLT
.L15:
	leaq	.LC4(%rip), %rdi
	call	perror@PLT
	movl	$2, %edi
	call	exit@PLT
	.cfi_endproc
.LFE79:
	.text
	.size	read_file, .-read_file
	.section	.text.unlikely
	.size	read_file.cold, .-read_file.cold
.LCOLDE6:
	.text
.LHOTE6:
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"Usage: fixdep <depfile> <target> <cmdline>\n"
	.section	.rodata.str1.1
.LC8:
	.string	"cmd_%s := %s\n\n"
.LC9:
	.string	"include/generated/autoconf.h"
.LC10:
	.string	"include/generated/autoksyms.h"
.LC11:
	.string	"source_%s := %s\n\n"
.LC12:
	.string	"deps_%s := \\\n"
.LC13:
	.string	"  %s \\\n"
.LC14:
	.string	"_MODULE"
.LC15:
	.string	"fixdep:malloc"
.LC16:
	.string	"include/config"
.LC17:
	.string	"    $(wildcard %s/"
.LC18:
	.string	".h) \\\n"
.LC19:
	.string	"CONFIG_"
	.section	.rodata.str1.8
	.align 8
.LC20:
	.string	"fixdep: parse error; no targets found\n"
	.section	.rodata.str1.1
.LC21:
	.string	"\n%s: $(deps_%s)\n\n"
.LC22:
	.string	"$(deps_%s):\n"
	.section	.text.unlikely
.LCOLDB23:
	.section	.text.startup,"ax",@progbits
.LHOTB23:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB82:
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
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	cmpl	$4, %edi
	jne	.L108
	movq	16(%rsi), %rax
	movq	8(%rsi), %rbx
	xorl	%r13d, %r13d
	leaq	.LC8(%rip), %rdi
	movq	24(%rsi), %rdx
	movl	%r13d, %r15d
	movq	%rax, %rsi
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	call	xprintf
	movq	%rbx, %rdi
	xorl	%ebx, %ebx
	call	read_file
	movq	%rax, %r12
	movq	%rax, %r13
	.p2align 4,,10
	.p2align 3
.L24:
	movzbl	(%r12), %eax
	cmpb	$32, %al
	sete	%dl
	cmpb	$92, %al
	sete	%cl
	orb	%cl, %dl
	jne	.L25
	cmpb	$10, %al
	je	.L25
	testb	%al, %al
	je	.L103
	movq	%r12, %rax
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L109:
	cmpb	$10, %bpl
	je	.L28
.L29:
	movq	%rax, %r14
	movzbl	1(%rax), %ebp
	addq	$1, %rax
	testb	$-33, %bpl
	je	.L27
	cmpb	$92, %bpl
	jne	.L109
.L28:
	cmpb	$58, -1(%rax)
	je	.L110
.L65:
	movq	%rax, %rsi
	subq	%r12, %rsi
	cmpl	$27, %esi
	jle	.L31
	movabsq	$3415246347922796137, %rdx
	movslq	%esi, %r8
	movabsq	$7310575239085057383, %rcx
	leaq	-28(%r12,%r8), %rdi
	xorq	(%rdi), %rdx
	xorq	8(%rdi), %rcx
	orq	%rcx, %rdx
	je	.L111
.L32:
	cmpl	$28, %esi
	je	.L31
	movabsq	$3415246347922796137, %rdx
	leaq	-29(%r12,%r8), %rsi
	movabsq	$7310575239085057383, %rcx
	xorq	(%rsi), %rdx
	xorq	8(%rsi), %rcx
	orq	%rcx, %rdx
	je	.L112
.L31:
	movb	$0, (%rax)
	testl	%r15d, %r15d
	je	.L36
	testl	%ebx, %ebx
	je	.L113
.L37:
	movl	%r15d, %ebx
.L38:
	movq	%r12, %rdi
	call	read_file
	movq	%r13, 56(%rsp)
	movq	%rax, 8(%rsp)
	movb	%bpl, 71(%rsp)
	movl	%ebx, 64(%rsp)
	movq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L39:
	leaq	.LC19(%rip), %rsi
	movq	%rbx, %rdi
	call	strstr@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L114
	call	__ctype_b_loc@PLT
	leaq	7(%rbp), %rbx
	movq	(%rax), %rcx
	cmpq	%rbp, 8(%rsp)
	jnb	.L40
	movsbq	-1(%rbp), %rdx
	testb	$8, (%rcx,%rdx,2)
	jne	.L39
	cmpb	$95, %dl
	je	.L39
.L40:
	movsbq	7(%rbp), %rdx
	testb	$8, (%rcx,%rdx,2)
	jne	.L67
	cmpb	$95, %dl
	jne	.L39
.L67:
	movq	%rbx, %r12
	.p2align 4,,10
	.p2align 3
.L42:
	movq	%r12, %rsi
	movsbq	1(%r12), %rax
	addq	$1, %r12
	movq	%rax, %rdx
	movzwl	(%rcx,%rax,2), %eax
	shrw	$3, %ax
	andl	$1, %eax
	cmpb	$95, %dl
	sete	%dl
	orb	%dl, %al
	jne	.L42
	movq	%r12, %rax
	movq	%r12, %r11
	subq	%rbx, %rax
	cmpl	$6, %eax
	jle	.L45
	cltq
	addq	%rbp, %rax
	cmpl	$1146047839, (%rax)
	je	.L115
.L46:
	movq	%r12, %r11
.L45:
	cmpq	%r11, %rbx
	jb	.L116
.L48:
	movq	%r12, %rbx
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L25:
	addq	$1, %r12
	jmp	.L24
	.p2align 4,,10
	.p2align 3
.L116:
	subq	%rbx, %r11
	movslq	%r11d, %r15
	movl	%r11d, %ecx
	testl	%r11d, %r11d
	je	.L70
	leal	-1(%r11), %edx
	movq	%rbx, %rax
	movl	$-2128831035, %r8d
	leaq	8(%rbp,%rdx), %rdx
	.p2align 4,,10
	.p2align 3
.L50:
	movsbl	(%rax), %esi
	addq	$1, %rax
	xorl	%esi, %r8d
	imull	$16777619, %r8d, %r8d
	cmpq	%rdx, %rax
	jne	.L50
.L49:
	movzbl	%r8b, %eax
	leaq	hashtab(%rip), %rdi
	movq	%rax, 48(%rsp)
	movq	(%rdi,%rax,8), %rax
	movq	%rax, 40(%rsp)
	testq	%rax, %rax
	je	.L51
	movq	%rbp, 24(%rsp)
	movl	%r8d, %r13d
	movl	%ecx, %ebp
	movq	%r12, 16(%rsp)
	movq	%rax, %r12
	movq	%r11, 32(%rsp)
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L52:
	movq	(%r12), %r12
	testq	%r12, %r12
	je	.L117
.L53:
	cmpl	%r13d, 12(%r12)
	jne	.L52
	cmpl	8(%r12), %ebp
	jne	.L52
	leaq	16(%r12), %rdi
	movq	%r15, %rdx
	movq	%rbx, %rsi
	call	memcmp@PLT
	testl	%eax, %eax
	jne	.L52
	movq	16(%rsp), %r12
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L117:
	movq	24(%rsp), %rbp
	movq	16(%rsp), %r12
	movl	%r13d, %r8d
	movq	32(%rsp), %r11
.L51:
	movslq	%r11d, %rdx
	movl	%r8d, 32(%rsp)
	leaq	16(%rdx), %r15
	movq	%r11, 24(%rsp)
	movq	%r15, %rdi
	movq	%rdx, 16(%rsp)
	call	malloc@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L99
	movl	$16, %eax
	movq	24(%rsp), %r11
	leaq	16(%r13), %rdi
	movq	%rbx, %rsi
	cmpq	%rax, %r15
	movq	16(%rsp), %rdx
	movl	32(%rsp), %r8d
	cmovnb	%r15, %rax
	movq	%r11, 16(%rsp)
	movl	%r8d, 24(%rsp)
	movq	%rax, %rcx
	subq	$16, %rcx
	call	__memcpy_chk@PLT
	movq	16(%rsp), %r11
	movq	40(%rsp), %rax
	leaq	.LC16(%rip), %rsi
	movl	24(%rsp), %r8d
	movq	48(%rsp), %rdi
	movl	%r11d, 8(%r13)
	movq	%rax, 0(%r13)
	leaq	hashtab(%rip), %rax
	movl	%r8d, 12(%r13)
	movq	%r13, (%rax,%rdi,8)
	leaq	.LC17(%rip), %rdi
	xorl	%eax, %eax
	call	xprintf
	movq	16(%rsp), %r11
	testl	%r11d, %r11d
	jle	.L60
	leal	-1(%r11), %eax
	movq	%rbx, %r15
	leaq	8(%rbp,%rax), %r13
	movl	$47, %ebp
	jmp	.L59
	.p2align 4,,10
	.p2align 3
.L118:
	call	__ctype_tolower_loc@PLT
	movq	(%rax), %rax
	movl	(%rax,%rbx,4), %ebx
	cmpl	$47, %ebx
	setne	%al
	cmpl	$47, %ebp
	jne	.L74
.L119:
	testb	%al, %al
	jne	.L74
	addq	$1, %r15
	cmpq	%r15, %r13
	je	.L60
.L72:
	movl	%ebx, %ebp
.L59:
	movsbq	(%r15), %rbx
	cmpb	$95, %bl
	jne	.L118
	xorl	%eax, %eax
	movl	$47, %ebx
	cmpl	$47, %ebp
	je	.L119
.L74:
	movq	stdout(%rip), %rsi
	movl	%ebx, %edi
	call	putc@PLT
	cmpl	$-1, %eax
	je	.L100
	addq	$1, %r15
	cmpq	%r15, %r13
	jne	.L72
.L60:
	leaq	.LC18(%rip), %rdi
	xorl	%eax, %eax
	call	xprintf
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L27:
	cmpb	$58, -1(%rax)
	jne	.L65
	movl	$1, %r15d
.L30:
	testb	%bpl, %bpl
	je	.L103
.L64:
	leaq	2(%r14), %r12
	jmp	.L24
	.p2align 4,,10
	.p2align 3
.L115:
	cmpl	$1162630468, 3(%rax)
	leaq	-6(%rsi), %r11
	jne	.L46
	jmp	.L45
	.p2align 4,,10
	.p2align 3
.L114:
	movzbl	71(%rsp), %ebp
	movq	8(%rsp), %rdi
	xorl	%r15d, %r15d
	movq	56(%rsp), %r13
	movl	64(%rsp), %ebx
	call	free@PLT
	testb	%bpl, %bpl
	jne	.L64
.L103:
	testl	%ebx, %ebx
	je	.L120
	movq	72(%rsp), %rbx
	leaq	.LC21(%rip), %rdi
	xorl	%eax, %eax
	movq	%rbx, %rdx
	movq	%rbx, %rsi
	call	xprintf
	movq	%rbx, %rsi
	xorl	%eax, %eax
	leaq	.LC22(%rip), %rdi
	call	xprintf
	movq	%r13, %rdi
	call	free@PLT
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
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
.L110:
	.cfi_restore_state
	movl	$1, %r15d
	jmp	.L64
.L111:
	movabsq	$8458093683423863154, %rdx
	xorq	12(%rdi), %rdx
	movabsq	$7507050253374418804, %rcx
	xorq	20(%rdi), %rcx
	orq	%rcx, %rdx
	jne	.L32
	jmp	.L30
.L36:
	movq	%r12, %rsi
	leaq	.LC13(%rip), %rdi
	xorl	%eax, %eax
	call	xprintf
	jmp	.L38
.L112:
	movabsq	$8391720336850515041, %rdx
	xorq	13(%rsi), %rdx
	movabsq	$7507064542899432303, %rcx
	xorq	21(%rsi), %rcx
	orq	%rcx, %rdx
	jne	.L31
	jmp	.L30
.L113:
	movq	72(%rsp), %rbx
	xorl	%eax, %eax
	movq	%r12, %rdx
	leaq	.LC11(%rip), %rdi
	movq	%rbx, %rsi
	call	xprintf
	movq	%rbx, %rsi
	leaq	.LC12(%rip), %rdi
	xorl	%eax, %eax
	call	xprintf
	jmp	.L37
.L70:
	movl	$-2128831035, %r8d
	jmp	.L49
.L108:
	movq	stderr(%rip), %rcx
	movl	$43, %edx
	movl	$1, %esi
	leaq	.LC7(%rip), %rdi
	call	fwrite@PLT
	movl	$1, %edi
	call	exit@PLT
.L120:
	movq	stderr(%rip), %rcx
	movl	$38, %edx
	movl	$1, %esi
	leaq	.LC20(%rip), %rdi
	call	fwrite@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	main.cold, @function
main.cold:
.LFSB82:
.L100:
	.cfi_def_cfa_offset 144
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	leaq	.LC0(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L99:
	leaq	.LC15(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE82:
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE23:
	.section	.text.startup
.LHOTE23:
	.local	hashtab
	.comm	hashtab,2048,32
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
