.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data

    myByte      byte    0x12       ; 8-bit unsigned integer
    mySByte     sbyte   -5         ; 8-bit signed integer
    myWord      word    12345h     ; 16-bit unsigned integer
    mySWord     sword   -12345     ; 16-bit signed integer
    myDWord     dword   0x12345678 ; 32-bit unsigned integer
    mySDWord    sdword  -12345678  ; 32-bit signed integer

.code
main PROC

    mov al, myByte      ; Move 8-bit byte to AL register
    mov bl, mySByte     ; Move 8-bit signed byte to BL register

    mov cx, myWord      ; Move 16-bit word to CX register
    mov dx, mySWord     ; Move 16-bit signed word to DX register

    mov eax, myDWord    ; Move 32-bit dword to EAX register
    mov ebx, mySDWord   ; Move 32-bit signed dword to EBX register

    INVOKE ExitProcess, 0
main ENDP

END main
