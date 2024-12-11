.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	arr word 10Ah, 20Bh, 30Ch, 40Dh
	arrLength = ($ - arr) / 2  

.code
main proc
	mov esi, offset arr      
	mov ecx, arrLength      

	dec ecx                   ; ECX = arrLength - 1
	mov ax, word ptr [esi + 2*ecx] ; Move last element into AX

shiftLoop:

	mov edx, ecx              
	dec edx                   ; EDX = ECX - 1
	mov dx, word ptr [esi + 2*edx] ; Load current element into DX
	mov word ptr [esi + 2*ecx], dx ; Move it to the next position
	dec ecx                   
	jnz shiftLoop             

	; Place the last element at the first position
	mov word ptr [esi], ax

	INVOKE ExitProcess, 0
main endp

END main
