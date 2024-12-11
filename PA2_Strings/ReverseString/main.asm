.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	str1 byte "Gohan",0
	lenStr1 = ($-str1) 
	str2 byte lenStr1 DUP(0)

.code
	main proc

			mov eax, 0
			mov esi, offset str1 + lenStr1 - 2
			mov edi, offset str2 
			mov ecx, lenStr1-1

			L1:
				mov al, [esi]
				mov [edi], al
				inc edi
				dec esi
				loop L1

		
		INVOKE ExitProcess, 0
	main endp
END main