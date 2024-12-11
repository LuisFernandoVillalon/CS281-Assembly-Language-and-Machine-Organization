.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	num1 word 24
	num2 word 40
	gcd byte ?
.code
	main proc
		push ebx
		push edx
		push esi

		movzx ebx, num1
		movzx edx, num2
		mov esi, offset gcd

		call greatestComDiv

		pop esi
		pop edx
		pop ebx
		
		INVOKE ExitProcess, 0
	main endp
	greatestComDiv proc
		cmp ebx, edx
		jg setDiv
		mov eax, edx
		mov ecx, ebx
		jmp gcdLoop
		setDiv:
			mov eax, ebx
			mov ecx, edx
		gcdLoop: 
			xor edx, edx
			div ecx
			cmp edx, 0
			je foundGCD
			mov eax, ecx
			mov ecx, edx
			jmp gcdLoop
		foundGCD:
			mov [esi], ecx
			ret
			
			
	greatestComDiv endp
END main