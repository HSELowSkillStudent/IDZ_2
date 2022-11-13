	.file	"main.c"
	.intel_syntax noprefix
	
	
	
	.text
	.globl	countSignes
	.type	countSignes, @function
countSignes:
        # push    rbx                                     # для size_t i
        
	push	rbp
	mov	rbp, rsp                                # пролог
	
	# mov	QWORD PTR -24[rbp], rdi                 # const char *input
	
	# mov	QWORD PTR -8[rbp], 0                    # size_t i = 0
	mov     QWORD PTR -8[rbp], r12
	mov     QWORD PTR -16[rbp], r13
	mov     QWORD PTR -24[rbp], r14
	mov     QWORD PTR -32[rbp], r15
	mov     QWORD PTR -40[rbp], rbx
	
	
	mov     rsi, 0                                  # заменили на регистр
	
	
	mov	rcx, QWORD PTR result[rip]		# .
	mov	r8, QWORD PTR result[rip+8]		# ,
	mov	r9, QWORD PTR result[rip+16]		# ;
	
	mov     r10, QWORD PTR result[rip+24]		# :
	mov     r11, QWORD PTR result[rip+32]		# !
	
	mov	r12, QWORD PTR result[rip+40]		# ?
	mov	r13, QWORD PTR result[rip+48]		# -
	mov	r14, QWORD PTR result[rip+56]		# (
	mov	r15, QWORD PTR result[rip+64]		# )
	mov     rbx, QWORD PTR result[rip+72]		# '
	
	jmp	.L2o                                    # for (size_t i; i < SIZE; i++)
.L18o:
	# mov	rax, QWORD PTR -24[rbp]                 # input (заменил rdx на rax)
	mov     rax, rdi                                # заменил на регистры
	# mov	rax, QWORD PTR -8[rbp]                  # i (заменили на регистр)
	
	#add	rax, rdx                                # input[i]
	add	rax, rsi                                # заменили на регистр
	
        movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR -9[rbp], al                    # a = input[i]
	cmp	BYTE PTR -9[rbp], 10                    # a == '\n'
	je	.L19o                                   # break
	cmp	BYTE PTR -9[rbp], 0                     # if a == '\0'
	je	.L19o                                   # break

	movsx	eax, BYTE PTR -9[rbp]                   # switch(a) unsigned
	sub	eax, 33
	cmp	eax, 30                                 # получаем, что после преобразований eax хранит значение от 0 до 30+(т.к. unsigned)если eax > 30, то это точно не знак препинания(таблица ascii)
	ja	.L20o                                   # уходим в default(a > '?')
	mov	eax, eax                                # тут из XXXXeax получаем 0000eax (в rax)
	lea	rdx, 0[0+rax*4]                         # case'ы
	lea	rax, .L6o[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L6o[rip]
	add	rax, rdx
	jmp	rax
	.section	.rodata
	.align 4
	.align 4
.L6o:
	.long	.L16o-.L6o
	.long	.L15o-.L6o
	.long	.L20o-.L6o
	.long	.L20o-.L6o
	.long	.L20o-.L6o
	.long	.L20o-.L6o
	.long	.L14o-.L6o
	.long	.L13o-.L6o
	.long	.L12o-.L6o
	.long	.L20o-.L6o
	.long	.L20o-.L6o
	.long	.L11o-.L6o
	.long	.L10o-.L6o
	.long	.L9o-.L6o
	.long	.L20o-.L6o
	.long	.L20o-.L6o
	.long	.L20o-.L6o
	.long	.L20o-.L6o
	.long	.L20o-.L6o
	.long	.L20o-.L6o
	.long	.L20o-.L6o
	.long	.L20o-.L6o
	.long	.L20o-.L6o
	.long	.L20o-.L6o
	.long	.L20o-.L6o
	.long	.L8o-.L6o
	.long	.L7o-.L6o
	.long	.L20o-.L6o
	.long	.L20o-.L6o
	.long	.L20o-.L6o
	.long	.L5o-.L6o
	.text
.L9o:                                                   # .
	# mov	rax, QWORD PTR result[rip]		# заменили на регистр
	# add	rax, 1
	# mov	QWORD PTR result[rip], rax
	# add	rcx, 1
	inc	rcx
	jmp	.L17o
.L11o:                                                  # ,
	# mov	rax, QWORD PTR result[rip+8]		# заменили на регистр
	# add	rax, 1
	# mov	QWORD PTR result[rip+8], rax
	# add	r8, 1
	inc	r8
	jmp	.L17o
.L7o:                                                   # ;
	# mov	rax, QWORD PTR result[rip+16]		# заменили на регистр
	# add	rax, 1
	# mov	QWORD PTR result[rip+16], rax
	# add     r9, 1
	inc	r9
	jmp	.L17o
.L8o:                                                   # :
	# mov	rax, QWORD PTR result[rip+24]		# заменили на регистр
	# add	rax, 1
	# mov	QWORD PTR result[rip+24], rax
	# add     r10, 1
	inc	r10
	jmp	.L17o
.L16o:                                                  # !
	# mov	rax, QWORD PTR result[rip+32]		# заменили на регистр
	# add	rax, 1
	# mov	QWORD PTR result[rip+32], rax
	# add     r11, 1
	inc	r11
	jmp	.L17o
.L5o:                                                   # ?
	# mov	rax, QWORD PTR result[rip+40]		# заменили на регистр
	# add	rax, 1
	# mov	QWORD PTR result[rip+40], rax
        # add     r12, 1
        inc	r12
	jmp	.L17o
.L10o:                                                  # -
	# mov	rax, QWORD PTR result[rip+48]		# заменили на регистр
	# add	rax, 1
	# mov	QWORD PTR result[rip+48], rax
	# add     r13, 1
	inc	r13
	jmp	.L17o
.L13o:                                                  # (
	# mov	rax, QWORD PTR result[rip+56]		# заменили на регистр
	# add	rax, 1
	# mov	QWORD PTR result[rip+56], rax
	# add     r14, 1
	inc	r14
	jmp	.L17o
.L12o:                                                  # )
	# mov	rax, QWORD PTR result[rip+64]		# заменили на регистр
	# add	rax, 1
	# mov	QWORD PTR result[rip+64], rax
	# add     r15, 1
	inc	r15
	jmp	.L17o
.L14o:                                                  # '
	# mov	rax, QWORD PTR result[rip+72]		# заменили на регистр
	# add	rax, 1
	# mov	QWORD PTR result[rip+72], rax
	# add     rbx, 1
	inc	rbx
	jmp	.L17o
.L15o:                                                  # "
	mov	rax, QWORD PTR result[rip+80]		# регистров не хватило :(
	add	rax, 1
	mov	QWORD PTR result[rip+80], rax
	jmp	.L17o
.L20o:
	nop
.L17o:
	# add	QWORD PTR -8[rbp], 1                    # i++ (для for)
	add     rsi, 1                                  # заменили на регистр
.L2o:
	# cmp	QWORD PTR -8[rbp], 10000                # i >= SIZE
	cmp     rsi, 10000                              # заменил на регистр
	
	jbe	.L18o                                    # end
.L19o:
	nop
	
	mov	QWORD PTR result[rip], rcx              # .
	mov	QWORD PTR result[rip+8], r8             # ,
	mov	QWORD PTR result[rip+16], r9            # ;
	mov	QWORD PTR result[rip+24], r10           # :
	mov	QWORD PTR result[rip+32], r11           # !
	mov	QWORD PTR result[rip+40], r12           # ?
	mov	QWORD PTR result[rip+48], r13           # -
	mov	QWORD PTR result[rip+56], r14           # (
	mov	QWORD PTR result[rip+64], r15           # )
	mov	QWORD PTR result[rip+72], rbx           # '
	

	mov     r12, QWORD PTR -8[rbp]                  # ?
	mov     r13, QWORD PTR -16[rbp]                 # -
	mov     r14, QWORD PTR -24[rbp]                 # (
	mov     r15, QWORD PTR -32[rbp]                 # )
	mov     rbx, QWORD PTR -40[rbp]                 # '
	
	mov     rsp, rbp
	pop	rbp
	# pop     rbx
	ret
	.size	countSignes, .-countSignes
	
	
		
	.text
	.globl	result
	.bss
	.align 32
	.type	result, @object
	.size	result, 88
result:
	.zero	88
	.text
	.globl	countSignesNO
	.type	countSignesNO, @function
countSignesNO:
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -8[rbp], 0
	jmp	.L2
.L18:
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR -9[rbp], al
	cmp	BYTE PTR -9[rbp], 10
	je	.L19
	cmp	BYTE PTR -9[rbp], 0
	je	.L19
	movsx	eax, BYTE PTR -9[rbp]
	sub	eax, 33
	cmp	eax, 30
	ja	.L20
	mov	eax, eax
	lea	rdx, 0[0+rax*4]
	lea	rax, .L6[rip]
	mov	eax, DWORD PTR [rdx+rax]
	cdqe
	lea	rdx, .L6[rip]
	add	rax, rdx
	jmp	rax
	.section	.rodata
	.align 4
	.align 4
.L6:
	.long	.L16-.L6
	.long	.L15-.L6
	.long	.L20-.L6
	.long	.L20-.L6
	.long	.L20-.L6
	.long	.L20-.L6
	.long	.L14-.L6
	.long	.L13-.L6
	.long	.L12-.L6
	.long	.L20-.L6
	.long	.L20-.L6
	.long	.L11-.L6
	.long	.L10-.L6
	.long	.L9-.L6
	.long	.L20-.L6
	.long	.L20-.L6
	.long	.L20-.L6
	.long	.L20-.L6
	.long	.L20-.L6
	.long	.L20-.L6
	.long	.L20-.L6
	.long	.L20-.L6
	.long	.L20-.L6
	.long	.L20-.L6
	.long	.L20-.L6
	.long	.L8-.L6
	.long	.L7-.L6
	.long	.L20-.L6
	.long	.L20-.L6
	.long	.L20-.L6
	.long	.L5-.L6
	.text
.L9:
	mov	rax, QWORD PTR result[rip]
	add	rax, 1
	mov	QWORD PTR result[rip], rax
	jmp	.L17
.L11:
	mov	rax, QWORD PTR result[rip+8]
	add	rax, 1
	mov	QWORD PTR result[rip+8], rax
	jmp	.L17
.L7:
	mov	rax, QWORD PTR result[rip+16]
	add	rax, 1
	mov	QWORD PTR result[rip+16], rax
	jmp	.L17
.L8:
	mov	rax, QWORD PTR result[rip+24]
	add	rax, 1
	mov	QWORD PTR result[rip+24], rax
	jmp	.L17
.L16:
	mov	rax, QWORD PTR result[rip+32]
	add	rax, 1
	mov	QWORD PTR result[rip+32], rax
	jmp	.L17
.L5:
	mov	rax, QWORD PTR result[rip+40]
	add	rax, 1
	mov	QWORD PTR result[rip+40], rax
	jmp	.L17
.L10:
	mov	rax, QWORD PTR result[rip+48]
	add	rax, 1
	mov	QWORD PTR result[rip+48], rax
	jmp	.L17
.L13:
	mov	rax, QWORD PTR result[rip+56]
	add	rax, 1
	mov	QWORD PTR result[rip+56], rax
	jmp	.L17
.L12:
	mov	rax, QWORD PTR result[rip+64]
	add	rax, 1
	mov	QWORD PTR result[rip+64], rax
	jmp	.L17
.L14:
	mov	rax, QWORD PTR result[rip+72]
	add	rax, 1
	mov	QWORD PTR result[rip+72], rax
	jmp	.L17
.L15:
	mov	rax, QWORD PTR result[rip+80]
	add	rax, 1
	mov	QWORD PTR result[rip+80], rax
	jmp	.L17
.L20:
	nop
.L17:
	add	QWORD PTR -8[rbp], 1
.L2:
	cmp	QWORD PTR -8[rbp], 10000
	jbe	.L18
.L19:
	nop
	pop	rbp
	ret
	.size	countSignesNO, .-countSignesNO
	.section	.rodata
	.align 8
.LC0:
	.string	"\320\224\320\273\320\270\320\275\320\260 \321\201\321\202\321\200\320\276\320\272\320\270 \320\275\320\265 \320\264\320\276\320\273\320\266\320\275\320\260 \320\277\320\265\321\200\320\262\321\213\321\210\320\260\321\202\321\214 10000 \321\201\320\270\320\274\320\262\320\276\320\273\320\276\320\262"
	.text
	.globl	random_array
	.type	random_array, @function
random_array:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	cmp	QWORD PTR -32[rbp], 10000
	jbe	.L22
	lea	rax, .LC0[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	edi, -1
	call	exit@PLT
.L22:
	mov	QWORD PTR -8[rbp], 0
	jmp	.L23
.L24:
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
	lea	ecx, 32[rax]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	mov	edx, ecx
	mov	BYTE PTR [rax], dl
	add	QWORD PTR -8[rbp], 1
.L23:
	mov	rax, QWORD PTR -8[rbp]
	cmp	rax, QWORD PTR -32[rbp]
	jb	.L24
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	nop
	leave
	ret
	.size	random_array, .-random_array
	.section	.rodata
.LC1:
	.string	"test %d\n"
	.align 8
.LC2:
	.string	"\tunoptimized function time:\t%lld\n"
	.align 8
.LC3:
	.string	"\toptimized function time:  \t%lld\n\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 4096
	or	QWORD PTR [rsp], 0
	sub	rsp, 4096
	or	QWORD PTR [rsp], 0
	sub	rsp, 1872
	mov	DWORD PTR -10052[rbp], edi
	mov	QWORD PTR -10064[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	DWORD PTR -10048[rbp], 0
	jmp	.L26
.L31:
	mov	eax, DWORD PTR -10048[rbp]
	mov	esi, eax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, -773008127
	shr	rdx, 32
	add	edx, eax
	sar	edx, 12
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	imul	ecx, edx, 4995
	sub	eax, ecx
	mov	edx, eax
	lea	eax, 5000[rdx]
	mov	DWORD PTR -10036[rbp], eax
	mov	eax, DWORD PTR -10036[rbp]
	movsx	rdx, eax
	lea	rax, -10016[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	random_array
	mov	edi, 0
	call	time@PLT
	mov	QWORD PTR -10032[rbp], rax
	mov	DWORD PTR -10044[rbp], 0
	jmp	.L27
.L28:
	lea	rax, -10016[rbp]
	mov	rdi, rax
	call	countSignesNO
	add	DWORD PTR -10044[rbp], 1
.L27:
	cmp	DWORD PTR -10044[rbp], 499999
	jle	.L28
	mov	edi, 0
	call	time@PLT
	mov	QWORD PTR -10024[rbp], rax
	mov	rax, QWORD PTR -10024[rbp]
	sub	rax, QWORD PTR -10032[rbp]
	mov	rcx, rax
	movabs	rdx, 2361183241434822607
	mov	rax, rcx
	imul	rdx
	mov	rax, rdx
	sar	rax, 7
	mov	rdx, rcx
	sar	rdx, 63
	sub	rax, rdx
	imul	rdx, rax, 1000
	mov	rax, rcx
	sub	rax, rdx
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	edi, 0
	call	time@PLT
	mov	QWORD PTR -10032[rbp], rax
	mov	DWORD PTR -10040[rbp], 0
	jmp	.L29
.L30:
	lea	rax, -10016[rbp]
	mov	rdi, rax
	call	countSignesNO
	add	DWORD PTR -10040[rbp], 1
.L29:
	cmp	DWORD PTR -10040[rbp], 499999
	jle	.L30
	mov	edi, 0
	call	time@PLT
	mov	QWORD PTR -10024[rbp], rax
	mov	rax, QWORD PTR -10024[rbp]
	sub	rax, QWORD PTR -10032[rbp]
	mov	rcx, rax
	movabs	rdx, 2361183241434822607
	mov	rax, rcx
	imul	rdx
	mov	rax, rdx
	sar	rax, 7
	mov	rdx, rcx
	sar	rdx, 63
	sub	rax, rdx
	imul	rdx, rax, 1000
	mov	rax, rcx
	sub	rax, rdx
	mov	rsi, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -10048[rbp], 1
.L26:
	cmp	DWORD PTR -10048[rbp], 9
	jle	.L31
	mov	eax, 0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L33
	call	__stack_chk_fail@PLT
.L33:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
