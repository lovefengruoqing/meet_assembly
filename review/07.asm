data 	segment
s1 		db "hello$"
s2 		db "heool$	"
data 	ends

stack 	segment stack
		org 64
stack	ends

code 	segment
start:	mov ax,data
		mov es,ax
		mov ds,ax
		
		cld			;完成对标志位的位置、复位等操作	
		lea di,s2
		mov al,68h
		scasb		;对比al中值与[di]内存中数据是否相等
		cld
		mov ax,6f65h
		scasw		;对比ax中值与[di]内存中数据是否相等
		
		mov ax,4c00h
		int 21h
code	ends
		end start