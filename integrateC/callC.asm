
					; nasm -f elf32 callC.asm
					; gcc -m32 callC.o
global main

extern printf, func			; tell nasm that these function is somewhere else where
					; func(a,b) -> a+b

section .data

	msg db "My age is: %i", 0x0a, 0x00	; remember to add 0x00 to signal the end of the string
	blank db "%i", 0x0a, 0x00


main:					; when needing C code, the gcc compiler will have _start
					; already defined, so it expects a "main" function
	
	push ebp
	mov ebp, esp
	
	push 15
	push msg			; this is the argument to be passed to printf
	call printf

	push 1
	push 2
	call func
	
	push eax
	push blank
	call printf
	
	mov eax, 0
	mov esp, ebp
	pop ebp
	ret
		
