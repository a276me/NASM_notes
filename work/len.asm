global main

extern printf

section .data
	
	msg db "test message", 0x0a, 0x00
	blank db "%i",0x0a, 0x00


main:
	push ebp
	mov ebp, esp
	
	push msg
	call getlen
	
	push eax
	push blank
	call printf


	mov esp, ebp
	pop ebp
	ret

getlen:
	push ebp
	mov ebp, esp
	
	mov ebx, [ebp+8]
	mov eax, 0
	
_loop:
	mov ecx, 0
	add ecx, eax
	add ecx, ebx
	mov edx, [ecx]

	cmp edx, 0x0a
	je _end
	
	inc eax
	jmp _loop

_end:		
	
	mov esp, ebp
	pop ebp
	ret


	
	
