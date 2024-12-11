.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data

	str1 byte "mississipi", 0
	strLength = ($-str1)
	oldChar byte "s"
	newChar byte "p"

.code
	main proc
		push eax
		push ebx
		push ecx
		push esi

		mov esi, offset str1
		mov ecx, strLength - 1
		mov bl, oldChar
		mov bh, newChar

		call replaceAll

		pop esi
		pop ecx
		pop ebx
		pop eax
		
		INVOKE ExitProcess, 0
	main endp

	replaceAll proc
		
		CompareChars:
			cmp ecx, 0
			je Done

			cmp [esi], bl
			je SameChar

			inc esi
			loop CompareChars
			ret

		SameChar:
			mov [esi], bh
			inc esi
			loop CompareChars
			ret

		Done:
			ret
			
	replaceAll endp


END main