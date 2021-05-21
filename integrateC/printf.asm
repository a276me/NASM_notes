global main

extern printf				; tell nasm that this function is somewhere else where

section .data

	msg db "My age is: %i"

section .text

main:					; when needing C code, the gcc compiler will have _start
					; already defined, so it expects a "main" function
	
	push ebp
	mov ebp, esp
	pusha

	push msg			; this is the argument to be passed to printf
	call printf
	
	popa
	mov eax, 0
	mov esp, ebp
	pop ebp
	ret
	
	
