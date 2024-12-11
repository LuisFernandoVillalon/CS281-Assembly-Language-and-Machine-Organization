.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	arr word -5, 8, 13, 16, 29, 33
	arrLength = ($ - arr) / 2
	findElement word 16
	index word -1
.code
main proc

		push eax
		push ebx
		push ecx	
		push edx

		mov eax, offset arr
		mov ecx, arrLength
		mov bx, findElement
		mov edx, 0
		
		call indexOf

		mov index, dx

		pop edx
		pop ecx
		pop ebx
		pop eax
		
		INVOKE ExitProcess, 0
	main endp

	indexOf proc
		
		L1:
			cmp word ptr [eax], bx
			je EqualTo
			add eax, 2
			inc edx
			loop L1


		EqualTo:
			inc edx
			ret

		
	indexOf endp

END main