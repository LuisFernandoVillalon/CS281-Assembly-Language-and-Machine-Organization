.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	arr1 word 1010h, 2020h, 3030h, 4040h
	arr1Length = ($ - arr1) / 2
	arr2 dword arr1Length DUP(?)
	arr3 byte arr1Length DUP(?)

.code
main proc
	mov esi, offset arr1
	mov edi, offset arr2
	mov ecx, arr1Length

	Loop1:
		movzx eax, word ptr [esi]
		mov dword ptr [edi], eax
		add esi, type word
		add edi, type dword
		loop Loop1

	mov esi, offset arr1
	mov edi, offset arr3
	mov ecx, arr1Length

	Loop2:
		mov al, byte ptr [esi]
		mov byte ptr [edi], al
		add esi, type word
		add edi, type byte
		loop Loop2

	; Exit the program
	INVOKE ExitProcess, 0
main endp

END main
