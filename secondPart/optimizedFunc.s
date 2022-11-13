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
