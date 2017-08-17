;将data段中的每个单词的前四个字母改为大写字母

assume cs:code,ds:data,ss:stack

stack segment
	dw 0,0,0,0,0,0,0,0
stack ends

data segment
	db '1. display......'
	db '2. brows........'
	db '3. replace......'
	db '4. modify.......'
data ends

code segment
start:	mov ax,stack
		mov ss,ax
		mov sp,10h
		
		mov ax,data
		mov ds,ax
		
		mov bx,0
		mov cx,4
	s1:	push cx
		mov si,0
		mov cx,4
		s2:	mov al,3[bx][si]
			and al,11011111b
			mov [bx+si+3],al
			inc si
			loop s2
		pop cx
		add bx,10h
		loop s1
		
		mov ax,4c00h
		int 21h
code ends
end start