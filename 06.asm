assume cs:codesg

codesg segment

	mov bx,0
	mov cx,12
s:	mov ax,offffh
	mov ds,ax
	mov dl,[bx]
	mov ax,0020h
	mov ds,ax
	mov [bx],dl
	inc bx
	loop s
	
	mov ax,4c00h
	int 21h
	
codesg ends

end