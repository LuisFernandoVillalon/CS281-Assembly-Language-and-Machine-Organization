.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	arr dword 12, 26, 41, 52, 62, 70
	arrLength = ($ - arr) / 4
	sum dword 0
.code
	main proc

		push eax
		push ebx
		push ecx	

		mov eax, offset arr
		mov ecx, arrLength
		
		call sumElements

		mov sum, ebx

		pop ecx
		pop ebx
		pop eax
		
		INVOKE ExitProcess, 0
	main endp

	sumElements proc
		mov ebx, 0
		L1:
			add ebx, dword ptr [eax]
			add eax, 4;
			dec ecx
			jnz L1 
		ret
	
	sumElements endp

END main