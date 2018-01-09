assume cs:code

code segment
start:
        sub al,al
        mov al,10h
        add al,90h
        mov al,80h
        add al,80h
        mov al,0fch
        add al,05h
        mov al,70h
        add al,0bh

        mov ax,4c00h
        int 21h


code ends
end start
