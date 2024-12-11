.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	
	str1 byte "0123456789",0
	lenStr1 = ($-str1) 
	arr1 byte lenStr1 DUP(0) 
					
	

.code
	main proc
			mov eax, 0
			mov esi, offset str1
			mov edi, offset arr1 
			mov ecx, lenStr1-1

			L1:
				mov al, [esi]
				sub al, 30h 
				mov [edi], al
				inc esi
				inc edi
				loop L1

		

		INVOKE ExitProcess, 0
	main endp
END main