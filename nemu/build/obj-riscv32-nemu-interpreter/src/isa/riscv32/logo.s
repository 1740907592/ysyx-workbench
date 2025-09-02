	.file	"logo.i"
	.text
	.globl	isa_logo
	.data
	.align 32
	.type	isa_logo, @object
	.size	isa_logo, 403
isa_logo:
	.ascii	"       _                         __  __                     "
	.ascii	"    _ \n      (_)                       |  \\/  |           "
	.ascii	"            | |\n  _ __ _ ___"
	.string	"  ___ ________   __ | \\  / | __ _ _ __  _   _  __ _| |\n | '__| / __|/ __|______\\ \\ / / | |\\/| |/ _` | '_ \\| | | |/ _` | |\n | |  | \\__ \\ (__        \\ V /  | |  | | (_| | | | | |_| | (_| | |\n |_|  |_|___/\\___|        \\_/   |_|  |_|\\__,_|_| |_|\\__,_|\\__,_|_|\n"
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
