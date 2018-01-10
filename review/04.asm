data 	segment
s1 		db "hello$"
s2 		db 100 dup(0)
data 	ends

stack 	segment stack
		org 64
stack	ends

code 	segment
start:	mov ax,data
		mov es,ax
		mov ds,ax
		
		cld			;完成对标志位的位置、复位等操作
		mov al,5
		lea di,s2
		stosb		;将al中内容存储到[di]所指向的地址之中
		stosw		;将ax中内容存储到[di]所指向的地址之中
		
		mov ax,4c00h
		int 21h
code	ends
		end start