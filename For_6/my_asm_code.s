        .file   "IHW.c"
        .text
        .section        .rodata
    .LC0:
        .string "%d"
    .LC1:
        .string " "
    .LC2:
        .string "\n"
        .text
        .globl  input
        .type   input, @function
input:
        pushq   %rbp
        movq    %rsp, %rbp
        pushq   %rax
        pushq   %rbx

        subq    $32, %rsp

	cmp	$0, %rsi
	je	.end_of_input

        movq    %rdi, (%rsp)                            # с этого момента и до конца функции всякое обращение к (%rsp) эквивалентно обращению к параметру array
        movq    %rsi, 8(%rsp)                           # с этого момента и до конца функции всякое обращение к 8(%rsp) эквивалентно обращению к параметру size

        movq    $0, %rbx
        .scan:
                leaq    .LC0(%rip), %rdi
                movq    (%rsp), %rax
                leaq    (%rax, %rbx, 8), %rsi
                call    __isoc99_scanf@PLT

                incq    %rbx
                cmpq    %rbx, 8(%rsp)
                ja      .scan
	.end_of_input:
        addq    $32, %rsp
        popq    %rbx
        popq    %rax
        movq	%rbp, %rsp
	popq	%rbp
        ret
        .size   input, .-input
        .globl  output
        .type   output, @function
output:
        pushq   %rbp
        movq    %rsp, %rbp
        pushq   %rax
        pushq   %rbx

        subq    $32, %rsp

	cmp	$0, %rsi
	je	.end_of_print

        movq    %rdi, (%rsp)                            # с этого момента и до конца функции всякое обращение к (%rsp) эквивалентно обращению к параметру array
        movq    %rsi, 8(%rsp)                           # с этого момента и до конца функции всякое обращение к 8(%rsp) эквивалентно обращению к параметру size

        movq    $0, %rbx
        .print:
                movq   (%rsp), %rax
                leaq   .LC0(%rip), %rdi
                movq   (%rax, %rbx, 8), %rsi
                call   printf@PLT

                incq    %rbx
                cmp     %rbx, 8(%rsp)
                je      .end_of_print
                leaq    .LC1(%rip), %rdi
                call    printf@PLT
                cmp     %rbx, 8(%rsp)
                ja      .print

        .end_of_print:
                leaq    .LC2(%rip), %rdi
                call    printf@PLT

        addq    $32, %rsp
        popq    %rbx
        popq    %rax
        movq	%rbp, %rsp
	popq	%rbp
        ret
        .size   output, .-output
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

	cmp	$0, %rdx
	je	.end

        movq    %rdi, (%rsp)                            # с этого момента и до конца функции всякое обращение к (%rsp) эквивалентно обращению к параметру old_array
        movq    %rsi, 8(%rsp)                           # с этого момента и до конца функции всякое обращение к 8(%rsp) эквивалентно обращению к параметру new_array
        movq    %rdx, 16(%rsp)                          # с этого момента и до конца функции всякое обращение к 16(%rsp) эквивалентно обращению к параметру size

        movq    %rdx, %r14
        movq    %rdx, %r15 ; r15 = size

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
                movq	%rbp, %rsp
		popq	%rbp
                ret
        .size   make_new_array, .-make_new_array
        .globl  main
        .type   main, @function
main:
        pushq   %rbp
        movq    %rsp, %rbp
        pushq   %r15
        pushq   %r14
        pushq   %r13
        pushq   %r12
        pushq   %rbx
        subq    $72, %rsp

        leaq    .LC0(%rip), %rdi # "%d" -> rdi
        leaq    (%rsp), %rsi                            # после выполнения scanf на (%rsp) будет лежать переменная n
        call    __isoc99_scanf@PLT

        movq    (%rsp), %rcx
        shlq    $3, %rcx

        movq    %rcx, %rdi                              # передаём в malloc 2 * n * sizeof(int) (sizeof(int) = 4. Умножаем на 2, чтобы
        call    malloc@PLT				# нормально работать с 64-битными регистрами)
        movq    %rax, %rbx

        movq    (%rsp), %rcx
        shlq    $3, %rcx

        movq    %rcx, %rdi
        call    malloc@PLT
        xchgq   %rax, %rbx

        movq    %rax, %rdi                              # передаём в input адрес массива old_array
        movq    (%rsp), %rsi                            # передаём в input перемменную n
        call    input

        movq    %rax, %rdi                              # передаём в input адрес массива old_array
        movq    %rbx, %rsi                              # передаём в input адрес массива new_array
        movq    (%rsp), %rdx                            # передаём в input перемменную n
        call    make_new_array

        movq    %rbx, %rdi                              # передаём в input адрес массива new_array
        movq    (%rsp), %rsi                            # передаём в input перемменную n
        call    output

        movq    %rax, %rdi                              # передаём в input адрес массива old_array
        call    free@PLT

        movq    %rbx, %rdi                              # передаём в input адрес массива new_array
        call    free@PLT

        addq    $72, %rsp
        popq    %rbx
        popq    %r12
        popq    %r13
        popq    %r14
        popq    %r15
        popq    %rbp
        ret
