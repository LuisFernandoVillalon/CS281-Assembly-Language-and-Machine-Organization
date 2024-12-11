.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	text byte "terabytes",0
	len = ($-text)-1
	key byte 6, 4, 1, 5, 3
	lenKey = ($-key)
	encrypted byte len DUP(0), 0
	decrypted byte len DUP(0), 0
.code
	main proc
		push esi
		push edi
		push eax
		push edx
		push ecx

		mov esi, offset text
		mov edi, offset encrypted
		mov eax, offset key
		mov edx, lenKey
		mov ecx, len

		call encrypt

		pop ecx
		pop edx
		pop eax
		pop edi
		pop esi

		push esi
		push edi
		push eax
		push edx
		push ecx

		mov esi, offset encrypted
		mov edi, offset decrypted
		mov eax, offset key
		mov edx, lenKey
		mov ecx, len

		call decrypt

		pop ecx
		pop edx
		pop eax
		pop edi
		pop esi

		INVOKE ExitProcess, 0
	main endp

	encrypt proc
		push edx
		push eax
		EncryptionLoop:

			push ecx
			mov bh, byte ptr [esi]
			mov cl, byte ptr [eax] ;rol/ror have to use cl 
			rol bh, cl
			mov byte ptr [edi], bh
			pop ecx

			inc esi 
			inc edi
			inc eax
			dec edx
			dec ecx

			cmp ecx, 0
			je done

			cmp edx, 0
			jne EncryptionLoop

			;resets key and lenKey
			pop eax
			pop edx
			push edx
			push eax
			jmp EncryptionLoop

		done:
			pop eax
			pop edx
			ret
	encrypt endp

	decrypt proc
		push edx
		push eax
		DecryptionLoop:

			push ecx
			mov bh, byte ptr [esi]
			mov cl, byte ptr [eax]
			ror bh, cl
			mov byte ptr [edi], bh
			pop ecx

			inc esi 
			inc edi
			inc eax
			dec edx
			dec ecx

			cmp ecx, 0
			je done

			cmp edx, 0
			jne DecryptionLoop

			;resets key and lenKey
			pop eax
			pop edx
			push edx
			push eax
			jmp DecryptionLoop

		done:
			pop eax
			pop edx
			ret
	decrypt endp

END main