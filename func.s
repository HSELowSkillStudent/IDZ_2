	.file	"func.c"
	.intel_syntax noprefix
	.text
	.globl	result
	.bss
	.align 32
	.type	result, @object
	.size	result, 88
result:
	.zero	88
	.text
	.globl	countSignes
	.type	countSignes, @function
countSignes:
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -8[rbp], 0
	jmp	.L2
.L19:
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR -9[rbp], al
	cmp	BYTE PTR -9[rbp], 0
	je	.L20
	movsx	eax, BYTE PTR -9[rbp]
	sub	eax, 33
	cmp	eax, 30
	ja	.L21
	mov	eax, eax
	lea	rdx, 0[0+rax*4]
	lea	rax, .L7[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L7[rip]
	add	rax, rdx
	jmp	rax
	.section	.rodata
	.align 4
	.align 4
.L7:
	.long	.L17-.L7
	.long	.L16-.L7
	.long	.L21-.L7
	.long	.L21-.L7
	.long	.L21-.L7
	.long	.L21-.L7
	.long	.L15-.L7
	.long	.L14-.L7
	.long	.L13-.L7
	.long	.L21-.L7
	.long	.L21-.L7
	.long	.L12-.L7
	.long	.L11-.L7
	.long	.L10-.L7
	.long	.L21-.L7
	.long	.L21-.L7
	.long	.L21-.L7
	.long	.L21-.L7
	.long	.L21-.L7
	.long	.L21-.L7
	.long	.L21-.L7
	.long	.L21-.L7
	.long	.L21-.L7
	.long	.L21-.L7
	.long	.L21-.L7
	.long	.L9-.L7
	.long	.L8-.L7
	.long	.L21-.L7
	.long	.L21-.L7
	.long	.L21-.L7
	.long	.L6-.L7
	.text
.L10:
	mov	rax, QWORD PTR result[rip]
	add	rax, 1
	mov	QWORD PTR result[rip], rax
	jmp	.L18
.L12:
	mov	rax, QWORD PTR result[rip+8]
	add	rax, 1
	mov	QWORD PTR result[rip+8], rax
	jmp	.L18
.L8:
	mov	rax, QWORD PTR result[rip+16]
	add	rax, 1
	mov	QWORD PTR result[rip+16], rax
	jmp	.L18
.L9:
	mov	rax, QWORD PTR result[rip+24]
	add	rax, 1
	mov	QWORD PTR result[rip+24], rax
	jmp	.L18
.L17:
	mov	rax, QWORD PTR result[rip+32]
	add	rax, 1
	mov	QWORD PTR result[rip+32], rax
	jmp	.L18
.L6:
	mov	rax, QWORD PTR result[rip+40]
	add	rax, 1
	mov	QWORD PTR result[rip+40], rax
	jmp	.L18
.L11:
	mov	rax, QWORD PTR result[rip+48]
	add	rax, 1
	mov	QWORD PTR result[rip+48], rax
	jmp	.L18
.L14:
	mov	rax, QWORD PTR result[rip+56]
	add	rax, 1
	mov	QWORD PTR result[rip+56], rax
	jmp	.L18
.L13:
	mov	rax, QWORD PTR result[rip+64]
	add	rax, 1
	mov	QWORD PTR result[rip+64], rax
	jmp	.L18
.L15:
	mov	rax, QWORD PTR result[rip+72]
	add	rax, 1
	mov	QWORD PTR result[rip+72], rax
	jmp	.L18
.L16:
	mov	rax, QWORD PTR result[rip+80]
	add	rax, 1
	mov	QWORD PTR result[rip+80], rax
	jmp	.L18
.L21:
	nop
.L18:
	add	QWORD PTR -8[rbp], 1
.L2:
	cmp	QWORD PTR -8[rbp], 10000
	jbe	.L19
	jmp	.L22
.L20:
	nop
.L22:
	nop
	pop	rbp
	ret
	.size	countSignes, .-countSignes
	.section	.rodata
.LC0:
	.string	"<.>: %zu\n"
.LC1:
	.string	"<,>: %zu\n"
.LC2:
	.string	"<;>: %zu\n"
.LC3:
	.string	"<:>: %zu\n"
.LC4:
	.string	"<!>: %zu\n"
.LC5:
	.string	"<?>: %zu\n"
.LC6:
	.string	"<->: %zu\n"
.LC7:
	.string	"<(>: %zu\n"
.LC8:
	.string	"<)>: %zu\n"
.LC9:
	.string	"<'>: %zu\n"
.LC10:
	.string	"<\">: %zu\n"
	.text
	.globl	outputStruct
	.type	outputStruct, @function
outputStruct:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	mov	rax, QWORD PTR result[rip]
	test	rax, rax
	je	.L24
	mov	rdx, QWORD PTR result[rip]
	mov	rax, QWORD PTR -8[rbp]
	lea	rcx, .LC0[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
.L24:
	mov	rax, QWORD PTR result[rip+8]
	test	rax, rax
	je	.L25
	mov	rdx, QWORD PTR result[rip+8]
	mov	rax, QWORD PTR -8[rbp]
	lea	rcx, .LC1[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
.L25:
	mov	rax, QWORD PTR result[rip+16]
	test	rax, rax
	je	.L26
	mov	rdx, QWORD PTR result[rip+16]
	mov	rax, QWORD PTR -8[rbp]
	lea	rcx, .LC2[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
.L26:
	mov	rax, QWORD PTR result[rip+24]
	test	rax, rax
	je	.L27
	mov	rdx, QWORD PTR result[rip+24]
	mov	rax, QWORD PTR -8[rbp]
	lea	rcx, .LC3[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
.L27:
	mov	rax, QWORD PTR result[rip+32]
	test	rax, rax
	je	.L28
	mov	rdx, QWORD PTR result[rip+32]
	mov	rax, QWORD PTR -8[rbp]
	lea	rcx, .LC4[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
.L28:
	mov	rax, QWORD PTR result[rip+40]
	test	rax, rax
	je	.L29
	mov	rdx, QWORD PTR result[rip+40]
	mov	rax, QWORD PTR -8[rbp]
	lea	rcx, .LC5[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
.L29:
	mov	rax, QWORD PTR result[rip+48]
	test	rax, rax
	je	.L30
	mov	rdx, QWORD PTR result[rip+48]
	mov	rax, QWORD PTR -8[rbp]
	lea	rcx, .LC6[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
.L30:
	mov	rax, QWORD PTR result[rip+56]
	test	rax, rax
	je	.L31
	mov	rdx, QWORD PTR result[rip+56]
	mov	rax, QWORD PTR -8[rbp]
	lea	rcx, .LC7[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
.L31:
	mov	rax, QWORD PTR result[rip+64]
	test	rax, rax
	je	.L32
	mov	rdx, QWORD PTR result[rip+64]
	mov	rax, QWORD PTR -8[rbp]
	lea	rcx, .LC8[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
.L32:
	mov	rax, QWORD PTR result[rip+72]
	test	rax, rax
	je	.L33
	mov	rdx, QWORD PTR result[rip+72]
	mov	rax, QWORD PTR -8[rbp]
	lea	rcx, .LC9[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
.L33:
	mov	rax, QWORD PTR result[rip+80]
	test	rax, rax
	je	.L35
	mov	rdx, QWORD PTR result[rip+80]
	mov	rax, QWORD PTR -8[rbp]
	lea	rcx, .LC10[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
.L35:
	nop
	leave
	ret
	.size	outputStruct, .-outputStruct
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
