; описание некоторой информации о программе, вроде
; названия, форматной строки для ввода-вывода и пр.
        .file   "IHW.c"
        .intel_syntax noprefix
        .text
        .section        .rodata
.LC0:
        .string "%d"
        .text
        .globl  input
        .type   input, @function

; описание функции input()
input:
        endbr64
        push    rbp ; пролог функции
        mov     rbp, rsp 
        sub     rsp, 32
        mov     QWORD PTR -24[rbp], rdi
        mov     DWORD PTR -28[rbp], esi
        mov     DWORD PTR -4[rbp], 0
        jmp     .L2 ; заход в цикл
.L3: ; тело цикла
        mov     eax, DWORD PTR -4[rbp]
        cdqe
        lea     rdx, 0[0+rax*4]
        mov     rax, QWORD PTR -24[rbp]
        add     rax, rdx
        mov     rsi, rax
        lea     rdi, .LC0[rip]
        mov     eax, 0
        call    __isoc99_scanf@PLT
        add     DWORD PTR -4[rbp], 1
.L2: ; проверка условия
        mov     eax, DWORD PTR -4[rbp]
        cmp     eax, DWORD PTR -28[rbp] ; сравнение i
        jl      .L3
        nop
        nop
        leave ; эпилог функции
        ret
        .size   input, .-input
        ; описание функции make_new_array
        .globl  make_new_array
        .type   make_new_array, @function
make_new_array:
        endbr64
        push    rbp ; пролог функции
        mov     rbp, rsp
        mov     QWORD PTR -24[rbp], rdi
        mov     QWORD PTR -32[rbp], rsi
        mov     DWORD PTR -36[rbp], edx
        mov     DWORD PTR -16[rbp], 0
        mov     DWORD PTR -12[rbp], 0
        jmp     .L5 ; заход в цикл
.L7: ; тело первого цикла
        mov     eax, DWORD PTR -12[rbp]
        cdqe
        lea     rdx, 0[0+rax*4]
        mov     rax, QWORD PTR -24[rbp]
        add     rax, rdx
        mov     edx, DWORD PTR -16[rbp]
        movsx   rdx, edx
        lea     rcx, 0[0+rdx*4]
        mov     rdx, QWORD PTR -32[rbp]
        add     rdx, rcx
        mov     eax, DWORD PTR [rax]
        mov     DWORD PTR [rdx], eax
        add     DWORD PTR -12[rbp], 2
        add     DWORD PTR -16[rbp], 1
.L5: ; проверка условий
        mov     eax, DWORD PTR -36[rbp]
        add     eax, 1
        mov     edx, eax
        shr     edx, 31
        add     eax, edx
        sar     eax
        cmp     DWORD PTR -16[rbp], eax ; сравнение i
        jge     .L6
        mov     eax, DWORD PTR -12[rbp]
        cmp     eax, DWORD PTR -36[rbp] ; сравнение j
        jl      .L7
.L6:
        mov     eax, DWORD PTR -36[rbp]
        add     eax, 1
        mov     edx, eax
        shr     edx, 31
        add     eax, edx
        sar     eax
        mov     DWORD PTR -8[rbp], eax
        mov     DWORD PTR -4[rbp], 1
        jmp     .L8
.L10: ; тело второго цикла
        mov     eax, DWORD PTR -4[rbp]
        cdqe
        lea     rdx, 0[0+rax*4]
        mov     rax, QWORD PTR -24[rbp]
        add     rax, rdx
        mov     edx, DWORD PTR -8[rbp]
        movsx   rdx, edx
        lea     rcx, 0[0+rdx*4]
        mov     rdx, QWORD PTR -32[rbp]
        add     rdx, rcx
        mov     eax, DWORD PTR [rax]
        mov     DWORD PTR [rdx], eax
        add     DWORD PTR -4[rbp], 2
        add     DWORD PTR -8[rbp], 1
.L8: ; проверка условий
        mov     eax, DWORD PTR -8[rbp]
        cmp     eax, DWORD PTR -36[rbp] ; сравнение i
        jge     .L11
        mov     eax, DWORD PTR -4[rbp]
        cmp     eax, DWORD PTR -36[rbp] ; сравнение j
        jl      .L10
.L11:
        nop
        pop     rbp ; эпилог функции
        ret
        .size   make_new_array, .-make_new_array
        ; описание функции output
        .globl  output
        .type   output, @function
output:
        endbr64
        push    rbp ; эпилог функции
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR -24[rbp], rdi
        mov     DWORD PTR -28[rbp], esi
        mov     DWORD PTR -4[rbp], 0
        jmp     .L13
.L16: ; тело цикла
        mov     eax, DWORD PTR -4[rbp]
        cdqe
        lea     rdx, 0[0+rax*4]
        mov     rax, QWORD PTR -24[rbp]
        add     rax, rdx
        mov     eax, DWORD PTR [rax]
        mov     esi, eax
        lea     rdi, .LC0[rip]
        mov     eax, 0
        call    printf@PLT
        mov     eax, DWORD PTR -28[rbp]
        sub     eax, 1
        cmp     DWORD PTR -4[rbp], eax
        je      .L14
        mov     edi, 32
        call    putchar@PLT
        jmp     .L15
.L14:
        mov     edi, 10
        call    putchar@PLT
.L15:
        add     DWORD PTR -4[rbp], 1
.L13: ; проверка условия
        mov     eax, DWORD PTR -4[rbp]
        cmp     eax, DWORD PTR -28[rbp] ; сравнение i
        jl      .L16
        nop
        nop
        leave ; эпилог функции
        ret
        .size   output, .-output
        ; описание функции main
        .globl  main
        .type   main, @function
main:
        endbr64
        push    rbp ; пролог функции
        mov     rbp, rsp
        push    r15
        push    r14
        push    r13
        push    r12
        push    rbx
        sub     rsp, 88
        mov     rax, QWORD PTR fs:40
        mov     QWORD PTR -56[rbp], rax
        xor     eax, eax
        mov     rax, rsp
        mov     rbx, rax
        lea     rax, -92[rbp]
        mov     rsi, rax
        lea     rdi, .LC0[rip]
        mov     eax, 0
        call    __isoc99_scanf@PLT ; считывание n
        mov     eax, DWORD PTR -92[rbp]
        movsx   rdx, eax
        sub     rdx, 1
        mov     QWORD PTR -88[rbp], rdx
        movsx   rdx, eax
        mov     QWORD PTR -112[rbp], rdx
        mov     QWORD PTR -104[rbp], 0
        movsx   rdx, eax
        mov     QWORD PTR -128[rbp], rdx
        mov     QWORD PTR -120[rbp], 0
        cdqe
        lea     rdx, 0[0+rax*4]
        mov     eax, 16
        sub     rax, 1
        add     rax, rdx
        mov     edi, 16
        mov     edx, 0
        div     rdi
        imul    rax, rax, 16
        mov     rdx, rax
        and     rdx, -4096
        mov     rcx, rsp
        sub     rcx, rdx
        mov     rdx, rcx
.L18:
        cmp     rsp, rdx
        je      .L19
        sub     rsp, 4096
        or      QWORD PTR 4088[rsp], 0
        jmp     .L18
.L19:
        mov     rdx, rax
        and     edx, 4095
        sub     rsp, rdx
        mov     rdx, rax
        and     edx, 4095
        test    rdx, rdx
        je      .L20
        and     eax, 4095
        sub     rax, 8
        add     rax, rsp
        or      QWORD PTR [rax], 0
.L20:
        mov     rax, rsp
        add     rax, 3
        shr     rax, 2
        sal     rax, 2
        mov     QWORD PTR -80[rbp], rax
        mov     eax, DWORD PTR -92[rbp]
        movsx   rdx, eax
        sub     rdx, 1
        mov     QWORD PTR -72[rbp], rdx
        movsx   rdx, eax
        mov     r14, rdx
        mov     r15d, 0
        movsx   rdx, eax
        mov     r12, rdx
        mov     r13d, 0
        cdqe
        lea     rdx, 0[0+rax*4]
        mov     eax, 16
        sub     rax, 1
        add     rax, rdx
        mov     ecx, 16
        mov     edx, 0
        div     rcx
        imul    rax, rax, 16
        mov     rdx, rax
        and     rdx, -4096
        mov     rsi, rsp
        sub     rsi, rdx
        mov     rdx, rsi
.L21:
        cmp     rsp, rdx
        je      .L22
        sub     rsp, 4096
        or      QWORD PTR 4088[rsp], 0
        jmp     .L21
.L22:
        mov     rdx, rax
        and     edx, 4095
        sub     rsp, rdx
        mov     rdx, rax
        and     edx, 4095
        test    rdx, rdx
        je      .L23
        and     eax, 4095
        sub     rax, 8
        add     rax, rsp
        or      QWORD PTR [rax], 0
.L23: 
        ; вызов самописных функций, выше - 
        ; служебное, scanf и создание массивов
        mov     rax, rsp
        add     rax, 3
        shr     rax, 2
        sal     rax, 2
        mov     QWORD PTR -64[rbp], rax
        mov     edx, DWORD PTR -92[rbp]
        mov     rax, QWORD PTR -80[rbp]
        mov     esi, edx
        mov     rdi, rax
        call    input
        mov     edx, DWORD PTR -92[rbp]
        mov     rcx, QWORD PTR -64[rbp]
        mov     rax, QWORD PTR -80[rbp]
        mov     rsi, rcx
        mov     rdi, rax
        call    make_new_array
        mov     edx, DWORD PTR -92[rbp]
        mov     rax, QWORD PTR -64[rbp]
        mov     esi, edx
        mov     rdi, rax
        call    output
        mov     eax, 0
        mov     rsp, rbx
        mov     rbx, QWORD PTR -56[rbp]
        xor     rbx, QWORD PTR fs:40
        je      .L25
        call    __stack_chk_fail@PLT
.L25:
        lea     rsp, -40[rbp]
        pop     rbx ; эпилог функции
        pop     r12
        pop     r13
        pop     r14
        pop     r15
        pop     rbp
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