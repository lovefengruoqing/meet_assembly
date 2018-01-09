;将数据填入表格中
	
assume cs:code,ds:data,es:table

data segment
	db '1975','1976','1977','1978','1979','1980','1981','1982','1983'
	db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
	db '1993','1994','1995'
	dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
	dd 345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000
	dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
	dw 11452,14430,15257,17800
data ends

table segment
	db 21 dup ('year summ ne ?? ')
table ends

code segment
start: 	mov ax,data
		mov ds,ax	;将数据段地址存入ds
		mov ax,table
		mov es,ax	;将表格段地址存入es寄存器
		
		mov bx,0
		mov si,0
		mov cx,21	;一共有21行数据,有21次循环
	
	s:	mov ax,[bx+si]
		mov	es:[bx+si],ax
		mov ax,[bx+54h+si]
		mov es:[bx+5h+si],ax
		mov ax,[bx+0a8h+si]
		mov es:[bx+0ah+si],ax
		
		add si,2
		mov ax,[bx+si]
		mov	es:[bx+si],ax
		mov ax,[bx+54h+si]
		mov es:[bx+5h+si],ax
		
		;计算人均收入
		mov ax,es:[bx+5]
		mov dx,es:[bx+7]
		div word ptr es:[bx+0ah]
		mov es:[bx+0dh],ax
		
		mov si,0
		add bx,10h
		loop s
		
		mov ax,4c00h
		int 21h
		
code ends
end start