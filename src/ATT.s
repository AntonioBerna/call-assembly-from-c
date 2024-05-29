.section .text

.global fast_add
.global fast_sub
.global fast_mul
.global fast_div

fast_add:
	movl %edi, %eax   # move "x" (edi) to eax
	addl %esi, %eax   # add "y" (esi) to eax and store in eax (x = x + y)
	ret

fast_sub:
	movl %edi, %eax   # move "x" (edi) to eax
	subl %esi, %eax   # subtract "y" (esi) from eax and store in eax (x = x - y)
	ret

fast_mul:
	movl %edi, %eax   # move "x" (edi) to eax
	imull %esi, %eax  # multiply "y" (esi) with eax and store in eax (x = x * y)
	ret

fast_div:
	movl %edi, %eax   # move "x" (edi) to eax
	cdq               # sign extend eax into edx:eax
	idivl %esi        # divide edx:eax by y and store in eax (x / y)
	ret
