.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	rows byte 3
	cols byte 4
	arr word 0F000h, 0F000h, 0F000h,0F000h
		word 0F000h, 0F000h, 0F000h,0F000h
		word 0F000h, 0F000h, 0F000h,0F000h
	count byte 0
	sum dword 0

.code
	main proc
		mov eax, 0
		mov esi, offset arr ;offset of first element in arr
		movzx ecx, rows

		outerLoop:
			mov count, cl ;save ecx (loop counter) to memory
			movzx ecx, cols ;initiliaze ecx to number of iterations for inner loop
			innerLoop:
				movzx eax, word ptr[esi] ;grab a word worth of data from memory (esi)
				add sum, eax
				add esi, type word
				loop innerLoop
			movzx ecx, count ;restore ecx for outer loop
			loop outerLoop

		INVOKE ExitProcess, 0
	main endp
END main