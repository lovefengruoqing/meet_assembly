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
		
		lea si,s1
		lea di,s2
		movsb	;һ�ο���һ���ֽ�
		movsw	;һ�ο���һ����
		mov ax,4c00h
		int 21h
code	ends
		end start