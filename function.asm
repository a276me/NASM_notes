
global _start

section .data
	msg db "Hi there", 0x0a
	len equ $-msg

section .text

_start:
	push msg		; Arguments to be passed to the function

	call print

print:
	; the prologue and epilogue must be in every function
	; start of prologue
	push ebp					; Save the original position of the base pointer(ebp)
								; in case the program is doing nested functions
	mov ebp, esp				; Save the value for the stack pointer in case the program needs it
								; (esp=stack pointer)	
	; end of prologue	

	mov eax, 4
	mov ebx, 1
	mov ecx, msg				; body of function
	mov edx, len
	int 0x80

	; start of epilogue
	mov esp, ebp
	pop ebp
	ret
	; end of epilogue
