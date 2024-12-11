.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	
	str1 byte "Thanos",0
	str1Length = ($-str1) - 1
	str2 byte "Thor",0
	str2Length = ($-str2) - 1
	diff byte ?

.code
	main proc

		push esi 
		push edi
		push ecx
		push edx
		push eax

		mov esi, offset str1
		mov edi, offset str2
		mov ecx, str1Length
		mov edx, str2Length

		call compareToIgnoreCase

		mov [diff], al

		pop eax
		pop edx
		pop ecx
		pop edi
		pop esi
		
		INVOKE ExitProcess, 0

	main endp

	compareToIgnoreCase proc

		push esi
		push ecx
		call toLowerCase
		pop ecx
		pop esi

		push esi
		push ecx
		push edi
		push edx
		mov esi, edi
		mov ecx, edx
		call toLowerCase
		pop edx
		pop edi
		pop ecx
		pop esi

		push esi
		push edi
		push ecx
		call compareStrings
		pop ecx
		pop edi
		pop esi


		ret

	compareToIgnoreCase endp	

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
		mov eax, 0

		cmp ecx, edx
		jg chooseStr2
		jmp Loop3

		chooseStr2:
			mov ecx, edx

		Loop3:
			dec ecx

		Loop1:
			mov bl, [esi]
			mov bh, [edi]
			cmp bl, bh
			jne Loop2
			inc esi
			inc edi
			loop Loop1
		
		sub ecx, edx
		mov eax, ecx
		jmp done

		Loop2: 
			sub bl, bh
			movzx eax, bl

		done:
			ret



	compareStrings endp	


END main