.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	arr word 89, 13, -5, 8, 33, 12, 81, 1
	lenArr = ($-arr)/(type word)
.code
	main proc

		push ebx
		push esi
		push edi

		push offset arr
		push lenArr

		call sort

		pop edi
		pop esi
		pop ebx
		
		INVOKE ExitProcess, 0
	main endp

	sort proc

		push ebp
		mov ebp, esp

		mov ecx, [ebp+8]	;lenArr, length of the array
		mov esi, [ebp+12]	;offset arr, address of the array

		xor edi, edi	; index, i = 0

		sortLoop:

			cmp edi, ecx	;check if we have finished the array
			jge sortDone

			push ecx	;length of array
			push edi	;index
			push esi	;array of address
			
			call findSmallest

			mov edx, eax	;the smallest index is returned in eax

			;Switch values 
			mov ax, word ptr [esi + edi * 2]	;current num
			mov bx, word ptr [esi + edx * 2]	;minimum num
			mov word ptr [esi + edi * 2], bx 
			mov word ptr [esi + edx * 2], ax   

			inc edi
			jmp sortLoop


		sortDone:
			mov esp, ebp
			pop ebp
			ret 8

	sort endp

	findSmallest proc

		push ebp
		mov ebp, esp

		push edi	;store index

		mov esi, [ebp+8]	;array of address
		mov edi, [ebp+12]	;current index
		mov ecx, [ebp+16]	;length of array

		mov eax, edi	;assume the minimum is the current index
		mov bx, word ptr [esi + edi * 2]	;goes to the current 'word' in the array

		inc edi
		findMinimumLoop:
			
			cmp edi, ecx	;check if done with array
			jge findMinimumDone

			cmp word ptr[esi + edi * 2], bx		;compare the current number in the array with our minimum
			jge noSwitchMinimum

			;Switch minimum
			mov bx, word ptr [esi + edi * 2]
			mov eax, edi

			noSwitchMinimum:
				inc edi
				jmp findMinimumLoop

			findMinimumDone:
				pop edi	
				mov esp, ebp
				pop ebp
				ret 12
		
		
	findSmallest endp

END main