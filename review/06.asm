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
		lea si,s1	
		lea di,s2
		cmpsb		;对比[si]和[di]内存中存储的字节是否相等，相等则将0标志位置为1，否则置为0；然后将si和di增加到下一个地址
		cmpsw ;对比[si]和[di]内存中存储的字是否相等，相等则将0标志位置为1，否则置为0
		
		mov ax,4c00h
		int 21h
code	ends
		end start