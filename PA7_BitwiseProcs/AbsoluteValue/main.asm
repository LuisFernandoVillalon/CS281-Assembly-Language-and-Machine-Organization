.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	nums word -34, 5, 281, -14, -193, 22
	diff = type word
	len = ($-nums)/diff
.code
	main proc
		
		push esi 
		push ecx

		mov esi, offset nums
		mov ecx, len

		call absoluteValue

		pop ecx
		pop esi
		
		INVOKE ExitProcess, 0
	main endp

	absoluteValue proc

		LoopOne: 
			  cmp ecx, 0
			  je done

			  mov ax, word ptr [esi]

			  cmp ax, 0
			  jge SkipConversion

			  
			  not ax
			  add ax, 1
			  mov word ptr [esi], ax

		SkipConversion:
			add esi, 2
			dec ecx 
			jmp LoopOne

		
		done:
			ret

	absoluteValue endp

END main