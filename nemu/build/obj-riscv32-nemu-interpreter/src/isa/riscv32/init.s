	.file	"init.i"
	.text
	.p2align 4
	.globl	init_isa
	.type	init_isa, @function
init_isa:
.LFB55:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$-2147483648, %edi
	call	guest_to_host@PLT
	movdqa	.LC0(%rip), %xmm0
	movl	$-559038737, 16(%rax)
	movups	%xmm0, (%rax)
	movl	$-2147483648, 128+cpu(%rip)
	movl	$0, cpu(%rip)
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE55:
	.size	init_isa, .-init_isa
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.quad	712633858654871
	.quad	4504093565568259
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
