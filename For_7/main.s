        .section .rodata
        .LC0:
                .string "%d"
        .read:
                .string "r"
        .write:
                .string "w"
        .text
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

        movq    %rdi, %r12               # перенос в регистр, неизменяемый printf
        movq    %rsi, %r13               # rsi содержит адрес массива аргументов

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
        call    output

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
        movq	%rbp, %rsp
	popq	%rbp
        ret

