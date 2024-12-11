.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	str1 byte "WolveRinE2024**",0
	lenStr1 = ($-str1)-1
	lowerCase byte lenStr1 DUP(0), 0
	upperCase byte lenStr1 DUP(0), 0

.code
	main proc
		
		push esi
		push edi
		push ecx

		mov esi, offset str1
		mov edi, offset lowerCase
		mov ecx, lenStr1
		
		call toLowerCase
		
		pop ecx
		pop edi
		pop esi

		push esi
		push edi
		push ecx

		mov esi, offset str1
		mov edi, offset upperCase
		mov ecx, lenStr1
		
		call toUpperCase
		
		pop ecx
		pop edi
		pop esi

		
		INVOKE ExitProcess, 0
	main endp

	toLowerCase proc

		Loop1:
			cmp ecx, 0
			je Done

			mov al, byte ptr [esi]
			cmp al, "A"
			jl SkipConversion
			cmp al, "Z"
			jg SkipConversion

	        or al, 00100000b          ; Set the 6th bit to convert to lowercase, it could be 20h too

		SkipConversion:
			mov [edi], al
			inc esi
			inc edi
			dec ecx
			jmp Loop1

		Done:
			ret

	toLowerCase endp	

	toUpperCase proc

		Loop1:
			cmp ecx, 0
			je Done

			mov al, byte ptr [esi]
			cmp al, "a"
			jl SkipConversion
			cmp al, "z"
			jg SkipConversion

			and al, 11011111b         ; Clear the 6th bit to convert to uppercase
	
		SkipConversion:
			mov [edi], al
			inc esi
			inc edi
			dec ecx
			jmp Loop1

		Done:
			ret

	toUpperCase endp	


END main