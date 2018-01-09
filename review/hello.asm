Data 	segment
Hello 	db "Hello world!$"
Data 	ends

Stack 	segment stack
		org 64
Stack 	ends

Code 	segment
start:	mov ax,Data
		mov ds,ax
		mov es,ax
		mov ax,Stack
		mov ss,ax
		mov dx,offset Hello
		mov ah,9h
		int 21h
		mov ax,4c00h
		int 21h
Code 	ends
		end 	start
