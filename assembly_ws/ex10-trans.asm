assume cs:code,ds:data

data segment
    db 10 dup(0)
data ends

code segment
start:
        mov ax,12666

        mov bx,data
        mov ds,bx
        mov si,0    ;ds:si指向字符串的首地址

        call dtoc   ;dtoc子程序实现将word型整数转换为字符串

        mov dh,8    ;初始化打印位置
        mov dl,3
        mov cl,0cah

        call show_str   ;开始打印字符串

        mov ax,4c00h
        int 21h

dtoc:   ;转换程序
        push ax
        push si
        push bx

        mov bx,0
    s1: mov cx,10d  ;d表示十进制，cx为除数，除十取余
        mov dx,0

        div cx
        mov cx,ax

        jcxz s2

        add dx,30h  ;将余数加上30h得到响应的ASCII码
        push dx

        inc bx

        jmp short s1

    s2: add dx,30h
        push dx

        inc bx

        mov cx,bx
        mov si,0

    s3: pop ax
        mov [si],al
        inc si
        loop s3

    okdtoc: pop bx
        pop si
        pop ax

        ret

show_str:   ;显示字符串的子程序开始
        push cx
        push si

        mov al,0a0h
        dec dh
        mul dh

        mov bx,ax   ;bx中存放着着行偏移地址

        mov al,2
        mul dl
        sub ax,2    ;列偏移

        add bx,ax   ;总偏移

        mov ax,0b800h
        mov es,ax   ;显存段地址

        mov di,0    ;显存偏移地址
        mov al,cl   ;用al保存颜色字符信息
        mov ch,0

    s:  mov cl,ds:[si]

        jcxz ok     ;当碰到0的时候，退出子程序

        mov es:[bx+di],cl   ;偶地址存放字符
        mov es:[bx+di+1],al ;奇地址存放字符颜色

        inc si
        add di,2
        jmp short s

    ok: pop si
        pop cx
        ret

code ends
end start

