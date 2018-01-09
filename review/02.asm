Data 	segment
Hello 	db "Hello world!$"
Data 	ends

Stack 	segment stack
		org 64
Stack 	ends

Code 	segment
Hello2 	db "Hello world!sssssssss$"
start:	mov ax,1234h
		mov bx,1234h
		mov ax,Code
		mov ds,ax
		mov es,ax
		mov ax,Stack
		mov ss,ax
		mov dx,offset Hello2
		mov ah,9h
		int 21h
		mov ax,4c00h
		int 21h
Code 	ends
		end 	start
