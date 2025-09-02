	.file	"intr.i"
	.text
	.p2align 4
	.globl	isa_raise_intr
	.type	isa_raise_intr, @function
isa_raise_intr:
.LFB53:
	.cfi_startproc
	endbr64
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE53:
	.size	isa_raise_intr, .-isa_raise_intr
	.p2align 4
	.globl	isa_query_intr
	.type	isa_query_intr, @function
isa_query_intr:
.LFB54:
	.cfi_startproc
	endbr64
	movl	$-1, %eax
	ret
	.cfi_endproc
.LFE54:
	.size	isa_query_intr, .-isa_query_intr
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
