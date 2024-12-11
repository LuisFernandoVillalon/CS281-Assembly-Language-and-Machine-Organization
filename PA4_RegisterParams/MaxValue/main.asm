.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	
	arr byte 23, -7, 101, -56, 22, 4
	arrLength = ($-arr)
	biggest byte ?

.code
	main proc
		
		push eax
		push ebx
		push ecx
		
		mov eax, offset arr
		mov ecx, arrLength - 1
		movsx ebx, byte ptr [eax]

		call maxValue

		mov biggest, bl

		pop ecx
		pop ebx
		pop eax

		
		INVOKE ExitProcess, 0
	main endp

	maxValue proc
		inc eax
		L1:
			cmp ecx, 0
			jle done

			movsx edx, byte ptr [eax]    
			cmp bl, dl   
			jge GreaterThan

			mov bl, dl
		
		GreaterThan:	
			dec ecx
			inc eax
			jmp L1
		
		done: 
			ret

	maxValue endp


END main