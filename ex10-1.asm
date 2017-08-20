;显示字符串
assume cs:code

data segment
	db 'Welcome to masm!',0
data ends

code segment
	start: 	mov dh,20	;存放的行号
			mov dl,10	;存放的列号
			mov cl,4	;存放的颜色

			mov ax,data
			mov ds,ax
			mov si,0	;字符串偏移地址
			
			call show_str	;调用子程序显示
			
			mov ax,4c00h
			int 21h
			
	show_str:	;显示字符串的子程序开始
			push cx
			push si
			
			mov al,0a0h
			dec dh
			mul dh
			
			mov bx,ax	;bx中存放着着行偏移地址
			
			mov al,2
			mul	dl
			sub	ax,2	;列偏移
			
			add bx,ax	;总偏移
			
			mov ax,0b800h
			mov es,ax	;显存段地址
			
			mov di,0	;显存偏移地址
			mov al,cl	;用al保存颜色字符信息
			mov ch,0
			
		s:	mov cl,ds:[si]
			
			jcxz ok		;当碰到0的时候，退出子程序
				
			mov es:[bx+di],cl	;偶地址存放字符
			mov es:[bx+di+1],al	;奇地址存放字符颜色
			
			inc si
			add di,2
			jmp short s
			
		ok:	pop si
			pop cx
			ret
				
code ends
end start