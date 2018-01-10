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
		xor ax,ax
		lea si,s1	
		lodsb		;将[si]所指向的地址存储的数据装载到al之中
		xor ax,ax
		lodsw		;将[si]所指向的地址存储的数据装载到ax之中
		
		mov ax,4c00h
		int 21h
code	ends
		end start