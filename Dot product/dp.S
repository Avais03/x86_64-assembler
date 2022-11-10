	.intel_syntax noprefix
	.globl	dot_product
dot_product:
	// N = rdi, A = rsi, B = rdx		// ps(i:j) - packaged sum on the segment [i, j]
	vxorps	ymm3, ymm3, ymm3 		// ymm3 = 0
	mov	rax, 8				// i = rax = 8
while_blocs8_possible:
	cmp	rax, rdi 			// i ? N
	jge	blocs8_impossible 		// i >= N -> end of avx_loop

	sub rax, 8 				// i -= 8 - return to current part of array
	vmovups ymm2, [rsi+rax*4] 		// ymm2 = A[i:i+8]
    	vmovups ymm1, [rdx+rax*4] 		// ymm1 = B[i:i+8]
    	vmulps ymm0, ymm1, ymm2 		// ymm0 = A[i:i+8] * B[i:i+8] by element
    	vaddps ymm3, ymm3, ymm0 		// ymm3 += mul_by_element[i:i+8]
	add	rax, 16 			// i += 16 - to break if remain less then 8 elements
	jmp	while_blocs8_possible 		// return to start of the avx_loop
blocs8_impossible:
	sub rax, 8 				// i -= 8 - return to current part of array
	vhaddps ymm3, ymm3, ymm3
	vhaddps ymm3, ymm3, ymm3
	vextractf128 xmm0, ymm3, 0 		// xmm0 = ps(0:(N-N%8)/2)
	vextractf128 xmm1, ymm3, 1 		// xmm1 = ps((N-N%8)/2:(N-N%8))
	vaddps xmm0, xmm0, xmm1 		// xmm0 = dp(0:N-N%8)
	vxorps xmm2, xmm2, xmm2 		// xmm2 = 0 = dp(N-N%8, N-N%8)
while_leftover:
	cmp	rax, rdi 			// i ? N
	je	end 				// i == N -> end of loop
    	vmovss	xmm1, DWORD PTR [rsi+rax*4] 	// xmm1 = A[i]
	vmulss	xmm1, xmm1, DWORD PTR [rdx+rax*4] // xmm1 = A[i] * B[i]
	vaddss 	xmm2, xmm2, xmm1 		// dp(N-N%8, i-1) += A[i] * B[i]
	inc	rax 				// ++i
	jmp	while_leftover 			// return to start of the loop
	
end:	
	vaddss xmm0, xmm0, xmm2 			// dp(0, N) = dp(0, N-N%8) + dp(N-N%8, N)
	ret
