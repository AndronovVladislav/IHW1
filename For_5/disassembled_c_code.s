# описание некоторой информации о программе, вроде
# названия, форматной строки для ввода-вывода и пр.
        .file   "IHW.c"
        .text
        .section        .rodata
.LC0:
        .string "%d"
        .text
        # описание функции input()
        .globl  input
        .type   input, @function
input:
        endbr64
        pushq   %rbp # пролог функции
        movq    %rsp, %rbp
        subq    $32, %rsp
        movq    %rdi, -24(%rbp) # адрес начала массива array(rdi) становится значением ячейки памяти по адресу rbp - 24
        movl    %esi, -28(%rbp) # значение параметра size(esi) становится значением ячейки памяти по адресу rbp - 28
        movl    $0, -4(%rbp)
        jmp     .L2 # заход в цикл
.L3: # тело цикла
        movl    -4(%rbp), %eax
        cltq
        leaq    0(,%rax,4), %rdx
        movq    -24(%rbp), %rax
        addq    %rdx, %rax
        movq    %rax, %rsi
        leaq    .LC0(%rip), %rdi
        movl    $0, %eax
        call    __isoc99_scanf@PLT
        addl    $1, -4(%rbp)
.L2: # проверка условия
        movl    -4(%rbp), %eax
        cmpl    -28(%rbp), %eax # сравнение i
        jl      .L3
        nop
        nop
        leave # эпилог функции
        ret
        .size   input, .-input
        # описание функции make_new_array
        .globl  make_new_array
        .type   make_new_array, @function
make_new_array:
        endbr64
        pushq   %rbp # пролог функции
        movq    %rsp, %rbp
        movq    %rdi, -24(%rbp) # адрес начала массива old_array(rdi) становится значением ячейки памяти по адресу rbp - 24
        movq    %rsi, -32(%rbp) # адрес начала массива new_array(rsi) становится значением ячейки памяти по адресу rbp - 32
        movl    %edx, -36(%rbp) # значение параметра size(edx) становится значением ячейки памяти по адресу rbp - 36
        movl    $0, -16(%rbp)
        movl    $0, -12(%rbp)
        jmp     .L5 # заход в цикл
.L7: # тело первого цикла
        movl    -12(%rbp), %eax
        cltq
        leaq    0(,%rax,4), %rdx
        movq    -24(%rbp), %rax
        addq    %rdx, %rax
        movl    -16(%rbp), %edx
        movslq  %edx, %rdx
        leaq    0(,%rdx,4), %rcx
        movq    -32(%rbp), %rdx
        addq    %rcx, %rdx
        movl    (%rax), %eax
        movl    %eax, (%rdx)
        addl    $2, -12(%rbp)
        addl    $1, -16(%rbp)
.L5: # проверка условий
        movl    -36(%rbp), %eax
        addl    $1, %eax
        movl    %eax, %edx
        shrl    $31, %edx
        addl    %edx, %eax
        sarl    %eax
        cmpl    %eax, -16(%rbp) # сравнение i
        jge     .L6
        movl    -12(%rbp), %eax
        cmpl    -36(%rbp), %eax # сравнение j
        jl      .L7
.L6:
        movl    -36(%rbp), %eax
        addl    $1, %eax
        movl    %eax, %edx
        shrl    $31, %edx
        addl    %edx, %eax
        sarl    %eax
        movl    %eax, -8(%rbp)
        movl    $1, -4(%rbp)
        jmp     .L8
.L10: # тело второго цикла
        movl    -4(%rbp), %eax
        cltq
        leaq    0(,%rax,4), %rdx
        movq    -24(%rbp), %rax
        addq    %rdx, %rax
        movl    -8(%rbp), %edx
        movslq  %edx, %rdx
        leaq    0(,%rdx,4), %rcx
        movq    -32(%rbp), %rdx
        addq    %rcx, %rdx
        movl    (%rax), %eax
        movl    %eax, (%rdx)
        addl    $2, -4(%rbp)
        addl    $1, -8(%rbp)
.L8: # проверка условий
        movl    -8(%rbp), %eax
        cmpl    -36(%rbp), %eax # сравнение i
        jge     .L11
        movl    -4(%rbp), %eax
        cmpl    -36(%rbp), %eax # сравнение j
        jl      .L10
.L11:
        nop
        popq    %rbp # эпилог функции
        ret
        .size   make_new_array, .-make_new_array
        # описание функции output
        .globl  output
        .type   output, @function
output:
        endbr64
        pushq   %rbp # эпилог функции
        movq    %rsp, %rbp
        subq    $32, %rsp
        movq    %rdi, -24(%rbp) # адрес начала массива array(rdi) становится значением ячейки памяти по адресу rbp - 24
        movl    %esi, -28(%rbp) # значение параметра size(esi) становится значением ячейки памяти по адресу rbp - 28
        movl    $0, -4(%rbp)
        jmp     .L13
.L16: # тело цикла
        movl    -4(%rbp), %eax
        cltq
        leaq    0(,%rax,4), %rdx
        movq    -24(%rbp), %rax
        addq    %rdx, %rax
        movl    (%rax), %eax
        movl    %eax, %esi
        leaq    .LC0(%rip), %rdi
        movl    $0, %eax
        call    printf@PLT
        movl    -28(%rbp), %eax
        subl    $1, %eax
        cmpl    %eax, -4(%rbp)
        je      .L14
        movl    $32, %edi
        call    putchar@PLT
        jmp     .L15
.L14:
        movl    $10, %edi
        call    putchar@PLT
.L15:
        addl    $1, -4(%rbp)
.L13: # проверка условия
        movl    -4(%rbp), %eax
        cmpl    -28(%rbp), %eax # сравнение i
        jl      .L16
        nop
        nop
        leave # эпилог функции
        ret
        .size   output, .-output
        # описание функции main
        .globl  main
        .type   main, @function
main:
        endbr64
        pushq   %rbp # пролог функции
        movq    %rsp, %rbp
        pushq   %r15
        pushq   %r14
        pushq   %r13
        pushq   %r12
        pushq   %rbx

        subq    $88, %rsp # стек выравивается по 64-байтной границе
        movq    %fs:40, %rax # защита стека
        movq    %rax, -56(%rbp) #  rax(fs:40) -> qword[rbp - 56]
        xorl    %eax, %eax # зануление eax
        movq    %rsp, %rax # rsp -> rax
        movq    %rax, %rbx # rax -> rbx
        leaq    -92(%rbp), %rax # загрузка адреса переменной адреса
                                # rbp - 92 в rax(это адрес на стеке, где лежит переменная n)

        movq    %rax, %rsi # &n -> rsi(чтобы соблюсти соглашение о вызовах)
        leaq    .LC0(%rip), %rdi # "%d" -> rdi
        movl    $0, %eax # 0 -> eax
        call    __isoc99_scanf@PLT # считывание n
        movl    -92(%rbp), %eax # n -> eax
        movslq  %eax, %rdx # данные в eax расиширяются до 64 бит и переносятся в rdx, но нас это мало интересует,
                           # так как мы не используем возвращаемое scanf значение
        subq    $1, %rdx
        movq    %rdx, -88(%rbp)
        movslq  %eax, %rdx
        movq    %rdx, -112(%rbp)
        movq    $0, -104(%rbp)
        movslq  %eax, %rdx
        movq    %rdx, -128(%rbp)
        movq    $0, -120(%rbp)
        cltq
        leaq    0(,%rax,4), %rdx
        movl    $16, %eax
        subq    $1, %rax
        addq    %rdx, %rax
        movl    $16, %edi
        movl    $0, %edx
        divq    %rdi
        imulq   $16, %rax, %rax
        movq    %rax, %rdx
        andq    $-4096, %rdx
        movq    %rsp, %rcx
        subq    %rdx, %rcx
        movq    %rcx, %rdx
.L18:
        cmpq    %rdx, %rsp
        je      .L19
        subq    $4096, %rsp
        orq     $0, 4088(%rsp)
        jmp     .L18
.L19:
        movq    %rax, %rdx
        andl    $4095, %edx
        subq    %rdx, %rsp
        movq    %rax, %rdx
        andl    $4095, %edx
        testq   %rdx, %rdx
        je      .L20
        andl    $4095, %eax
        subq    $8, %rax
        addq    %rsp, %rax
        orq     $0, (%rax)
.L20:
        movq    %rsp, %rax
        addq    $3, %rax
        shrq    $2, %rax
        salq    $2, %rax
        movq    %rax, -80(%rbp)
        movl    -92(%rbp), %eax
        movslq  %eax, %rdx
        subq    $1, %rdx
        movq    %rdx, -72(%rbp)
        movslq  %eax, %rdx
        movq    %rdx, %r14
        movl    $0, %r15d
        movslq  %eax, %rdx
        movq    %rdx, %r12
        movl    $0, %r13d
        cltq
        leaq    0(,%rax,4), %rdx
        movl    $16, %eax
        subq    $1, %rax
        addq    %rdx, %rax
        movl    $16, %ecx
        movl    $0, %edx
        divq    %rcx
        imulq   $16, %rax, %rax
        movq    %rax, %rdx
        andq    $-4096, %rdx
        movq    %rsp, %rsi
        subq    %rdx, %rsi
        movq    %rsi, %rdx
.L21:
        cmpq    %rdx, %rsp
        je      .L22
        subq    $4096, %rsp
        orq     $0, 4088(%rsp)
        jmp     .L21
.L22:
        movq    %rax, %rdx
        andl    $4095, %edx
        subq    %rdx, %rsp
        movq    %rax, %rdx
        andl    $4095, %edx
        testq   %rdx, %rdx
        je      .L23
        andl    $4095, %eax
        subq    $8, %rax
        addq    %rsp, %rax
        orq     $0, (%rax)
.L23:
        # вызов самописных функций, выше -
        # служебное, scanf и создание массивов
        movq    %rsp, %rax
        addq    $3, %rax
        shrq    $2, %rax
        salq    $2, %rax
        movq    %rax, -64(%rbp)
        movl    -92(%rbp), %edx
        movq    -80(%rbp), %rax
        movl    %edx, %esi # загрузка значения переменной n в регистр esi
        movq    %rax, %rdi # загрузка адреса начала массива old_array в регистр rdi
        call    input # вызов функции input, она void, поэтому ничего не возвращает

        movl    -92(%rbp), %edx # загрузка значения переменной n в регистр edx
        movq    -64(%rbp), %rcx # загрузка адреса начала массива new_array в регистр rcx
        movq    -80(%rbp), %rax # загрузка адреса начала массива old_array в регистр rax
        movq    %rcx, %rsi # загрузка адреса начала массива new_array в регистр rsi
        movq    %rax, %rdi # загрузка адреса начала массива old_array в регистр rdi
        call    make_new_array # вызов функции make_new_array, она void, поэтому ничего не возвращает

        movl    -92(%rbp), %edx
        movq    -64(%rbp), %rax
        movl    %edx, %esi # загрузка значения переменной n в регистр esi
        movq    %rax, %rdi # загрузка адреса начала массива new_array
        call    output # вызов функции output, она void, поэтому ничего не возвращает

        movl    $0, %eax
        movq    %rbx, %rsp
        movq    -56(%rbp), %rbx
        xorq    %fs:40, %rbx
        je      .L25
        call    __stack_chk_fail@PLT
.L25:
        leaq    -40(%rbp), %rsp # эпилог функции
        popq    %rbx
        popq    %r12
        popq    %r13
        popq    %r14
        popq    %r15
        popq    %rbp
        ret
        .size   main, .-main
        .ident  "GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
        .section        .note.GNU-stack,"",@progbits
        .section        .note.gnu.property,"a"
        .align 8
        .long    1f - 0f
        .long    4f - 1f
        .long    5
0:
        .string  "GNU"
1:
        .align 8
        .long    0xc0000002
        .long    3f - 2f
2:
        .long    0x3
3:
        .align 8
4:
