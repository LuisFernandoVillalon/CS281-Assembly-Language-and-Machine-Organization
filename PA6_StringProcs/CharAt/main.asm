.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	str1 byte "philadelphia eagles", 0  
	str1Length = ($ - str1) - 1         
	index byte 5                        
	foundChar byte ?                    

.code
	main proc

		push eax
		push ecx
		push ebx

		mov eax, offset str1            
		movzx ecx, index                
		mov ebx, 0                      

		call charAt

		mov foundChar, bl                ; Move the found character into the foundChar variable

		pop ebx
		pop ecx
		pop eax

		INVOKE ExitProcess, 0
	main endp

	charAt proc                   
		
	Loop1:                    
		inc eax       
		loop Loop1                       
		
	foundIndex:
		mov bl, [eax]                    ; Move the character at the found index into BL
		ret
	charAt endp

END main
