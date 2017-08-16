assume cs:codesg

codesg segment

	;改进后的程序
	mov ax,offffh
	mov ds,ax
	mov ax,0020h
	mov es,ax
	mov bx,0
	mov cx,12
s:	mov dl,[bx]
	mov es:[bx],dl
	inc bx
	loop s
	
	mov ax,4c00h
	int 21h
	
codesg ends

end