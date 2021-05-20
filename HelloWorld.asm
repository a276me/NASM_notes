
global _start

section .data
	msg db "Hello World", 0x0a
	len equ $-msg

section .text
	_start:

		MOV EAX, 4
		MOV EBX, 1
		MOV ECX, msg
		MOV EDX, len
		INT 0x80

		MOV EAX, 1 
		MOV EBX, 0
		INT 0x80

