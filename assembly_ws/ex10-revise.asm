assume cs:code

data segment
	db 'Hello world!',0
data ends

code segment
start:	mov dh,10	;dh用来保存行标
		mov dl,3	;dl用来保存列标
        mov cl,2    ;用cl保存颜色信息
		mov ax,data
        mov ds,ax
        mov si,0    ;si用来保存数据偏移地址

        call show_str   ;开始执行子程序

        mov ax,4c00h
        int 21h

show_str:   push cx     ;将cx和si压栈保存
            push si

            mov ax,0b800h
            mov es,ax

            mov al,0a0h
            sub dh,1
            mul dh
            mov bx,ax   ;用bx暂时保存行偏移地址

            mov al,2
            sub dl,1
            mul dl
            add bx,ax   ;加上行偏移地址，存储在bx中

            mov di,0    ;用di表示偏移
            mov al,cl   ;用al存储颜色信息
            mov ch,0

        s:  mov cl,ds:[si]
            jcxz ok

            mov es:[bx+di],cl
            mov es:[bx+di+1],al

            inc si
            add di,2

            jmp short s

    ok:     pop si
            pop cx
            ret

code ends
end start
