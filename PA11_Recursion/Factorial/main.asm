.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	num dword 4
	fact dword ?
.code
	main proc

		push ebx
		push ecx
		push edx

		push num
		mov eax, 1
		xor ebx, ebx
		call factorial

		mov fact, eax

		pop edx
		pop ecx
		pop ebx

		INVOKE ExitProcess, 0
	main endp

	factorial proc
		push ebp
		mov ebp, esp

		mov ebx, [ebp+8]	;num

		cmp ebx, 1
		je doneFactorial

		dec ebx
		push ebx

		call factorial 

		pop ebx

		mov ebx, [ebp+8]
		mul ebx

		doneFactorial:
			mov esp, ebp
			pop ebp
			ret 4
			
	factorial endp
	

END main