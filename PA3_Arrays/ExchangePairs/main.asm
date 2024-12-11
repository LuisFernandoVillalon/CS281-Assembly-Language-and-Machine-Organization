.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	arr byte 10h, 20h, 30h, 40h, 50h, 60h
	arrLength = ($ - arr)	

.code
main proc
	; Setup initial values
	mov esi, offset arr       
	mov ecx, arrLength / 2    ; Set ECX to the number of pairs to be swapped

onlyLoop:
	; Swap adjacent bytes
	mov al, [esi]             ; Load first byte of the pair into AL
	mov ah, [esi + 1]         ; Load second byte of the pair into AH

	mov [esi], ah             ; Store AH (second byte) into the first position
	mov [esi + 1], al         ; Store AL (first byte) into the second position

	add esi, type word                ; Move to the next pair
	loop onlyLoop                 

	; Exit the program
	INVOKE ExitProcess, 0
main endp

END main
