.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	
	str1 byte "vegeta",0
	lenStr1 = ($-str1) 
	str2 byte lenStr1 DUP(0) 
					
	

.code
	main proc
			mov eax, 0
			mov esi, offset str1
			mov edi, offset str2 
			mov ecx, lenStr1-1

			L1:
				mov al, [esi]
				sub al, 20h 
				mov [edi], al
				inc esi
				inc edi
				loop L1

		

		INVOKE ExitProcess, 0
	main endp
END main