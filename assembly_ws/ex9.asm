;向屏幕中央写入数据，显示在屏幕上
assume cs:code,ds:data,ss:stack

data segment
	db 'welcome to masm!'
	db 02h,24h,71h
data ends

stack segment
	dw 8 dup(0)
stack ends

code segment
start:	mov ax,data
		mov ds,ax
		mov ax,stack
		mov ss,ax
		mov sp,10h
		
		xor bx,bx	;自身异或，用来清零，效果等同于mov bx,0
		mov ax,0b872h
		
		mov cx,3
	s:	push cx		;保存外层循环的次数
		push ax		;保存段地址
		push bx		;保存颜色的偏移
		
		mov es,ax	;用附加寄存器保存偏移地址
		
		mov si,0
		mov di,0
		mov cx,10h
		s1:	mov al,ds:[si]		;想奇字节处写入数据
			mov es:[di],al
			inc si
			add di,2
			loop s1
			
		mov di,1
		pop bx
		mov al,ds:10h[bx]
		inc bx
		
		mov cx,10h
		s2:	mov es:[di],al		;向偶字节处写入颜色信息
			add di,2
			loop s2
			
		pop ax
		add ax,0ah		;段地址每次偏移ah
		
		pop cx
		
		loop s
		
		mov ax,4c00h
		int 21h

code ends
end start