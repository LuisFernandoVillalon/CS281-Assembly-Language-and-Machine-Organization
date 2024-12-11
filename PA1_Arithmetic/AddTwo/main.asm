.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data

.code
	main proc
		mov eax, 4
		mov ebx, 12
		add eax, ebx

		INVOKE ExitProcess, 0
	main endp
END main