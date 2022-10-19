	.section .rodata
	.text
	.debug:
		.string "I was here"
	.globl  main
        .type   main, @function
main:
        pushq   %rbp
        movq    %rsp, %rbp
        
	pushq	%rbx
	pushq	%r12
	pushq	%r13

        cmp	$1, %rdi
	jg	.start_with_prepared
	
	# rbx = random() % 10
	call 	generate_random_int
	movq	%rax, %rbx

	shlq	$3, %rax
	
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %r12

	movq	%r12, %rdi
	movq	%rbx, %rsi
	call	generate_random_test
	
	# сохраняем адрес старого массива в неразрушаемом регистре
	# movq	%rax, %rbx

	#lea 	.debug(%rip), %rdi
	#call	printf@PLT

	#создаём новый массив
	#shlq	$3, %rdx

	movq	%rbx, %rax
	shlq	$3, %rax

	#pushq	%rdx
	movq	%rax, %rdi
	call	malloc@PLT
	#popq	%rdx
	movq 	%rax, %r13

	# rbx = n
	# r12 = old_array
	# r13 = new_array
	# вызываем функции преобразования и печати	
	movq	%r12, %rdi
	movq	%r13, %rsi
	movq	%rbx, %rdx

	#pushq	%rdx
	call 	make_new_array
	#popq	%rdx

	movq	%r13, %rdi
	movq	%rbx, %rsi
	call 	output

	movq	%r12, %rax
	call	free@PLT
	
	movq	%r13, %rax
	call	free@PLT

	jmp	.end_main
	.start_with_prepared:
		call start_with_prepared_file
	
	.end_main:
        	leave
		ret
