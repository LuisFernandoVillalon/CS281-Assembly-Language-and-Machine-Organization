.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	
	str1 byte "WorKOfaRt",0
	str1Length = ($-str1) - 1
	str2 byte "woRKoFaRT",0
	str2Length = ($-str2) - 1
	areEqual byte 1

.code
	main proc

		push esi 
		push edi
		push ecx
		push eax

		mov esi, offset str1
		mov edi, offset str2
		mov ecx, str1Length

		call Equals

		mov [areEqual], al

		pop eax
		pop ecx
		pop edi
		pop esi
		
		INVOKE ExitProcess, 0

	main endp

	Equals proc

		push esi
		push ecx
		call toLowerCase
		pop ecx
		pop esi

		push esi
		push ecx
		push edi
		mov esi, edi
		call toLowerCase
		pop edi
		pop ecx
		pop esi

		push esi
		push ecx
		push edi
		call compareStrings
		pop edi
		pop ecx
		pop esi

		ret

	Equals endp	

	toLowerCase proc

		Loop1:
			cmp ecx, 0
			je Done

			mov al, [esi]
			cmp al, "A"
			jl SkipConversion
			cmp al, "Z"
			jg SkipConversion

			add al, 32
			mov [esi], al

	
		SkipConversion:
			inc esi
			dec ecx
			jmp Loop1

		Done:
			ret

	toLowerCase endp	

	compareStrings proc

		Loop1:
			cmp ecx, 0
			je StringsAreEqual

			mov al, [esi]
			mov bl, [edi]
			cmp al, bl
			jne StringsAreNotEqual

			inc esi
			inc edi
			loop Loop1

		StringsAreEqual:
			mov eax, 1
			ret

		StringsAreNotEqual:
			mov eax, 0
			ret



	compareStrings endp	


END main