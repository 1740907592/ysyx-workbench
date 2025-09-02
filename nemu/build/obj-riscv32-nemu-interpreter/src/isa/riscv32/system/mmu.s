	.file	"mmu.i"
	.text
	.p2align 4
	.globl	isa_mmu_translate
	.type	isa_mmu_translate, @function
isa_mmu_translate:
.LFB54:
	.cfi_startproc
	endbr64
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE54:
	.size	isa_mmu_translate, .-isa_mmu_translate
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
