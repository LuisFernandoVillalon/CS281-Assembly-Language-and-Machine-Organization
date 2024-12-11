.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
    monday      byte 0
    tuesday     byte 1
    wednesday   byte 2
    thursday    byte 3
    friday      byte 4
    saturday    byte 5
    sunday      byte 6
	weekDays byte monday, tuesday, wednesday, thursday, friday,saturday, sunday

.code
	main proc
		
		INVOKE ExitProcess, 0
	main endp
END main