	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	input
	.bss
	.align 32
	.type	input, @object
	.size	input, 10001
input:                                                  # char input[SIZE];
	.zero	10001
	.section	.rodata
	.align 8
.LC11:
	.string	"\320\222 \321\201\321\202\321\200\320\276\320\272\321\203 \320\262\320\276\321\210\320\273\320\270 \321\202\320\260\320\272\320\270\320\265 \320\267\320\275\320\260\320\272\320\270 \320\277\321\200\320\265\320\277\320\270\320\275\320\260\320\275\320\270\321\217:\n"
	.align 8
.LC12:
	.string	"\320\236\321\202\320\262\320\265\321\202 \320\267\320\260\320\277\320\270\321\201\320\260\320\275 \320\262 \321\204\320\260\320\271\320\273"
	.text
	.globl	outputResult
	.type	outputResult, @function
outputResult:
	push	rbp
	mov	rbp, rsp
	
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi                  # FILE *output
	mov	rax, QWORD PTR -8[rbp]                  # FILE *output
	mov	rcx, rax
	mov	edx, 71
	mov	esi, 1
	lea	rax, .LC11[rip]
	mov	rdi, rax
	call	fwrite@PLT
	mov	rax, QWORD PTR -8[rbp]                  # FILE *output
	mov	rdi, rax                                # FILE *output
	call	outputStruct                            # outputStruct(output);
	mov	rax, QWORD PTR stdout[rip]
	cmp	QWORD PTR -8[rbp], rax
	je	.L38
	lea	rax, .LC12[rip]
	mov	rdi, rax
	call	puts@PLT
.L38:
	nop
	leave
	ret
	.size	outputResult, .-outputResult
	.section	.rodata
	.align 8
.LC13:
	.string	"\320\224\320\273\320\270\320\275\320\260 \321\201\321\202\321\200\320\276\320\272\320\270 \320\275\320\265 \320\264\320\276\320\273\320\266\320\275\320\260 \320\277\320\265\321\200\320\262\321\213\321\210\320\260\321\202\321\214 10000 \321\201\320\270\320\274\320\262\320\276\320\273\320\276\320\262"
	.align 8
.LC14:
	.string	"\320\241\320\263\320\265\320\275\320\265\321\200\320\270\321\200\320\276\320\262\320\260\320\275\320\275\320\260\321\217 \321\201\321\202\321\200\320\276\320\272\320\260:"
	.text
	.globl	random_input
	.type	random_input, @function
random_input:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi                 # size_t size
	cmp	QWORD PTR -24[rbp], 10000               # if (size > SIZE - 1)
	jbe	.L40
	lea	rax, .LC13[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	edi, -1
	call	exit@PLT
.L40:
	lea	rax, .LC14[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	QWORD PTR -8[rbp], 0                    # size_t i = 0
	jmp	.L41
.L42:
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, 780903145
	shr	rdx, 32
	sar	edx, 5
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	imul	ecx, edx, 176
	sub	eax, ecx
	mov	edx, eax
	mov	eax, edx
	add	eax, 32
	mov	edx, eax
	lea	rcx, input[rip]
	mov	rax, QWORD PTR -8[rbp]                  # size_t i
	add	rax, rcx                                # input[i]
	mov	BYTE PTR [rax], dl
	lea	rdx, input[rip]
	mov	rax, QWORD PTR -8[rbp]                  # size_t i
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	edi, eax
	call	putchar@PLT
	add	QWORD PTR -8[rbp], 1                    # size_t i + 1
.L41:
	mov	rax, QWORD PTR -8[rbp]                  # size_t i + 1
	cmp	rax, QWORD PTR -24[rbp]                 # if (i < size)
	jb	.L42
	lea	rdx, input[rip]
	mov	rax, QWORD PTR -24[rbp]                 # input[size] = '\0';
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	mov	edi, 10
	call	putchar@PLT
	lea	rax, input[rip]                         # countSignes(input);
	mov	rdi, rax
	call	countSignes
	mov	rax, QWORD PTR stdout[rip]              # stdout
	mov	rdi, rax
	call	outputResult
	nop
	leave
	ret
	.size	random_input, .-random_input
	.section	.rodata
.LC15:
	.string	"r"
.LC16:
	.string	"w"
	.text
	.globl	file_input
	.type	file_input, @function
file_input:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 4096
	or	QWORD PTR [rsp], 0
	sub	rsp, 4096
	or	QWORD PTR [rsp], 0
	sub	rsp, 1872
	mov	QWORD PTR -10056[rbp], rdi              # char input_name[]
	mov	QWORD PTR -10064[rbp], rsi              # char output_name[]
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	rax, QWORD PTR -10056[rbp]              # char input_name[]
	lea	rdx, .LC15[rip]                         # "r"
	mov	rsi, rdx                                # "r"
	mov	rdi, rax                                # char input_name[]
	call	fopen@PLT                               # fopen(input_name, "r");
	mov	QWORD PTR -10032[rbp], rax		# FILE *input_file
	mov	DWORD PTR -10036[rbp], 0
	jmp	.L44
.L45:
	mov	rax, QWORD PTR -10032[rbp]		# input_file
	mov	rdi, rax
	call	fgetc@PLT
	mov	edx, eax
	mov	eax, DWORD PTR -10036[rbp]
	cdqe
	mov	BYTE PTR -10016[rbp+rax], dl
	add	DWORD PTR -10036[rbp], 1
.L44:
	cmp	DWORD PTR -10036[rbp], 9999
	jle	.L45
	add	DWORD PTR -10036[rbp], 1
	mov	eax, DWORD PTR -10036[rbp]
	cdqe
	mov	BYTE PTR -10016[rbp+rax], 0
	mov	rax, QWORD PTR -10032[rbp]
	mov	rdi, rax
	call	fclose@PLT                              # fclose(input_file)
	lea	rax, -10016[rbp]
	mov	rdi, rax
	call	countSignes
	mov	rax, QWORD PTR -10064[rbp]              # FILE *output_file;
	lea	rdx, .LC16[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -10024[rbp], rax
	mov	rax, QWORD PTR -10024[rbp]
	mov	rdi, rax
	call	outputResult
	nop
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L46
	call	__stack_chk_fail@PLT
.L46:
	leave
	ret
	.size	file_input, .-file_input
	.globl	arg_input
	.type	arg_input, @function
arg_input:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	DWORD PTR -4[rbp], edi                  # int argc
	mov	QWORD PTR -16[rbp], rsi                 # char *argv[]
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 8                                  # argv[1]
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	strlen@PLT                              # strlen(argv[1])
	cmp	rax, 10001                              # strlen(argv[1]) > SIZE
	jbe	.L48
	lea	rax, .LC13[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	edi, -1
	call	exit@PLT
.L48:
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax                                # argv[1]
	call	countSignes                             # countSignes(argv[1])
	mov	rax, QWORD PTR stdout[rip]              # stdout
	mov	rdi, rax
	call	outputResult                            # outputResult(stdout)
	nop
	leave
	ret
	.size	arg_input, .-arg_input
	.section	.rodata
	.align 8
.LC17:
	.string	"\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \321\201\321\202\321\200\320\276\320\272\321\203, \320\264\320\273\320\270\320\275\320\275\320\276\320\271 \320\275\320\265 \320\261\320\276\320\273\320\265\320\265 10000 \321\201\320\270\320\274\320\262\320\276\320\273\320\276\320\262:"
	.text
	.globl	def_input
	.type	def_input, @function
def_input:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi                  # char *input1
	lea	rax, .LC17[rip]
	mov	rdi, rax
	call	puts@PLT                                # printf("Введите строку, длинной не более 10000 символов:\n");
	mov	rdx, QWORD PTR stdin[rip]
	mov	rax, QWORD PTR -8[rbp]                  # input1
	mov	esi, 10000                              # SIZE
	mov	rdi, rax
	call	fgets@PLT                               # fgets(input1, SIZE - 1, stdin);
	mov	rax, QWORD PTR -8[rbp]                  # input1
	mov	rdi, rax
	call	countSignes                             # countSignes(input1);
	mov	rax, QWORD PTR stdout[rip]              # stdout
	mov	rdi, rax
	call	outputResult                            # outputResult(stdout);
	nop
	leave
	ret
	.size	def_input, .-def_input
	.section	.rodata
.LC18:
	.string	"-h"
.LC19:
	.string	"--help"
	.align 8
.LC20:
	.string	"keys:\n-h (--help)  - displays a list of keys\n-r [int] (--random [int])  - sets a random data set. \n-f [string] [string] (--file [string] [string])  - the program works with files entered by the following two arguments"
.LC21:
	.string	"-r"
.LC22:
	.string	"--random"
	.align 8
.LC24:
	.string	"\320\235\320\265\321\202 \321\207\320\270\321\201\320\273\320\260 - \321\200\320\260\320\267\320\274\320\265\321\200\320\260 \321\201\321\202\321\200\320\276\320\272\320\270. \320\247\321\202\320\276\320\261\321\213 \320\277\320\276\320\273\321\203\321\207\320\270\321\202\321\214 \320\270\320\275\321\204\320\276\321\200\320\274\320\260\321\206\320\270\321\216 \320\276 \320\272\320\273\321\216\321\207\320\260\321\205, \320\270\321\201\320\277\320\276\320\273\321\214\320\267\321\203\320\271\321\202\320\265 \321\204\320\273\320\260\320\263 -h (--help)"
.LC25:
	.string	"-f"
.LC26:
	.string	"--file"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	DWORD PTR -4[rbp], edi                  # int argc
	mov	QWORD PTR -16[rbp], rsi                 # char *argv[]
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	cmp	DWORD PTR -4[rbp], 1                    # if (argc == 1)
	jne	.L51
	lea	rax, input[rip]
	mov	rdi, rax
	call	def_input
	jmp	.L52
.L51:
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]                    # argv[1]
	lea	rdx, .LC18[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT                              # strcmp(argv[1], "-h")
	test	eax, eax                                # !strcmp(argv[1], "-h")
	je	.L53
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 8                                  # argv[1]
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC19[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT                              # strcmp(argv[1], "-h")
	test	eax, eax                                # !strcmp(argv[1], "-h")
	jne	.L54
.L53:
	lea	rax, .LC20[rip]
	mov	rdi, rax
	call	puts@PLT
	jmp	.L52
.L54:
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 8                                  # argv[1]
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC21[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT                              # strcmp(argv[1], "-r")
	test	eax, eax                                # !strcmp(argv[1], "-r")
	je	.L55
	mov	rax, QWORD PTR -16[rbp]                 # argv[1]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC22[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT                              # strcmp(argv[1], "--random")
	test	eax, eax                                # !strcmp(argv[1], "--random")
	jne	.L56
.L55:
	cmp	DWORD PTR -4[rbp], 3                    # if (argc == 3)
	jne	.L57
	mov	rax, QWORD PTR -16[rbp]                 # argv[2]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atof@PLT                                # atof(argv[2])
	comisd	xmm0, QWORD PTR .LC23[rip]
	jnb	.L58
	cvttsd2si	rax, xmm0
	jmp	.L59
.L58:
	movsd	xmm1, QWORD PTR .LC23[rip]
	subsd	xmm0, xmm1
	cvttsd2si	rax, xmm0
	movabs	rdx, -9223372036854775808
	xor	rax, rdx
.L59:
	mov	rdi, rax
	call	random_input                            # random_input(atof(argv[2]))
	jmp	.L52
.L57:
	lea	rax, .LC24[rip]
	mov	rdi, rax
	call	puts@PLT
	jmp	.L52
.L56:
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 8                                  # argv[1]
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC25[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT                              # strcmp(argv[1], "-f")
	test	eax, eax                                # !strcmp(argv[1], "-f")
	je	.L61
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC26[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT                              # strcmp(argv[1], "--file")
	test	eax, eax                                # !strcmp(argv[1], "--file")
	jne	.L62
.L61:
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 24
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	rsi, rdx
	mov	rdi, rax
	call	file_input
	jmp	.L52
.L62:
	mov	rdx, QWORD PTR -16[rbp]                 # argv
	mov	eax, DWORD PTR -4[rbp]                  # argc
	mov	rsi, rdx
	mov	edi, eax
	call	arg_input                               # arg_input(argc, argv)
.L52:
	mov	eax, 0
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC23:
	.long	0
	.long	1138753536
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
