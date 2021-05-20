
								; nasm -f elf32 file.asm -o file.o
								; compile code in 32bit into a object file. use -elf64 is 64bit

								; ld -m elf_i386 file.o -o file
								; the ld linker tools turns .o file/s into one executable

								; $ echo $? to check exit code


.global _start		  			; labels behind .global are in global space
	
section .text					; the code is stored in this section

	_start:							; start of the program, kind of like void main(){}

		MOV eax, 12	      			; put the value 12 into the eax register
							        ; list of registers:
				                    ; 16bit: AX	BX	CX	DX
				                    ; 32bit: EAX	EBX	ECX	EDX
				                    ; 8bit:  every 16bit register has 2 8bit registers High and Low
				                    ; 	 they are the register name + H/L ex: AL, AH, BL, BH
		
		INT 0x80	        		; calls interupt function 0x80 to handle interupts
	                    			; for INT 0x80 it is making a system call which will be determined
	                    			; by the value in the EAX register	
		
		MOV ebx, 64
		SUB ebx, 32	      			; subtracts 32 from ebx, then the value is stored in ebx
		ADD ebx, 32	      			; does the same except for adding
		
		MUL ebx						; multiplies EAX by EBX and then is stored in EAX
		DIV ebx		        		; Divides EAX by EDX and then is stored in EAX
	

section .data					; the data section stores data that can be referenced

	msg db "Hello World", 0x0a	; this stores a string of bytes 'Hellow World'
								; this can be latter used by just referencing it as 'msg'
								; 0x0a is the byte for a new line, kind of like '\n'

	len equ $ - msg				; this gives the length of the string by subtracting where it ends
								; by where it starts


