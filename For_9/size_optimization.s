	.file	"c_code.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d"
	.text
	.globl	input
	.type	input, @function
input:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	.LC0(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	xorl	%ebx, %ebx
	pushq	%rdx
	.cfi_def_cfa_offset 48
.L2:
	cmpl	%ebx, %ebp
	jle	.L6
	leaq	(%r12,%rbx,4), %rsi
	movq	%r13, %rdi
	xorl	%eax, %eax
	incq	%rbx
	call	__isoc99_scanf@PLT
	jmp	.L2
.L6:
	popq	%rax
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	input, .-input
	.globl	make_new_array
	.type	make_new_array, @function
make_new_array:
.LFB25:
	.cfi_startproc
	endbr64
	leal	1(%rdx), %eax
	movl	%edx, %ecx
	movl	$2, %r8d
	cltd
	idivl	%r8d
	xorl	%edx, %edx
.L8:
	leal	(%rdx,%rdx), %r8d
	cmpl	%r8d, %ecx
	jle	.L13
	cmpl	%edx, %eax
	jle	.L13
	movl	(%rdi,%rdx,8), %r8d
	movl	%r8d, (%rsi,%rdx,4)
	incq	%rdx
	jmp	.L8
.L13:
	cltq
	movl	$1, %edx
.L11:
	cmpl	%eax, %edx
	movl	%eax, %r8d
	cmovg	%edx, %r8d
	cmpl	%ecx, %r8d
	jge	.L17
	movl	(%rdi,%rdx,4), %r8d
	addq	$2, %rdx
	movl	%r8d, (%rsi,%rax,4)
	incq	%rax
	jmp	.L11
.L17:
	ret
	.cfi_endproc
.LFE25:
	.size	make_new_array, .-make_new_array
	.globl	output
	.type	output, @function
output:
.LFB26:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leal	-1(%rsi), %r13d
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	xorl	%ebx, %ebx
	pushq	%rdx
	.cfi_def_cfa_offset 48
.L19:
	cmpl	%ebx, %ebp
	jle	.L25
	movl	(%r12,%rbx,4), %edx
	movl	$1, %edi
	leaq	.LC0(%rip), %rsi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$32, %edi
	cmpl	%ebx, %r13d
	jne	.L24
	movl	$10, %edi
.L24:
	call	putchar@PLT
	incq	%rbx
	jmp	.L19
.L25:
	popq	%rax
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE26:
	.size	output, .-output
	.section	.rodata.str1.1
.LC2:
	.string	"%lf\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB27:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	.LC0(%rip), %rdi
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	leaq	-44(%rbp), %rsi
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
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
.L27:
	cmpq	%rcx, %rsp
	je	.L28
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L27
.L28:
	andl	$4095, %edx
	subq	%rdx, %rsp
	testq	%rdx, %rdx
	je	.L29
	orq	$0, -8(%rsp,%rdx)
.L29:
	movq	%rax, %rdx
	movq	%rsp, %rdi
	andq	$-4096, %rax
	movq	%rsp, %rbx
	subq	%rax, %rdi
	andq	$-16, %rdx
	movq	%rdi, %rax
.L30:
	cmpq	%rax, %rsp
	je	.L31
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L30
.L31:
	movq	%rdx, %rax
	andl	$4095, %eax
	subq	%rax, %rsp
	testq	%rax, %rax
	je	.L32
	orq	$0, -8(%rsp,%rax)
.L32:
	movq	%rbx, %rdi
	movq	%rsp, %r13
	call	input
	call	clock@PLT
	movl	$200000000, %r9d
	movq	%rax, %r12
.L33:
	movl	-44(%rbp), %edx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	make_new_array
	decl	%r9d
	jne	.L33
	call	clock@PLT
	leaq	.LC2(%rip), %rsi
	movl	$1, %edi
	subq	%r12, %rax
	cvtsi2sdq	%rax, %xmm0
	movb	$1, %al
	divsd	.LC1(%rip), %xmm0
	call	__printf_chk@PLT
	movl	-44(%rbp), %esi
	movq	%r13, %rdi
	call	output
	movq	-40(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L34
	call	__stack_chk_fail@PLT
.L34:
	leaq	-24(%rbp), %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
