assume cs:codesg

codesg segment

	mov ax,0ffffh
	mov ds,ax
	mov bx,0
	
	mov dx,0
	
	mov cx,12

l:	mov al,[bx]
	mov ah,0
	add dx,ax
	inc bx
	loop l
	
	mov ax,4c00h
	int 21h
	
codesg ends

end