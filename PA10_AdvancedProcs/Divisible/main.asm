.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	nums dword 13, 26, 81, 90, 93, 130000, 17, 78273
	lenNums = ($-nums)/(type dword)
	val word 13
	count word 0
.code
	main proc

		pushad

		push offset nums
		push lenNums
		push val

		call isDivisible
		mov count, bx

		popad

		INVOKE ExitProcess, 0
	main endp

	isDivisible proc
	    ; Stack frame setup
		push ebp
		mov ebp, esp

		movzx ecx, word ptr [ebp+8]	; val
		mov edi, [ebp+10]	; lenNums
		mov esi, [ebp+14]	; offset nums
		xor ebx, ebx

		mainLoop:

			cmp edi, 0
			je done

			xor edx, edx
			mov eax, [esi]
			div ecx

			cmp edx, 0
			jne notDivisible

			inc bx
		
		notDivisible:
			dec edi
			add esi, 4
			jmp mainLoop

		done:
			mov esp, ebp
			pop ebp
			ret 10

	isDivisible ENDP

END main