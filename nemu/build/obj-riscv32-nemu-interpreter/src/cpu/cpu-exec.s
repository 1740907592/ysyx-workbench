	.file	"cpu-exec.i"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	""
.LC1:
	.string	"src/cpu/cpu-exec.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"\033[1;34m[%s:%d %s] host time spent = %'lu us\033[0m\n"
	.align 8
.LC3:
	.string	"\033[1;34m[%s:%d %s] total guest instructions = %'lu\033[0m\n"
	.align 8
.LC4:
	.string	"\033[1;34m[%s:%d %s] simulation frequency = %'lu inst/s\033[0m\n"
	.align 8
.LC5:
	.string	"\033[1;34m[%s:%d %s] Finish running in less than 1 us and can not calculate the simulation frequency\033[0m\n"
	.text
	.p2align 4
	.type	statistic, @function
statistic:
.LFB66:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	leaq	.LC2(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	.LC1(%rip), %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	setlocale@PLT
	xorl	%eax, %eax
	movl	$107, %ecx
	movq	%rbx, %rdx
	movq	g_timer(%rip), %r9
	leaq	__func__.1(%rip), %r8
	movq	%rbp, %rsi
	movl	$2, %edi
	call	__printf_chk@PLT
	xorl	%eax, %eax
	call	log_enable@PLT
	testb	%al, %al
	je	.L2
	movq	log_fp(%rip), %rdi
	testq	%rdi, %rdi
	je	.L2
	subq	$8, %rsp
	.cfi_def_cfa_offset 40
	pushq	g_timer(%rip)
	.cfi_def_cfa_offset 48
	movq	%rbx, %rcx
	movq	%rbp, %rdx
	movl	$2, %esi
	leaq	__func__.1(%rip), %r9
	movl	$107, %r8d
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movq	log_fp(%rip), %rdi
	call	fflush@PLT
	popq	%rcx
	.cfi_def_cfa_offset 40
	popq	%rsi
	.cfi_def_cfa_offset 32
.L2:
	xorl	%eax, %eax
	movl	$108, %ecx
	movq	%rbx, %rdx
	movl	$2, %edi
	movq	g_nr_guest_inst(%rip), %r9
	leaq	.LC3(%rip), %rbp
	leaq	__func__.1(%rip), %r8
	movq	%rbp, %rsi
	call	__printf_chk@PLT
	xorl	%eax, %eax
	call	log_enable@PLT
	testb	%al, %al
	je	.L3
	movq	log_fp(%rip), %rdi
	testq	%rdi, %rdi
	je	.L3
	subq	$8, %rsp
	.cfi_def_cfa_offset 40
	pushq	g_nr_guest_inst(%rip)
	.cfi_def_cfa_offset 48
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	leaq	__func__.1(%rip), %r9
	movl	$108, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movq	log_fp(%rip), %rdi
	call	fflush@PLT
	popq	%rax
	.cfi_def_cfa_offset 40
	popq	%rdx
	.cfi_def_cfa_offset 32
.L3:
	movq	g_timer(%rip), %rcx
	testq	%rcx, %rcx
	je	.L4
	xorl	%edx, %edx
	leaq	.LC4(%rip), %rbp
	leaq	__func__.1(%rip), %r8
	movl	$2, %edi
	imulq	$1000000, g_nr_guest_inst(%rip), %rax
	movq	%rbp, %rsi
	divq	%rcx
	movl	$109, %ecx
	movq	%rbx, %rdx
	movq	%rax, %r9
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	call	log_enable@PLT
	testb	%al, %al
	je	.L1
	movq	log_fp(%rip), %rdi
	testq	%rdi, %rdi
	je	.L1
	xorl	%edx, %edx
	subq	$8, %rsp
	.cfi_def_cfa_offset 40
	movq	%rbx, %rcx
	movl	$109, %r8d
	imulq	$1000000, g_nr_guest_inst(%rip), %rax
	leaq	__func__.1(%rip), %r9
	movl	$2, %esi
	divq	g_timer(%rip)
	movq	%rbp, %rdx
	pushq	%rax
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movq	log_fp(%rip), %rdi
	addq	$24, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	fflush@PLT
	.p2align 4,,10
	.p2align 3
.L4:
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	movl	$110, %ecx
	movq	%rbx, %rdx
	movl	$2, %edi
	leaq	.LC5(%rip), %rbp
	leaq	__func__.1(%rip), %r8
	movq	%rbp, %rsi
	call	__printf_chk@PLT
	xorl	%eax, %eax
	call	log_enable@PLT
	testb	%al, %al
	jne	.L31
.L1:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L31:
	.cfi_restore_state
	movq	log_fp(%rip), %rdi
	testq	%rdi, %rdi
	je	.L1
	movq	%rbx, %rcx
	movq	%rbp, %rdx
	leaq	__func__.1(%rip), %r9
	xorl	%eax, %eax
	movl	$110, %r8d
	movl	$2, %esi
	call	__fprintf_chk@PLT
	movq	log_fp(%rip), %rdi
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	fflush@PLT
	.cfi_endproc
.LFE66:
	.size	statistic, .-statistic
	.section	.rodata.str1.8
	.align 8
.LC6:
	.string	"the user trigger watch point %d\n"
	.text
	.p2align 4
	.globl	examine_watch
	.type	examine_watch, @function
examine_watch:
.LFB62:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	call	getHead@PLT
	testq	%rax, %rax
	je	.L32
	movq	%rax, %rbx
	leaq	7(%rsp), %rbp
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L44:
	cmpq	%rax, 24(%rbx)
	jne	.L43
	movq	8(%rbx), %rbx
	testq	%rbx, %rbx
	je	.L32
.L33:
	movq	16(%rbx), %rdi
	movq	%rbp, %rsi
	movb	$0, 7(%rsp)
	call	expr@PLT
	cmpb	$0, 7(%rsp)
	movl	%eax, %eax
	je	.L44
.L32:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L45
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L43:
	.cfi_restore_state
	movl	(%rbx), %edx
	leaq	.LC6(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	movl	$1, nemu_state(%rip)
	call	__printf_chk@PLT
	jmp	.L32
.L45:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE62:
	.size	examine_watch, .-examine_watch
	.p2align 4
	.globl	assert_fail_msg
	.type	assert_fail_msg, @function
assert_fail_msg:
.LFB67:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	call	isa_reg_display@PLT
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	statistic
	.cfi_endproc
.LFE67:
	.size	assert_fail_msg, .-assert_fail_msg
	.section	.rodata.str1.1
.LC7:
	.string	"\033[1;31mHIT BAD TRAP\033[0m"
.LC8:
	.string	"\033[1;31mABORT\033[0m"
.LC9:
	.string	"\033[1;32mHIT GOOD TRAP\033[0m"
	.section	.rodata.str1.8
	.align 8
.LC10:
	.string	"Program execution has ended. To restart the program, exit NEMU and run again."
	.section	.rodata.str1.1
.LC11:
	.string	"0x%08x:"
.LC12:
	.string	" %02x"
.LC13:
	.string	"%s\n"
	.section	.rodata.str1.8
	.align 8
.LC14:
	.string	"\033[1;34m[%s:%d %s] nemu: %s at pc = 0x%08x\033[0m\n"
	.text
	.p2align 4
	.globl	cpu_exec
	.type	cpu_exec, @function
cpu_exec:
.LFB68:
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
	subq	$232, %rsp
	.cfi_def_cfa_offset 288
	movq	%rdi, 24(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 216(%rsp)
	xorl	%eax, %eax
	movl	nemu_state(%rip), %eax
	cmpq	$9, %rdi
	setbe	g_print_step(%rip)
	subl	$2, %eax
	cmpl	$2, %eax
	ja	.L49
	movq	216(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L94
	addq	$232, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	leaq	.LC10(%rip), %rdi
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
	jmp	puts@PLT
	.p2align 4,,10
	.p2align 3
.L49:
	.cfi_restore_state
	movl	$0, nemu_state(%rip)
	xorl	%eax, %eax
	call	get_time@PLT
	cmpq	$0, 24(%rsp)
	movq	%rax, 56(%rsp)
	je	.L51
	leaq	64(%rsp), %rax
	leaq	76(%rsp), %rbx
	movq	%rax, 40(%rsp)
	leaq	80(%rsp), %rax
	leaq	.LC12(%rip), %rbp
	movq	%rax, 16(%rsp)
	leaq	91(%rsp), %rax
	movq	%rax, 48(%rsp)
	leaq	208(%rsp), %rax
	movq	%rax, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L56:
	movd	128+cpu(%rip), %xmm1
	movq	40(%rsp), %rdi
	pshufd	$0xe0, %xmm1, %xmm0
	movq	%xmm0, 64(%rsp)
	call	isa_exec_once@PLT
	movl	72(%rsp), %eax
	movl	64(%rsp), %r9d
	leaq	.LC11(%rip), %r8
	movq	16(%rsp), %rdi
	movl	$128, %ecx
	movl	$2, %edx
	movl	$128, %esi
	movl	%eax, 128+cpu(%rip)
	xorl	%eax, %eax
	call	__snprintf_chk@PLT
	movl	68(%rsp), %r8d
	subl	64(%rsp), %r8d
	movl	%r8d, %r10d
	subl	$1, %r10d
	js	.L66
	movq	48(%rsp), %r14
	movslq	%r10d, %r15
	movl	%r8d, 12(%rsp)
	movl	$117, %r13d
	movq	%r15, %rax
	movl	$117, %r12d
	movq	%r14, %r15
	movq	%rax, %r14
	.p2align 4,,10
	.p2align 3
.L53:
	movzbl	(%rbx,%r14), %r9d
	movq	%r12, %rcx
	movl	$2, %edx
	movq	%r15, %rdi
	xorl	%eax, %eax
	movq	%rbp, %r8
	movl	$4, %esi
	call	__snprintf_chk@PLT
	movl	$128, %eax
	cmpq	%rax, %r12
	cmovnb	%r12, %rax
	leaq	3(%rax), %rcx
	movq	%rcx, %rdx
	subq	%r12, %rdx
	cmpq	%rax, %rdx
	cmovb	%rax, %rdx
	subq	%rcx, %r12
	movl	$144, %eax
	addq	%rdx, %r12
	cmpq	%rax, %r13
	cmovnb	%r13, %rax
	leaq	3(%rax), %rcx
	movq	%rcx, %rdx
	subq	%r13, %rdx
	cmpq	%rax, %rdx
	cmovb	%rax, %rdx
	subq	%rcx, %r13
	subq	$1, %r14
	addq	$3, %r15
	addq	%rdx, %r13
	testl	%r14d, %r14d
	jns	.L53
	movl	12(%rsp), %r8d
	movq	%r15, %r14
.L52:
	movl	$4, %eax
	movl	$0, %edx
	movq	%r13, %rcx
	movq	%r14, %rdi
	subl	%r8d, %eax
	movl	$32, %esi
	movl	%r8d, 12(%rsp)
	cmovs	%edx, %eax
	leal	1(%rax,%rax,2), %r12d
	movslq	%r12d, %r12
	movq	%r12, %rdx
	call	__memset_chk@PLT
	movl	32(%rsp), %esi
	leaq	(%r14,%r12), %rdi
	movq	%rbx, %rcx
	movl	64(%rsp), %edx
	movl	12(%rsp), %r8d
	subl	%edi, %esi
	call	disassemble@PLT
	xorl	%eax, %eax
	addq	$1, g_nr_guest_inst(%rip)
	call	log_enable@PLT
	testb	%al, %al
	je	.L54
	movq	log_fp(%rip), %rdi
	testq	%rdi, %rdi
	je	.L54
	movq	16(%rsp), %rcx
	leaq	.LC13(%rip), %rdx
	movl	$2, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movq	log_fp(%rip), %rdi
	call	fflush@PLT
.L54:
	cmpb	$0, g_print_step(%rip)
	jne	.L95
.L55:
	leaq	nemu_state(%rip), %rax
	movl	(%rax), %r9d
	testl	%r9d, %r9d
	jne	.L51
	subq	$1, 24(%rsp)
	jne	.L56
.L51:
	xorl	%eax, %eax
	call	get_time@PLT
	movq	56(%rsp), %rbx
	movq	%rax, %rdx
	movq	g_timer(%rip), %rax
	subq	%rbx, %rax
	addq	%rdx, %rax
	movq	%rax, g_timer(%rip)
	movl	nemu_state(%rip), %eax
	cmpl	$3, %eax
	jg	.L57
	cmpl	$1, %eax
	jg	.L58
	testl	%eax, %eax
	jne	.L48
	movl	$1, nemu_state(%rip)
.L48:
	movq	216(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L94
	addq	$232, %rsp
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
.L95:
	.cfi_restore_state
	movq	16(%rsp), %rdi
	call	puts@PLT
	jmp	.L55
	.p2align 4,,10
	.p2align 3
.L66:
	movq	48(%rsp), %r14
	movl	$117, %r13d
	jmp	.L52
.L57:
	cmpl	$4, %eax
	jne	.L48
.L61:
	movq	216(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L94
	addq	$232, %rsp
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
	jmp	statistic
.L58:
	.cfi_restore_state
	movl	4+nemu_state(%rip), %edx
	leaq	.LC8(%rip), %r9
	cmpl	$3, %eax
	je	.L62
	movl	8+nemu_state(%rip), %r8d
	leaq	.LC7(%rip), %r9
	leaq	.LC9(%rip), %rax
	testl	%r8d, %r8d
	cmove	%rax, %r9
.L62:
	subq	$8, %rsp
	.cfi_def_cfa_offset 296
	leaq	.LC1(%rip), %rbp
	xorl	%eax, %eax
	pushq	%rdx
	.cfi_def_cfa_offset 304
	movl	$2, %edi
	movq	%rbp, %rdx
	leaq	.LC14(%rip), %rbx
	movq	%rbx, %rsi
	leaq	__func__.0(%rip), %r8
	movl	$139, %ecx
	call	__printf_chk@PLT
	xorl	%eax, %eax
	call	log_enable@PLT
	popq	%rsi
	.cfi_def_cfa_offset 296
	popq	%rdi
	.cfi_def_cfa_offset 288
	testb	%al, %al
	je	.L61
	movq	log_fp(%rip), %rdi
	testq	%rdi, %rdi
	je	.L61
	cmpl	$3, nemu_state(%rip)
	movl	4+nemu_state(%rip), %edx
	leaq	.LC8(%rip), %rax
	je	.L63
	movl	8+nemu_state(%rip), %ecx
	leaq	.LC7(%rip), %rax
	testl	%ecx, %ecx
	leaq	.LC9(%rip), %rcx
	cmove	%rcx, %rax
.L63:
	pushq	%rdx
	.cfi_def_cfa_offset 296
	leaq	__func__.0(%rip), %r9
	movq	%rbx, %rdx
	movq	%rbp, %rcx
	pushq	%rax
	.cfi_def_cfa_offset 304
	movl	$139, %r8d
	movl	$2, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movq	log_fp(%rip), %rdi
	call	fflush@PLT
	popq	%rax
	.cfi_def_cfa_offset 296
	popq	%rdx
	.cfi_def_cfa_offset 288
	jmp	.L61
.L94:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE68:
	.size	cpu_exec, .-cpu_exec
	.section	.rodata
	.align 8
	.type	__func__.0, @object
	.size	__func__.0, 9
__func__.0:
	.string	"cpu_exec"
	.align 8
	.type	__func__.1, @object
	.size	__func__.1, 10
__func__.1:
	.string	"statistic"
	.local	g_print_step
	.comm	g_print_step,1,1
	.local	g_timer
	.comm	g_timer,8,8
	.globl	g_nr_guest_inst
	.bss
	.align 8
	.type	g_nr_guest_inst, @object
	.size	g_nr_guest_inst, 8
g_nr_guest_inst:
	.zero	8
	.globl	cpu
	.align 32
	.type	cpu, @object
	.size	cpu, 132
cpu:
	.zero	132
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
