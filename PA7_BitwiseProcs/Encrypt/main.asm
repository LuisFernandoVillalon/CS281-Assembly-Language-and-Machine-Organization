.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	message byte "big bang",0
	len = ($-message)-1
	key byte 12h, 34h, 56h, 78h, 9Ah, 0ABh, 0BCh
	keyLen = ($-key)
	encrypted byte len DUP(0), 0
	decrypted byte len DUP(0), 0 

.code
	main proc
		 
		 push esi
		 push edi
		 push eax
		 push ebx
		 push ecx

		 mov esi, offset message
		 mov edi, offset encrypted
		 mov eax, offset key
		 mov ebx, keyLen
		 mov ecx, len

		 call encrypt

		 pop ecx
		 pop ebx
		 pop eax
		 pop edi
		 pop esi

		 push esi
		 push edi
		 push eax
		 push ebx
		 push ecx

		 mov esi, offset encrypted
		 mov edi, offset decrypted
		 mov eax, offset key
		 mov ebx, keyLen
		 mov ecx, len

		 call encrypt

		 pop ecx
		 pop ebx
		 pop eax
		 pop edi
		 pop esi
		 
		INVOKE ExitProcess, 0
	main endp

	encrypt proc

		 push eax
		 push ebx
		 
		EncryptLoop:
			cmp ecx, 0
			jle done
			mov dl, byte ptr [eax]
			xor dl, byte ptr [esi]
			mov byte ptr [edi], dl
			inc esi
			inc eax
			dec ebx
			inc edi
			cmp ebx, 0
			je resetKey
			loop EncryptLoop

		resetKey:
			pop ebx
			pop eax
			push eax
			push ebx
			loop EncryptLoop

		done:
			pop ebx
			pop eax
			ret		

	encrypt endp


END main