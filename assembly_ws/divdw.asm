assume cs:code

code segment
main:   mov ax,4240h
        mov dx,0fH
        mov cx,0ah
        call divdw

        mov ax,4c00h
        int 21h

divdw:  mov bx,ax
        mov ax,dx
        mov dx,0
        div cx

        push ax
        mov ax,bx
        div cx
        mov cx,dx
        pop dx
        ret

code ends
end main
