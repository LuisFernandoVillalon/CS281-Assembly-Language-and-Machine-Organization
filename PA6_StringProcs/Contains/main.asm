.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	str1 byte "batman",0
	lenStr1 = ($-str1)
	str2 byte "atmr",0
	lenStr2 = ($-str2)
	flag byte ?

.code
	main proc
		
		push esi
		push edi
		push ecx
		push edx
		push eax

		mov esi, offset str1
		mov edi, offset str2
		mov ecx, lenStr1 - 1
		mov edx, lenStr2 - 1

		call indexOf
		mov flag, al

		pop eax
		pop edx
		pop ecx
		pop edi
		pop esi

		
		INVOKE ExitProcess, 0
	main endp

	indexOf proc
		mov eax, -1
		L1: ;loop traverses bigger String
			mov bh, byte ptr [esi]
			mov bl, byte ptr [edi]
			cmp bh, bl
			je L2

			inc esi
			loop L1
		jmp done

		L2: 
			push esi
			push edi
			push ecx
			push edx
			sub edx, 1
			mov ecx, edx
			
			L3: ;loop traverses both String1 and String2 simultaneously
				inc esi
				inc edi

				mov dh, byte ptr[esi]
				mov dl, byte ptr[edi]
				cmp dh, dl
				jne reset
				loop L3
			jmp match

		reset:
			pop edx
			pop ecx
			pop edi
			pop esi
			inc esi
			dec ecx
			jmp L1

		match: 
			mov eax, 1
			pop edx
			pop ecx
			pop edi
			pop esi
			jmp done

		done:
			ret
	indexOf endp


END main