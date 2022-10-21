	.file	"c_code.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
	.text
	.p2align 4
	.globl	input
	.type	input, @function
input:
	testl	%esi, %esi
	jle	.L6
	leal	-1(%rsi), %eax
	pushq	%r12
	leaq	4(%rdi,%rax,4), %r12
	pushq	%rbp
	leaq	.LC0(%rip), %rbp
	pushq	%rbx
	movq	%rdi, %rbx
	.p2align 4,,10
	.p2align 3
.L3:
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	xorl	%eax, %eax
	addq	$4, %rbx
	call	__isoc99_scanf@PLT
	cmpq	%r12, %rbx
	jne	.L3
	popq	%rbx
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	ret
	.size	input, .-input
	.p2align 4
	.globl	make_new_array
	.type	make_new_array, @function
make_new_array:
	leal	1(%rdx), %eax
	movl	%eax, %r8d
	shrl	$31, %r8d
	addl	%eax, %r8d
	sarl	%r8d
	movl	%r8d, %ecx
	testl	%edx, %edx
	jle	.L10
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L12:
	movl	-8(%rdi,%rax,8), %r9d
	movl	%r9d, -4(%rsi,%rax,4)
	leal	(%rax,%rax), %r9d
	cmpl	%r9d, %edx
	setg	%r10b
	cmpl	%eax, %r8d
	setg	%r9b
	addq	$1, %rax
	testb	%r9b, %r10b
	jne	.L12
	testl	%r8d, %r8d
	movl	$1, %eax
	cmovg	%r8d, %eax
	cmpl	%eax, %edx
	jle	.L10
	movslq	%r8d, %r8
	movl	$3, %eax
	leaq	(%rsi,%r8,4), %r8
	.p2align 4,,10
	.p2align 3
.L13:
	movl	-8(%rdi,%rax,4), %esi
	addl	$1, %ecx
	cmpl	%eax, %ecx
	movl	%esi, -6(%r8,%rax,2)
	movl	%eax, %esi
	cmovg	%ecx, %esi
	addq	$2, %rax
	cmpl	%edx, %esi
	jl	.L13
.L10:
	ret
	.size	make_new_array, .-make_new_array
	.p2align 4
	.globl	output
	.type	output, @function
output:
	testl	%esi, %esi
	jle	.L28
	pushq	%r14
	leal	-1(%rsi), %r14d
	pushq	%r13
	leaq	.LC0(%rip), %r13
	pushq	%r12
	movq	%r14, %r12
	pushq	%rbp
	movq	%rdi, %rbp
	pushq	%rbx
	xorl	%ebx, %ebx
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L30:
	movl	$32, %edi
	call	putchar@PLT
	leaq	1(%rbx), %rax
	cmpq	%rbx, %r14
	je	.L29
.L22:
	movq	%rax, %rbx
.L20:
	movl	0(%rbp,%rbx,4), %edx
	xorl	%eax, %eax
	movq	%r13, %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	cmpl	%ebx, %r12d
	jne	.L30
	movl	$10, %edi
	call	putchar@PLT
	leaq	1(%rbx), %rax
	cmpq	%rbx, %r14
	jne	.L22
.L29:
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L28:
	ret
	.size	output, .-output
	.section	.rodata.str1.1
.LC2:
	.string	"%lf\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	pushq	%rbp
	leaq	.LC0(%rip), %rdi
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%r13
	leaq	-44(%rbp), %rsi
	pushq	%r12
	pushq	%rbx
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -40(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rbx
	call	__isoc99_scanf@PLT
	movslq	-44(%rbp), %rax
	movq	%rax, %rsi
	leaq	15(,%rax,4), %rax
	movq	%rax, %rcx
	movq	%rax, %rdx
	andq	$-4096, %rcx
	andq	$-16, %rdx
	subq	%rcx, %rbx
	movq	%rbx, %rcx
	cmpq	%rcx, %rsp
	je	.L33
.L48:
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	cmpq	%rcx, %rsp
	jne	.L48
.L33:
	andl	$4095, %edx
	subq	%rdx, %rsp
	testq	%rdx, %rdx
	jne	.L49
.L34:
	movq	%rax, %rdx
	movq	%rsp, %rcx
	andq	$-4096, %rax
	movq	%rsp, %r13
	subq	%rax, %rcx
	andq	$-16, %rdx
	movq	%rcx, %rax
.L35:
	cmpq	%rax, %rsp
	je	.L36
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L35
.L49:
	orq	$0, -8(%rsp,%rdx)
	jmp	.L34
.L36:
	movq	%rdx, %rax
	andl	$4095, %eax
	subq	%rax, %rsp
	testq	%rax, %rax
	jne	.L50
.L37:
	movq	%r13, %rdi
	movq	%rsp, %r12
	movl	$200000000, %ebx
	call	input@PLT
	call	clock@PLT
	movq	%rax, %r14
	.p2align 4,,10
	.p2align 3
.L38:
	movl	-44(%rbp), %edx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	make_new_array@PLT
	subl	$1, %ebx
	jne	.L38
	call	clock@PLT
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	leaq	.LC2(%rip), %rsi
	subq	%r14, %rax
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	divsd	.LC1(%rip), %xmm0
	call	__printf_chk@PLT
	movl	-44(%rbp), %esi
	movq	%r12, %rdi
	call	output@PLT
	movq	-40(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L51
	leaq	-32(%rbp), %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	ret
.L50:
	orq	$0, -8(%rsp,%rax)
	jmp	.L37
.L51:
	call	__stack_chk_fail@PLT
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
