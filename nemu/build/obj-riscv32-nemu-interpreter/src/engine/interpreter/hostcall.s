	.file	"hostcall.i"
	.text
	.p2align 4
	.globl	set_nemu_state
	.type	set_nemu_state, @function
set_nemu_state:
.LFB61:
	.cfi_startproc
	endbr64
	movl	%edi, nemu_state(%rip)
	movl	%esi, 4+nemu_state(%rip)
	movl	%edx, 8+nemu_state(%rip)
	ret
	.cfi_endproc
.LFE61:
	.size	set_nemu_state, .-set_nemu_state
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"invalid opcode(PC = 0x%08x):\n\t%02x %02x %02x %02x %02x %02x %02x %02x ...\n\t%08x %08x...\n"
	.align 8
.LC1:
	.string	"There are two cases which will trigger this unexpected exception:\n1. The instruction at PC = 0x%08x is not implemented.\n2. Something is implemented incorrectly.\n"
	.align 8
.LC2:
	.string	"Find this PC(0x%08x) in the disassembling result to distinguish which case it is.\n\n"
	.align 8
.LC3:
	.string	"\033[1;31mIf it is the first case, see\n%s\nfor more details.\n\nIf it is the second case, remember:\n* The machine is always right!\n* Every line of untested code is always wrong!\n\n\033[0m"
	.text
	.p2align 4
	.globl	invalid_inst
	.type	invalid_inst, @function
invalid_inst:
.LFB62:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$4, %esi
	movl	%edi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	vaddr_ifetch@PLT
	leal	4(%rbp), %edi
	movl	$4, %esi
	movl	%eax, %ebx
	call	vaddr_ifetch@PLT
	subq	$8, %rsp
	.cfi_def_cfa_offset 40
	movzbl	%bh, %ecx
	movl	%ebx, %r9d
	movl	%eax, %edx
	pushq	%rax
	.cfi_def_cfa_offset 48
	movl	%ecx, %r8d
	movzbl	%bl, %ecx
	shrl	$24, %edx
	pushq	%rbx
	.cfi_def_cfa_offset 56
	shrl	$24, %ebx
	leaq	.LC0(%rip), %rsi
	pushq	%rdx
	.cfi_def_cfa_offset 64
	movl	%eax, %edx
	shrl	$16, %r9d
	movl	$2, %edi
	shrl	$16, %edx
	movzbl	%r9b, %r9d
	movzbl	%dl, %edx
	pushq	%rdx
	.cfi_def_cfa_offset 72
	movzbl	%ah, %edx
	movzbl	%al, %eax
	pushq	%rdx
	.cfi_def_cfa_offset 80
	movl	%ebp, %edx
	pushq	%rax
	.cfi_def_cfa_offset 88
	xorl	%eax, %eax
	pushq	%rbx
	.cfi_def_cfa_offset 96
	call	__printf_chk@PLT
	addq	$64, %rsp
	.cfi_def_cfa_offset 32
	movl	%ebp, %edx
	movl	$2, %edi
	leaq	.LC1(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	%ebp, %edx
	leaq	.LC2(%rip), %rsi
	xorl	%eax, %eax
	movl	$2, %edi
	call	__printf_chk@PLT
	leaq	isa_logo(%rip), %rdx
	leaq	.LC3(%rip), %rsi
	xorl	%eax, %eax
	movl	$2, %edi
	call	__printf_chk@PLT
	movl	%ebp, 4+nemu_state(%rip)
	movl	$3, nemu_state(%rip)
	movl	$-1, 8+nemu_state(%rip)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE62:
	.size	invalid_inst, .-invalid_inst
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
