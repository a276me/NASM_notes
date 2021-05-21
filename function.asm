
global _start

section .data
	msg db "Hi there", 0x0a
	len equ $-msg

section .text

_start:
	push msg		; Arguments to be passed to the function

	call print
	
	mov eax, 1		; Remember to end the program
	int 0x80

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
	mov ecx, [ebp+8]				; [ebp+8] is the first position of the argument
	mov edx, len					; then add 4 for the second argument
	int 0x80

	mov eax, 1					; Store the return value in the eax register

	; start of epilogue
	mov esp, ebp
	pop ebp
	ret
	; end of epilogue
