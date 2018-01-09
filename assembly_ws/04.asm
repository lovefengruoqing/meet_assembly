assume cs:codesg

codesg segment

	mov ax,0ffffh
	mov ds,ax
	mov bx,6h
	mov ax,[bx]
	mov dx,0
	mov cx,123
l:	add dx,ax
	loop l
	
	mov ax,4c00h
	int 21h
	
codesg ends

end