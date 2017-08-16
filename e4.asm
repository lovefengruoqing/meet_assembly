assume cs:code

a segment
	db 1,2,3,4,5,6,7,8
a ends

b segment
	db 1,2,3,4,5,6,7,8
b ends

d segment
	db 0,0,0,0,0,0,0,0
d ends

code segment
start:	mov ax,a
		mov ds,ax
		mov ax,b
		mov es,ax
		
		mov ax,0
		mov bx,0
		mov cx,8
		
	s:	mov al,ds:[bx]
		add al,es:[bx]
		mov es:[10h+bx],al	;采用累加的形式
		inc bx
		loop s
		mov ax,4c00h
		int 21h
code ends
end start