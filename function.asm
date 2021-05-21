
global _start

section .data
    msg db "Hi there", 0x0a
    len equ $-msg

    msg2 db "Bye", 0x0a
    len2 equ $-msg2
    

section .text

_start:

    pusha                       ; push all registers on the stack
    push msg        		; Arguments to be passed to the function

    call print
    
    ; do something with the return value in eax
    ; if nothing, then pop all the registers back

    popa                        ; pop all the original data back to registers


    pusha
    push msg2

    call print

    popa
    
    mov eax, 1        ; Remember to end the program
    int 0x80


print:
    ; the prologue and epilogue must be in every function
    ; start of prologue
    push ebp                    ; Save the original position of the base pointer(ebp)
                                ; in case the program is doing nested functions
    mov ebp, esp                ; Save the value for the stack pointer in case the program needs it
                                ; (esp=stack pointer)
    pusha                       ; push all registers on the stack
    ; end of prologue

    mov eax, 4
    mov ebx, 1
    mov ecx, [ebp+8]                ; [ebp+8] is the first position of the argument, add 4 for each argument
    mov edx, len                    ; this is a bad ex. You should use the actual length of the string
    int 0x80

    ; start of epilogue

    popa                        ; pop all the original data back to registers
    mov eax, 1                    ; Store the return value in the eax register 
				 ; optional if you have a return value
    mov esp, ebp                    ; Restore the stack pointer to where it was
    pop ebp                        ; pop the original value of the ebp back to the ebp
    ret
    ; end of epilogue
