.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	
	num1 word 8
	num2 word 4
	prod dword ?

.code
	main proc

		push eax
		push ebx
		push edx

		mov edx, 0
		movzx eax, num1
		movzx ebx, num2

		call shiftMultiply
		mov prod, edx

		pop edx
		pop ebx
		pop eax
		
		INVOKE ExitProcess, 0
	main endp

	shiftMultiply proc
		shiftLoop: 
			shr ebx, 1		;divide by 2
			jc addLabel		;jumps if there is a remainder
			shl eax, 1		;multiply by 2
			cmp ebx, 0
			jne shiftLoop
			jmp done
		addLabel:
			add edx, eax
			shl eax, 1		;multiply by 2
			cmp ebx, 0          
			jne shiftLoop       
		done: 
			ret
	shiftMultiply endp


END main