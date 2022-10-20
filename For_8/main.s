	.section .rodata
	.debug:
		.string "I was here"
	.text
	.globl  main
        .type   main, @function
main:
        pushq   %rbp
        movq    %rsp, %rbp
	subq	$16, %rsp
        
        cmp	$1, %rdi
	jg	.start_with_prepared

	call	start_with_random
	jmp	.end_main
	.start_with_prepared:
		call start_with_prepared_file
	
	.end_main:
		addq	$16, %rsp
        	leave
		ret
