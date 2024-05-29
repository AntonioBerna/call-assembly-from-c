.intel_syntax noprefix

.global fast_add
.global fast_sub
.global fast_mul
.global fast_div

.text

fast_add:
	mov eax, edi   # move "x" (edi) to eax
	add eax, esi   # add "y" (esi) to eax and store in eax (x = x + y)
	ret

fast_sub:
	mov eax, edi   # move "x" (edi) to eax
	sub eax, esi   # subtract "y" (esi) from eax and store in eax (x = x - y)
	ret

fast_mul:
	mov eax, edi   # move "x" (edi) to eax
	imul eax, esi  # multiply "y" (esi) with eax and store in eax (x = x * y)
	ret

fast_div:
	mov eax, edi   # move "x" (edi) to eax
	cdq            # sign extend eax into edx:eax
	idiv esi       # divide edx:eax by y and store in eax (x / y)
	ret
