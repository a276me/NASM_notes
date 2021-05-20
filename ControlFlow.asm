global _start

section .text

_start:
	mov eax, 10
	mov ebx, 20
	jmp gohere		; jumps tp gohere
	
	cmp eax, ebx
	jl gohere		; will jump if eax < ebx
				; different types of jmps:
					cmp a, b
					jmp	unconditional jump
					jl	if a<b
					jle	if a<=b
					je	if a==b
					jne	if a!=b
					jg	if a>b
					jge	if a>=b
					

gohere:
	mov eax, 0
	
