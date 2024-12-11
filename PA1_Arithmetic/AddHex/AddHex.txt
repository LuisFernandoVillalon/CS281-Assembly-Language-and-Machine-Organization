.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data

    val1    dword   0x1A2B3C4D  
    val2    dword   0x2B3C4D5E
    val3    dword   0x3C4D5E6F
    val4    dword   0x4D5E6F70

    sum     dword   ?

.code
main PROC

    mov eax, val1

    add eax, val2

    add eax, val3

    add eax, val4

    mov sum, eax

    INVOKE ExitProcess, 0
main ENDP

END main
