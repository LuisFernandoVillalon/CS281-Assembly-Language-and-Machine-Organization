.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	state byte "Happy Halloween",0
	stateLength = ($ - state)
	letter byte "w"
	count byte 0
.code
	main proc

		push eax
		push ebx
		push ecx
		push edx
		
		mov ecx, stateLength - 1
		mov eax, offset state
		mov bl, letter
		movzx edx, count

		call countChars

		mov count, dl

		pop edx
		pop ecx
		pop ebx
		pop eax


		INVOKE ExitProcess, 0
	main endp

	countChars proc

		L1: 
			cmp [eax], bl
			je EqualTo
			inc eax
			loop L1
			ret

		EqualTo:
			inc edx
			inc eax
			loop L1
			ret

	countChars endp

END main