.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
    nums word 34, 17, 8, 9, 37, 41, 121
    lenNums = ($-nums) /(type nums)     
    primes byte lenNums DUP(1)            

.code
main PROC
    push esi
    push edi
    push ecx

    mov esi, offset nums                  
    mov edi, offset primes                
    mov ecx, lenNums                      

primeLoop:
    call isPrime                          
    add esi, 2                            
    inc edi                               
    loop primeLoop                        

    pop ecx
    pop edi
    pop esi

    INVOKE ExitProcess, 0
main endp

isPrime PROC
    push eax
    push ebx
    push edx
    movzx eax, word ptr [esi]
    cmp ax, 2
    jl numIsNotPrime
    cmp ax, 2
    je numIsPrime
    mov bx, 2
    mov cx, ax                           ; Store the original number in cx
    shr cx, 1                             ; Divide cx by 2 to get n/2
    primeLoop:
        xor dx, dx
        mov ax, word ptr [esi] 
        div bx
        cmp dx, 0
        je numIsNotPrime
        inc bx
        cmp bx, cx
        jle primeLoop
    numIsPrime:
        mov byte ptr [edi], 1
        jmp endIsPrime
    numIsNotPrime:
        mov byte ptr [edi], 0
    endIsPrime:
        pop edx
        pop ebx
        pop eax
        ret
isPrime endp

END main
