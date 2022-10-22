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

	cmp 	$0, %rsi
	je	.end_of_input
        movq    %rdi, (%rsp)
        movq    %rsi, 8(%rsp)

        movq    $0, %rbx
        .scan:
                movq    (%rsp), %rax
                movq    %r14, %rdi
                leaq    .LC0(%rip), %rsi
                leaq    (%rax, %rbx, 8), %rdx
                call    __isoc99_fscanf@PLT

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
        movq    %rdi, (%rsp)
        movq    %rsi, 8(%rsp)

        movq    $0, %rbx
        .print:
                movq    (%rsp), %rax
                movq    %r14, %rdi
                leaq    .LC0(%rip), %rsi
                movq    (%rax, %rbx, 8), %rdx
                call    fprintf@PLT

                incq    %rbx
                cmp     %rbx, 8(%rsp)
                je      .end_of_print

                movq    %r14, %rdi
                leaq    .LC1(%rip), %rsi
                call    fprintf@PLT

                cmp     %rbx, 8(%rsp)
                ja      .print

        .end_of_print:
                movq    %r14, %rdi
                leaq    .LC2(%rip), %rsi
                call    fprintf@PLT

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
		movq	%rbp, %rsp
                popq	%rbp
                ret
        .size   make_new_array, .-make_new_array
