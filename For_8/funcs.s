        .file   "IHW.s"
        .text
        .section .rodata
    .LC0:
        .string "%d"
    .LC1:
        .string " "
    .LC2:
        .string "\n"
    .read:
        .string "r"
    .write:
        .string "w"
    
    .text
        .globl  input
        .type   input, @function
input:
        pushq   %rbp
        movq    %rsp, %rbp
        pushq   %rax
        pushq   %rbx
        subq    $32, %rsp

        movq    %rdi, (%rsp)
        movq    %rsi, 8(%rsp)

        movq    $0, %rbx
        .scan:
		movq	(%rsp), %rax
		movq	%r14, %rdi
                leaq    .LC0(%rip), %rsi
                leaq    (%rax, %rbx, 8), %rdx
                call    __isoc99_fscanf@PLT

                incq    %rbx
                cmpq    %rbx, 8(%rsp)
                ja      .scan

        addq    $32, %rsp
        popq    %rbx
        popq    %rax
        leave
        ret
        .size   input, .-input

        .globl  output_in_file
        .type   output_in_file, @function
output_in_file:
        pushq   %rbp
        movq    %rsp, %rbp
        pushq   %rax
        pushq   %rbx
        subq    $32, %rsp

        movq    %rdi, (%rsp)
        movq    %rsi, 8(%rsp)

        movq    $0, %rbx
        .print:
		movq	(%rsp), %rax
		movq    %r14, %rdi
		leaq    .LC0(%rip), %rsi
		movq    (%rax, %rbx, 8), %rdx
		call    fprintf@PLT

                incq    %rbx
                cmp     %rbx, 8(%rsp)
                je      .end_of_print

		movq	%r14, %rdi
                leaq    .LC1(%rip), %rsi
                call    fprintf@PLT

                cmp     %rbx, 8(%rsp)
                ja      .print

        .end_of_print:
		movq	%r14, %rdi
                leaq    .LC2(%rip), %rsi
                call    fprintf@PLT

        addq    $32, %rsp
        popq    %rbx
        popq    %rax
        leave
        ret
        .size   output_in_file, .-output_in_file

        .globl  make_new_array
        .type   make_new_array, @function
make_new_array:
        pushq   %rbp
        movq    %rsp, %rbp
        pushq   %rax
        pushq   %rbx
        pushq   %r15
        pushq   %r14
        pushq   %r13

        subq    $40, %rsp

        movq    %rdi, (%rsp)
        movq    %rsi, 8(%rsp)
        movq    %rdx, 16(%rsp)

        movq    %rdx, %r14
        movq    %rdx, %r15 # r15 = size

        incq    %r14
        sarq    $1, %r14 # r14 = (size + 1) / 2

        movq    $0, %rax # rax = i
        movq    $0, %rbx # rbx = j
        .first_loop:
                movq    (%rdi, %rbx, 8), %r13
                leaq    (%rsi, %rax, 8), %rcx
                movq    %r13, (%rcx)

                incq    %rax
                cmp     %rax, %r14
                jbe     .prepare_for_second_loop
                addq    $2, %rbx
                cmp     %rbx, %r15
                ja      .first_loop

        .prepare_for_second_loop:
                movq    %r14, %rax
                movq    $1, %rbx
        .second_loop:
                movq    (%rdi, %rbx, 8), %r13
                leaq    (%rsi, %rax, 8), %rcx
                movq    %r13, (%rcx)

                incq    %rax
                cmp     %rax, %r15
                jbe     .end
                addq    $2, %rbx
                cmp     %rbx, %r15
                ja      .second_loop

        .end:
                addq    $40, %rsp
                popq    %r13
                popq    %r14
                popq    %r15
                popq    %rbx
                popq    %rax
                leave
                ret
        .size   make_new_array, .-make_new_array

        .globl  start_with_prepared_file
        .type   start_with_prepared_file, @function
start_with_prepared_file:
	pushq %rbp
	movq %rbp, %rsp

        pushq   %r15
        pushq   %r14
        pushq   %r13
        pushq   %r12
        pushq   %rbx

        subq    $72, %rsp

        movq    %rdi, %r12               # перенос в регистр, неизменяемый printf
        movq    %rsi, %r13               # rsi содержи адресс массива аргументов

        mov     8(%rsi), %rdi
        lea     .read(%rip), %rsi
        call    fopen@PLT

        movq    %rax, %r14

        movq    %r14, %rdi
        leaq    .LC0(%rip), %rsi
        leaq    (%rsp), %rdx
        call    __isoc99_fscanf@PLT

        movq    (%rsp), %rcx
        shlq    $3, %rcx

        movq    %rcx, %rdi
        call    malloc@PLT
        movq    %rax, %rbx

        movq    (%rsp), %rcx
        shlq    $3, %rcx

        movq    %rcx, %rdi
        call    malloc@PLT
        xchg    %rax, %rbx

        # на данный момент
        # rax - old_array
        # rbx - new_array
        # r14 - указатель на файл

        movq    %rax, %rdi
        movq    (%rsp), %rsi
        call    input

        pushq   %rax
        movq    %r14, %rdi
        call    fclose@PLT
        popq    %rax

        movq    %rax, %rdi
        movq    %rbx, %rsi
        movq    (%rsp), %rdx
        call    make_new_array

        movq    %rax, %rdi
        call    free@PLT

        # здесь
        # rbx - new_array

        movq    16(%r13), %rdi
        leaq    .write(%rip), %rsi
        call    fopen@PLT
        movq    %rax, %r14

        movq    %rbx, %rdi
        movq    (%rsp), %rsi
        call    output_in_file

        movq    %r14, %rdi
        call    fclose@PLT

        movq    %rbx, %rdi
        call    free@PLT

        addq    $72, %rsp
        popq    %rbx
        popq    %r12
        popq    %r13
        popq    %r14
        popq    %r15
	leave
	ret
        .size	start_with_prepared_file, .-start_with_prepared_file

	.globl  generate_random_test
        .type   generate_random_test, @function
generate_random_test:
	pushq 	%rbp
	movq 	%rsp, %rbp

	pushq 	%rbx
	pushq 	%r14
	pushq 	%r15

	subq 	$24, %rsp

	movq 	%rdi, %r14
	movq 	%rsi, %r15
	xorq 	%rbx, %rbx
	.filling:
		cmp 	%rbx, %r15
		je 	.end_of_generation
		call 	generate_random_int@PLT
		movq 	%rax, (%r14, %rbx, 8)
		incq 	%rbx
		jmp 	.filling

	.end_of_generation:
	addq 	$24, %rsp
	popq 	%r15
	popq 	%r14
	popq 	%rbx

	leave
	ret
	.size	generate_random_test, .-generate_random_test	

        .globl  generate_random_int
        .type   generate_random_int, @function
generate_random_int:
	pushq	%rbp
	movq	%rsp, %rbp
	
	pushq	%rbx
	pushq	%rdx
	pushq	%rcx

	subq	$24, %rsp
	# возможно segfault из-за выравнивания

        xorq    %rax, %rax
        call    rand@PLT
        xorq    %rdx, %rdx
        movq	$100, %rcx
	idiv    %rcx
        movq    %rdx, %rax
	
	addq	$24, %rsp
	popq	%rcx
	popq	%rdx
	popq	%rbx

	leave
    	ret
	.size   generate_random_int, .-generate_random_int

	.globl	output_in_terminal
	.type	output_in_terminal, @function
output_in_terminal:
	pushq   %rbp
        movq    %rsp, %rbp
        
	pushq   %rax
        pushq   %rbx

        subq    $32, %rsp

        movq    %rdi, (%rsp)
        movq    %rsi, 8(%rsp)

        movq    $0, %rbx
        .print1:
                movq   (%rsp), %rax
                leaq   .LC0(%rip), %rdi
                movq   (%rax, %rbx, 8), %rsi
                call   printf@PLT

                incq    %rbx
                cmp     %rbx, 8(%rsp)
                je      .end_of_print1
                leaq    .LC1(%rip), %rdi
                call    printf@PLT
                cmp     %rbx, 8(%rsp)
                ja      .print1

        .end_of_print1:
                leaq    .LC2(%rip), %rdi
                call    printf@PLT

        addq    $32, %rsp
        popq    %rbx
        popq    %rax
        leave
        ret
	.size 	output_in_terminal, .-output_in_terminal

	.globl	start_with_random
	.type	start_with_random, @function
start_with_random:
	pushq	%rbp
	movq	%rsp, %rbp

        pushq   %rbx
        pushq   %r12
        pushq   %r13
        subq    $24, %rsp

        xorq    %rdi, %rdi
        #xor     rax, rax
        call    time@PLT

        movq     %rax, %rdi
        #xor     rax, rax
        call    srand@PLT

        call    generate_random_int@PLT
        movq    %rax, %rbx

        shlq    $3, %rax

        movq    %rax, %rdi
        call    malloc@PLT
        movq    %rax, %r12

        movq    %r12, %rdi
        movq    %rbx, %rsi
        call    generate_random_test@PLT

        movq    %rbx, %rax
        shlq    $3, %rax

        movq    %rax, %rdi
        call    malloc@PLT
        movq    %rax, %r13

        # rbx = n
        # r12 = old_array
        # r13 = new_array
        movq    %r12, %rdi
        movq    %r13, %rsi
        movq    %rbx, %rdx

        call    make_new_array

	movq	%r12, %rdi
	movq	%rbx, %rsi
	call	output_in_terminal

        movq    %r13, %rdi
        movq    %rbx, %rsi
        call    output_in_terminal

        movq    %r12, %rdi
        call    free@PLT

        movq    %r13, %rdi
        call    free@PLT

        addq    $24, %rsp
        popq    %r13
        popq    %r12
        popq    %rbx

	leave
	ret
	.size   start_with_random, .-start_with_random
