	.file	"inst.i"
	.text
	.p2align 4
	.type	decode_exec, @function
decode_exec:
.LFB59:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	4(%rdi), %edx
	movl	12(%rdi), %ebx
	movl	%edx, 8(%rdi)
	movl	%ebx, %edx
	andl	$28799, %edx
	cmpl	$19, %edx
	je	.L35
	movl	%ebx, %ecx
	andl	$-33525633, %ecx
	cmpl	$4115, %ecx
	je	.L36
	cmpl	$8211, %edx
	je	.L32
	cmpl	$12307, %edx
	je	.L32
	cmpl	$16403, %edx
	je	.L37
	cmpl	$20499, %ecx
	je	.L38
	cmpl	$1073762323, %ecx
	je	.L39
	cmpl	$24595, %edx
	je	.L40
	cmpl	$28691, %edx
	je	.L41
	cmpl	$16387, %edx
	je	.L33
	cmpl	$3, %edx
	je	.L33
	cmpl	$4099, %edx
	je	.L42
	cmpl	$8195, %edx
	je	.L43
	movq	%rdi, %rax
	cmpl	$103, %edx
	je	.L44
	cmpl	$51, %ecx
	je	.L45
	cmpl	$33554483, %ecx
	je	.L46
	cmpl	$1073741875, %ecx
	je	.L47
	cmpl	$4147, %ecx
	je	.L48
	cmpl	$8243, %ecx
	je	.L49
	cmpl	$16435, %ecx
	je	.L50
	movl	%ebx, %ecx
	andl	$127, %ecx
	cmpl	$111, %ecx
	je	.L51
	cmpl	$35, %edx
	je	.L52
	cmpl	$4131, %edx
	je	.L53
	cmpl	$8227, %edx
	je	.L54
	cmpl	$23, %ecx
	je	.L55
	cmpl	$55, %ecx
	je	.L56
	cmpl	$99, %edx
	je	.L57
	movl	%ebx, %ecx
	andl	$12415, %ecx
	cmpl	$4195, %ecx
	je	.L3
	cmpl	$16483, %edx
	je	.L3
	movl	(%rdi), %esi
	cmpl	$1048691, %ebx
	jne	.L30
	movl	40+cpu(%rip), %edx
	movl	$2, %edi
	call	set_nemu_state@PLT
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L36:
	movl	%ebx, %edx
	leaq	cpu(%rip), %rsi
	movl	%ebx, %eax
	movl	%ebx, %ecx
	shrl	$15, %edx
	shrl	$7, %eax
	andl	$31, %edx
	shrl	$20, %ecx
	andl	$31, %eax
	movl	(%rsi,%rdx,4), %edx
	sall	%cl, %edx
	movl	%edx, (%rsi,%rax,4)
.L3:
	endbr64
	movl	$0, cpu(%rip)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L35:
	.cfi_restore_state
	movl	%ebx, %edx
	movl	%ebx, %eax
	leaq	cpu(%rip), %rcx
	sarl	$20, %ebx
	shrl	$15, %edx
	shrl	$7, %eax
	andl	$31, %edx
	andl	$31, %eax
	addl	(%rcx,%rdx,4), %ebx
	movl	%ebx, (%rcx,%rax,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L32:
	movl	%ebx, %edx
	movl	%ebx, %eax
	leaq	cpu(%rip), %rcx
	sarl	$20, %ebx
	shrl	$15, %edx
	shrl	$7, %eax
	andl	$31, %edx
	andl	$31, %eax
	cmpl	(%rcx,%rdx,4), %ebx
	seta	%dl
	movzbl	%dl, %edx
	movl	%edx, (%rcx,%rax,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L37:
	movl	%ebx, %edx
	movl	%ebx, %eax
	leaq	cpu(%rip), %rcx
	sarl	$20, %ebx
	shrl	$15, %edx
	shrl	$7, %eax
	andl	$31, %edx
	andl	$31, %eax
	xorl	(%rcx,%rdx,4), %ebx
	movl	%ebx, (%rcx,%rax,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L40:
	movl	%ebx, %edx
	movl	%ebx, %eax
	leaq	cpu(%rip), %rcx
	sarl	$20, %ebx
	shrl	$15, %edx
	shrl	$7, %eax
	andl	$31, %edx
	andl	$31, %eax
	orl	(%rcx,%rdx,4), %ebx
	movl	%ebx, (%rcx,%rax,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L38:
	movl	%ebx, %edx
	leaq	cpu(%rip), %rsi
	movl	%ebx, %eax
	movl	%ebx, %ecx
	shrl	$15, %edx
	shrl	$7, %eax
	andl	$31, %edx
	shrl	$20, %ecx
	andl	$31, %eax
	movl	(%rsi,%rdx,4), %edx
	shrl	%cl, %edx
	movl	%edx, (%rsi,%rax,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L39:
	shrl	$7, %ebx
	leaq	cpu(%rip), %rax
	andl	$31, %ebx
	movl	$0, (%rax,%rbx,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L33:
	movl	%ebx, %eax
	leaq	cpu(%rip), %rbp
	movl	%ebx, %edi
	movl	$1, %esi
	shrl	$15, %eax
	sarl	$20, %edi
	andl	$31, %eax
	shrl	$7, %ebx
	addl	0(%rbp,%rax,4), %edi
	andl	$31, %ebx
	call	vaddr_read@PLT
	movl	%eax, 0(%rbp,%rbx,4)
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L41:
	movl	%ebx, %edx
	movl	%ebx, %eax
	leaq	cpu(%rip), %rcx
	sarl	$20, %ebx
	shrl	$15, %edx
	shrl	$7, %eax
	andl	$31, %edx
	andl	$31, %eax
	andl	(%rcx,%rdx,4), %ebx
	movl	%ebx, (%rcx,%rax,4)
	jmp	.L3
.L42:
	movl	%ebx, %eax
	leaq	cpu(%rip), %rbp
	movl	%ebx, %edi
	movl	$2, %esi
	shrl	$15, %eax
	sarl	$20, %edi
	andl	$31, %eax
	shrl	$7, %ebx
	addl	0(%rbp,%rax,4), %edi
	andl	$31, %ebx
	call	vaddr_read@PLT
	movl	%eax, 0(%rbp,%rbx,4)
	jmp	.L3
.L43:
	movl	%ebx, %eax
	leaq	cpu(%rip), %rbp
	movl	%ebx, %edi
	movl	$4, %esi
	shrl	$15, %eax
	sarl	$20, %edi
	andl	$31, %eax
	shrl	$7, %ebx
	addl	0(%rbp,%rax,4), %edi
	andl	$31, %ebx
	call	vaddr_read@PLT
	movl	%eax, 0(%rbp,%rbx,4)
	jmp	.L3
.L44:
	movl	%ebx, %edx
	leaq	cpu(%rip), %rsi
	movl	(%rax), %ecx
	shrl	$15, %edx
	andl	$31, %edx
	addl	$4, %ecx
	movl	(%rsi,%rdx,4), %edi
	movl	%ebx, %edx
	sarl	$20, %ebx
	shrl	$7, %edx
	andl	$31, %edx
	movl	%ecx, (%rsi,%rdx,4)
	leal	(%rbx,%rdi), %edx
	movl	%edx, 8(%rax)
	jmp	.L3
.L45:
	movl	%ebx, %esi
	movl	%ebx, %edx
	leaq	cpu(%rip), %rax
	movl	%ebx, %ecx
	shrl	$15, %esi
	shrl	$7, %edx
	andl	$31, %esi
	shrl	$20, %ecx
	andl	$31, %edx
	movl	(%rax,%rcx,4), %ecx
	addl	(%rax,%rsi,4), %ecx
	movl	%ecx, (%rax,%rdx,4)
	jmp	.L3
.L46:
	movl	%ebx, %ecx
	movl	%ebx, %esi
	leaq	cpu(%rip), %rax
	movl	%ebx, %edx
	shrl	$15, %ecx
	shrl	$20, %esi
	andl	$31, %ecx
	andl	$31, %esi
	shrl	$7, %edx
	movl	(%rax,%rcx,4), %ecx
	imull	(%rax,%rsi,4), %ecx
	andl	$31, %edx
	movl	%ecx, (%rax,%rdx,4)
	jmp	.L3
.L47:
	movl	%ebx, %ecx
	movl	%ebx, %esi
	leaq	cpu(%rip), %rax
	movl	%ebx, %edx
	shrl	$15, %ecx
	shrl	$20, %esi
	shrl	$7, %edx
	andl	$31, %ecx
	andl	$31, %esi
	movl	(%rax,%rcx,4), %ecx
	andl	$31, %edx
	subl	(%rax,%rsi,4), %ecx
	movl	%ecx, (%rax,%rdx,4)
	jmp	.L3
.L48:
	movl	%ebx, %esi
	movl	%ebx, %ecx
	leaq	cpu(%rip), %rax
	movl	%ebx, %edx
	shrl	$15, %esi
	shrl	$20, %ecx
	andl	$31, %esi
	movl	(%rax,%rcx,4), %ecx
	shrl	$7, %edx
	movl	(%rax,%rsi,4), %esi
	andl	$31, %edx
	sall	%cl, %esi
	movl	%esi, (%rax,%rdx,4)
	jmp	.L3
.L49:
	movl	%ebx, %esi
	movl	%ebx, %edx
	leaq	cpu(%rip), %rax
	movl	%ebx, %ecx
	shrl	$15, %esi
	shrl	$20, %ecx
	shrl	$7, %edx
	andl	$31, %esi
	movl	(%rax,%rcx,4), %edi
	xorl	%ecx, %ecx
	andl	$31, %edx
	cmpl	%edi, (%rax,%rsi,4)
	setb	%cl
	movl	%ecx, (%rax,%rdx,4)
	jmp	.L3
.L50:
	movl	%ebx, %ecx
	movl	%ebx, %edx
	leaq	cpu(%rip), %rax
	movl	%ebx, %esi
	shrl	$15, %ecx
	shrl	$7, %edx
	andl	$31, %ecx
	shrl	$20, %esi
	andl	$31, %edx
	movl	(%rax,%rcx,4), %ecx
	xorl	(%rax,%rsi,4), %ecx
	movl	%ecx, (%rax,%rdx,4)
	jmp	.L3
.L51:
	movl	(%rdi), %esi
	movl	%ebx, %edx
	leaq	cpu(%rip), %rcx
	shrl	$7, %edx
	andl	$31, %edx
	leal	4(%rsi), %edi
	movl	%edi, (%rcx,%rdx,4)
	movl	%ebx, %edx
	movl	%ebx, %ecx
	shrl	%edx
	shrl	$10, %ecx
	andl	$1024, %ecx
	andl	$522240, %edx
	orl	%ecx, %edx
	movl	%ebx, %ecx
	sarl	$31, %ebx
	shrl	$21, %ecx
	andl	$1023, %ecx
	orl	%ecx, %edx
	movsbq	%bl, %rcx
	sall	$19, %ecx
	orl	%ecx, %edx
	leal	(%rsi,%rdx,2), %edx
	movl	%edx, 8(%rax)
	jmp	.L3
.L52:
	movl	%ebx, %eax
	leaq	cpu(%rip), %rdx
	movl	%ebx, %edi
	movl	$1, %esi
	shrl	$20, %eax
	shrl	$7, %edi
	andl	$31, %eax
	andl	$31, %edi
	movl	(%rdx,%rax,4), %ecx
	movl	%ebx, %eax
	sarl	$20, %eax
	andl	$-32, %eax
	orl	%eax, %edi
	movl	%ebx, %eax
	shrl	$15, %eax
	andl	$31, %eax
	addl	(%rdx,%rax,4), %edi
	movl	%ecx, %edx
	call	vaddr_write@PLT
	jmp	.L3
.L30:
	movl	%esi, %edi
	call	invalid_inst@PLT
	jmp	.L3
.L53:
	movl	%ebx, %eax
	leaq	cpu(%rip), %rdx
	movl	%ebx, %edi
	movl	$2, %esi
	shrl	$20, %eax
	shrl	$7, %edi
	andl	$31, %eax
	andl	$31, %edi
	movl	(%rdx,%rax,4), %ecx
	movl	%ebx, %eax
	sarl	$20, %eax
	andl	$-32, %eax
	orl	%eax, %edi
	movl	%ebx, %eax
	shrl	$15, %eax
	andl	$31, %eax
	addl	(%rdx,%rax,4), %edi
	movl	%ecx, %edx
	call	vaddr_write@PLT
	jmp	.L3
.L57:
	movl	(%rdi), %edx
	movl	%edx, 8(%rdi)
	jmp	.L3
.L56:
	movl	%ebx, %eax
	leaq	cpu(%rip), %rdx
	andl	$-4096, %ebx
	shrl	$7, %eax
	andl	$31, %eax
	movl	%ebx, (%rdx,%rax,4)
	jmp	.L3
.L55:
	movl	%ebx, %edx
	leaq	cpu(%rip), %rcx
	andl	$-4096, %ebx
	addl	(%rdi), %ebx
	shrl	$7, %edx
	andl	$31, %edx
	movl	%ebx, (%rcx,%rdx,4)
	jmp	.L3
.L54:
	movl	%ebx, %eax
	leaq	cpu(%rip), %rdx
	movl	%ebx, %edi
	movl	$4, %esi
	shrl	$20, %eax
	shrl	$7, %edi
	andl	$31, %eax
	andl	$31, %edi
	movl	(%rdx,%rax,4), %ecx
	movl	%ebx, %eax
	sarl	$20, %eax
	andl	$-32, %eax
	orl	%eax, %edi
	movl	%ebx, %eax
	shrl	$15, %eax
	andl	$31, %eax
	addl	(%rdx,%rax,4), %edi
	movl	%ecx, %edx
	call	vaddr_write@PLT
	jmp	.L3
	.cfi_endproc
.LFE59:
	.size	decode_exec, .-decode_exec
	.p2align 4
	.globl	isa_exec_once
	.type	isa_exec_once, @function
isa_exec_once:
.LFB60:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movl	4(%rdi), %edi
	movl	$4, %esi
	call	vaddr_ifetch@PLT
	addl	$4, 4(%rbx)
	movq	%rbx, %rdi
	movl	%eax, 12(%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	decode_exec
	.cfi_endproc
.LFE60:
	.size	isa_exec_once, .-isa_exec_once
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
