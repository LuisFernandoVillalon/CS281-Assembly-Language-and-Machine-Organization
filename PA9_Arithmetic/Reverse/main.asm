.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	num word 1258    
	rev word 0       

.code
main proc
		push ax
		push esi

		mov ax, num           
		mov esi, offset rev   

		call reverse          

		pop esi
		pop ax
		
		INVOKE ExitProcess, 0
main endp

reverse proc
		xor ebx, ebx       
		mov cx, 10         

reverseLoop:
		cmp ax, 0           
		je reverseDone      ; If yes, jump to reverseDone (exit loop)

		xor edx, edx		
		div cx               ; Divide ax by 10

		push ax				; save ax, quotient
		push dx				; save dx, remainder

		mov ax, bx			; move reverse number onto ax
		mul cx               ; Multiply the current reversed number by 10

		pop dx				; restore remainder

		add ax, dx			; add remainder to total reverse number
		mov bx, ax			; store reverse number onto bx

		pop ax				; restore quotient
	
		jmp reverseLoop     ; Repeat the loop until ax is 0

reverseDone:
		mov [esi], bx       ; Store the reversed number in memory (rev)
		ret
reverse endp

END main

