%include 'bresenhamLine.asm'
section	.data

section .text

drawSpace:
	push ebp
	mov ebp, esp
	;guardar separador
	mov [xcoord + edi], byte ' '	
	mov [ycoord + edi], byte ' '
	inc edi
	mov esp, ebp
	pop ebp
	ret
	

drawLetterA:
	push ebp
	mov ebp, esp
	;line from (0,0) to (4,0)
	push 0x0	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (0,0) to (0,4)
	push 0x4	;y2
	push 0x0	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (4,0) to (4,4)
	push 0x4	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x4	;x1
	call bresenLine
	;line from (0,2) to (4,2)
	push 0x2	;y2
	push 0x4	;x2
	push 0x2	;y1
	push 0x0	;x1
	call bresenLine
	;guardar separador
	mov [xcoord + edi], byte ' '	
	mov [ycoord + edi], byte ' '
	inc edi
	mov esp, ebp
	pop ebp
	ret

drawLetterB:
	push ebp
	mov ebp, esp
	;line from (0,0) to (3,0)
	push 0x0	;y2
	push 0x3	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (0,0) to (0,4)
	push 0x4	;y2
	push 0x0	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (3,0) to (3,2)
	push 0x2	;y2
	push 0x3	;x2
	push 0x0	;y1
	push 0x3	;x1
	call bresenLine
	;line from (0,2) to (4,2)
	push 0x2	;y2
	push 0x4	;x2
	push 0x2	;y1
	push 0x0	;x1
	call bresenLine
	;line from (4,2) to (4,4)
	push 0x4	;y2
	push 0x4	;x2
	push 0x2	;y1
	push 0x4	;x1
	call bresenLine
	;line from (0,4) to (4,4)
	push 0x4	;y2
	push 0x4	;x2
	push 0x4	;y1
	push 0x0	;x1
	call bresenLine
	;guardar separador
	mov [xcoord + edi], byte ' '	
	mov [ycoord + edi], byte ' '
	inc edi
	mov esp, ebp
	pop ebp
	ret
	
drawLetterC:
	push ebp
	mov ebp, esp
	;line from (0,0) to (4,0)
	push 0x0	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (0,0) to (0,4)
	push 0x4	;y2
	push 0x0	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (0,4) to (4,4)
	push 0x4	;y2
	push 0x4	;x2
	push 0x4	;y1
	push 0x0	;x1
	call bresenLine
	;guardar separador
	mov [xcoord + edi], byte ' '	
	mov [ycoord + edi], byte ' '
	inc edi
	mov esp, ebp
	pop ebp
	ret

drawLetterD:
	push ebp
	mov ebp, esp
	;line from (0,0) to (3,0)
	push 0x0	;y2
	push 0x3	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (0,0) to (0,4)
	push 0x4	;y2
	push 0x0	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (0,4) to (3,4)
	push 0x4	;y2
	push 0x3	;x2
	push 0x4	;y1
	push 0x0	;x1
	call bresenLine
	;line from (4,1) to (4,3)
	push 0x3	;y2
	push 0x4	;x2
	push 0x1	;y1
	push 0x4	;x1
	call bresenLine
	;guardar separador
	mov [xcoord + edi], byte ' '	
	mov [ycoord + edi], byte ' '
	inc edi
	mov esp, ebp
	pop ebp
	ret

drawLetterE:
	push ebp
	mov ebp, esp
	;line from (0,0) to (4,0)
	push 0x0	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (0,0) to (0,4)
	push 0x4	;y2
	push 0x0	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (0,2) to (4,2)
	push 0x2	;y2
	push 0x4	;x2
	push 0x2	;y1
	push 0x0	;x1
	call bresenLine
	;line from (0,4) to (4,4)
	push 0x4	;y2
	push 0x4	;x2
	push 0x4	;y1
	push 0x0	;x1
	call bresenLine
	;guardar separador
	mov [xcoord + edi], byte ' '	
	mov [ycoord + edi], byte ' '
	inc edi
	mov esp, ebp
	pop ebp
	ret

drawLetterF:
	push ebp
	mov ebp, esp
	;line from (0,0) to (4,0)
	push 0x0	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (0,0) to (0,4)
	push 0x4	;y2
	push 0x0	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (0,2) to (4,2)
	push 0x2	;y2
	push 0x4	;x2
	push 0x2	;y1
	push 0x0	;x1
	call bresenLine
	;guardar separador
	mov [xcoord + edi], byte ' '	
	mov [ycoord + edi], byte ' '
	inc edi
	mov esp, ebp
	pop ebp
	ret
	
drawLetterG:
	push ebp
	mov ebp, esp
	;line from (0,0) to (4,0)
	push 0x0	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (0,0) to (0,4)
	push 0x4	;y2
	push 0x0	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (3,2) to (4,2)
	push 0x2	;y2
	push 0x4	;x2
	push 0x2	;y1
	push 0x3	;x1
	call bresenLine
	;line from (0,4) to (4,4)
	push 0x4	;y2
	push 0x4	;x2
	push 0x4	;y1
	push 0x0	;x1
	call bresenLine
	;line from (4,2) to (4,4)
	push 0x4	;y2
	push 0x4	;x2
	push 0x2	;y1
	push 0x4	;x1
	call bresenLine
	;guardar separador
	mov [xcoord + edi], byte ' '	
	mov [ycoord + edi], byte ' '
	inc edi
	mov esp, ebp
	pop ebp
	ret
	
drawLetterH:
	push ebp
	mov ebp, esp
	;line from (0,0) to (0,4)
	push 0x4	;y2
	push 0x0	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (4,0) to (4,4)
	push 0x4	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x4	;x1
	call bresenLine
	;line from (0,2) to (4,2)
	push 0x2	;y2
	push 0x4	;x2
	push 0x2	;y1
	push 0x0	;x1
	call bresenLine
	;guardar separador
	mov [xcoord + edi], byte ' '	
	mov [ycoord + edi], byte ' '
	inc edi
	mov esp, ebp
	pop ebp
	ret
	
drawLetterI:
	push ebp
	mov ebp, esp
	;line from (0,0) to (4,0)
	push 0x0	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (2,0) to (2,4)
	push 0x4	;y2
	push 0x2	;x2
	push 0x0	;y1
	push 0x2	;x1
	call bresenLine
	;line from (0,4) to (4,4)
	push 0x4	;y2
	push 0x4	;x2
	push 0x4	;y1
	push 0x0	;x1
	call bresenLine
	;guardar separador
	mov [xcoord + edi], byte ' '	
	mov [ycoord + edi], byte ' '
	inc edi
	mov esp, ebp
	pop ebp
	ret
	
drawLetterJ:
	push ebp
	mov ebp, esp
	;line from (0,0) to (4,0)
	push 0x0	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (2,0) to (2,4)
	push 0x4	;y2
	push 0x2	;x2
	push 0x0	;y1
	push 0x2	;x1
	call bresenLine
	;line from (0,4) to (2,4)
	push 0x4	;y2
	push 0x2	;x2
	push 0x4	;y1
	push 0x0	;x1
	call bresenLine
	;guardar separador
	mov [xcoord + edi], byte ' '	
	mov [ycoord + edi], byte ' '
	inc edi
	mov esp, ebp
	pop ebp
	ret
	
drawLetterK:
	push ebp
	mov ebp, esp
	;line from (0,0) to (0,4)
	push 0x4	;y2
	push 0x0	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (1,2) to (4,0)
	push 0x0	;y2
	push 0x4	;x2
	push 0x2	;y1
	push 0x1	;x1
	call bresenLine
	;line from (2,1) to (3,1)
	push 0x1	;y2
	push 0x3	;x2
	push 0x1	;y1
	push 0x2	;x1
	call bresenLine
	;line from (4,0) to (4,0)
	push 0x0	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x4	;x1
	call bresenLine
	;line from (1,2) to (4,4)
	push 0x4	;y2
	push 0x4	;x2
	push 0x2	;y1
	push 0x1	;x1
	call bresenLine
	;guardar separador
	mov [xcoord + edi], byte ' '	
	mov [ycoord + edi], byte ' '
	inc edi
	mov esp, ebp
	pop ebp
	ret

drawLetterL:
	push ebp
	mov ebp, esp
	;line from (0,0) to (0,4)
	push 0x4	;y2
	push 0x0	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (0,4) to (4,4)
	push 0x4	;y2
	push 0x4	;x2
	push 0x4	;y1
	push 0x0	;x1
	call bresenLine
	;guardar separador
	mov [xcoord + edi], byte ' '	
	mov [ycoord + edi], byte ' '
	inc edi
	mov esp, ebp
	pop ebp
	ret

drawLetterM:
	push ebp
	mov ebp, esp
	;line from (0,0) to (4,0)
	push 0x0	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (0,0) to (0,4)
	push 0x4	;y2
	push 0x0	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (2,0) to (2,4)
	push 0x4	;y2
	push 0x2	;x2
	push 0x0	;y1
	push 0x2	;x1
	call bresenLine
	;line from (4,0) to (4,4)
	push 0x4	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x4	;x1
	call bresenLine
	;guardar separador
	mov [xcoord + edi], byte ' '	
	mov [ycoord + edi], byte ' '
	inc edi
	mov esp, ebp
	pop ebp
	ret

drawLetterN:
	push ebp
	mov ebp, esp
	;line from (0,0) to (0,4)
	push 0x4	;y2
	push 0x0	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (0,0) to (4,4)
	push 0x4	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (4,0) to (4,4)
	push 0x4	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x4	;x1
	call bresenLine
	;guardar separador
	mov [xcoord + edi], byte ' '	
	mov [ycoord + edi], byte ' '
	inc edi
	mov esp, ebp
	pop ebp
	ret
	
drawLetterO:
	push ebp
	mov ebp, esp
	;line from (0,0) to (0,4)
	push 0x4	;y2
	push 0x0	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (0,0) to (4,0)
	push 0x0	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (4,0) to (4,4)
	push 0x4	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x4	;x1
	call bresenLine
	;line from (0,4) to (4,4)
	push 0x4	;y2
	push 0x4	;x2
	push 0x4	;y1
	push 0x0	;x1
	call bresenLine
	;guardar separador
	mov [xcoord + edi], byte ' '	
	mov [ycoord + edi], byte ' '
	inc edi
	mov esp, ebp
	pop ebp
	ret

drawLetterP:
	push ebp
	mov ebp, esp
	;line from (0,0) to (0,4)
	push 0x4	;y2
	push 0x0	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (0,0) to (4,0)
	push 0x0	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (4,0) to (4,3)
	push 0x3	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x4	;x1
	call bresenLine
	;line from (0,3) to (4,3)
	push 0x3	;y2
	push 0x4	;x2
	push 0x3	;y1
	push 0x0	;x1
	call bresenLine
	;guardar separador
	mov [xcoord + edi], byte ' '	
	mov [ycoord + edi], byte ' '
	inc edi
	mov esp, ebp
	pop ebp
	ret

drawLetterQ:
	push ebp
	mov ebp, esp
	;line from (0,0) to (0,4)
	push 0x4	;y2
	push 0x0	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (0,0) to (4,0)
	push 0x0	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (4,0) to (4,4)
	push 0x4	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x4	;x1
	call bresenLine
	;line from (0,4) to (4,4)
	push 0x4	;y2
	push 0x4	;x2
	push 0x4	;y1
	push 0x0	;x1
	call bresenLine
	;line from (3,3) to (4,4)
	push 0x4	;y2
	push 0x4	;x2
	push 0x3	;y1
	push 0x3	;x1
	call bresenLine
	;guardar separador
	mov [xcoord + edi], byte ' '	
	mov [ycoord + edi], byte ' '
	inc edi
	mov esp, ebp
	pop ebp
	ret

drawLetterR:
	push ebp
	mov ebp, esp
	;line from (0,0) to (0,4)
	push 0x4	;y2
	push 0x0	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (0,0) to (4,0)
	push 0x0	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (0,2) to (4,2)
	push 0x2	;y2
	push 0x4	;x2
	push 0x2	;y1
	push 0x0	;x1
	call bresenLine
	;line from (3,3) to (4,4)
	push 0x4	;y2
	push 0x4	;x2
	push 0x3	;y1
	push 0x3	;x1
	call bresenLine
	;line from (4,0) to (4,2)
	push 0x2	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x4	;x1
	call bresenLine
	;guardar separador
	mov [xcoord + edi], byte ' '	
	mov [ycoord + edi], byte ' '
	inc edi
	mov esp, ebp
	pop ebp
	ret
	
drawLetterS:
	push ebp
	mov ebp, esp
	;line from (0,0) to (0,2)
	push 0x2	;y2
	push 0x0	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (0,0) to (4,0)
	push 0x0	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (0,2) to (4,2)
	push 0x2	;y2
	push 0x4	;x2
	push 0x2	;y1
	push 0x0	;x1
	call bresenLine
	;line from (4,2) to (4,4)
	push 0x4	;y2
	push 0x4	;x2
	push 0x2	;y1
	push 0x4	;x1
	call bresenLine
	;line from (0,4) to (4,4)
	push 0x4	;y2
	push 0x4	;y2
	push 0x4	;x2
	push 0x4	;y1
	push 0x0	;x1
	call bresenLine
	;guardar separador
	mov [xcoord + edi], byte ' '	
	mov [ycoord + edi], byte ' '
	inc edi
	mov esp, ebp
	pop ebp
	ret
	
drawLetterT:
	push ebp
	mov ebp, esp
	;line from (0,0) to (4,0)
	push 0x0	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (2,0) to (2,4)
	push 0x4	;y2
	push 0x2	;x2
	push 0x0	;y1
	push 0x2	;x1
	call bresenLine
	;guardar separador
	mov [xcoord + edi], byte ' '	
	mov [ycoord + edi], byte ' '
	inc edi
	mov esp, ebp
	pop ebp
	ret
	
drawLetterU:
	push ebp
	mov ebp, esp
	;line from (0,0) to (0,4)
	push 0x4	;y2
	push 0x0	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (4,0) to (4,4)
	push 0x4	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x4	;x1
	call bresenLine
	;line from (0,4) to (4,4)
	push 0x4	;y2
	push 0x4	;x2
	push 0x4	;y1
	push 0x0	;x1
	call bresenLine
	;guardar separador
	mov [xcoord + edi], byte ' '	
	mov [ycoord + edi], byte ' '
	inc edi
	mov esp, ebp
	pop ebp
	ret
	
drawLetterV:
	push ebp
	mov ebp, esp
	;line from (0,0) to (2,4)
	push 0x4	;y2
	push 0x2	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (4,0) to (4,0)
	push 0x0	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x4	;x1
	call bresenLine
	;line from (3,1) to (3,2)
	push 0x2	;y2
	push 0x3	;x2
	push 0x1	;y1
	push 0x3	;x1
	call bresenLine
	;guardar separador
	mov [xcoord + edi], byte ' '	
	mov [ycoord + edi], byte ' '
	inc edi
	mov esp, ebp
	pop ebp
	ret


drawLetterW:
	push ebp
	mov ebp, esp
	;line from (0,0) to (0,4)
	push 0x4	;y2
	push 0x0	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (2,0) to (2,4)
	push 0x4	;y2
	push 0x2	;x2
	push 0x0	;y1
	push 0x2	;x1
	call bresenLine
	;line from (4,0) to (4,4)
	push 0x4	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x4	;x1
	call bresenLine
	;line from (0,4) to (4,4)
	push 0x4	;y2
	push 0x4	;x2
	push 0x4	;y1
	push 0x0	;x1
	call bresenLine
	;guardar separador
	mov [xcoord + edi], byte ' '	
	mov [ycoord + edi], byte ' '
	inc edi
	mov esp, ebp
	pop ebp
	ret

drawLetterX:
	push ebp
	mov ebp, esp
	;line from (0,0) to (4,4)
	push 0x4	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (4,0) to (4,0)
	push 0x0	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x4	;x1
	call bresenLine
	;line from (3,1) to (3,1)
	push 0x1	;y2
	push 0x3	;x2
	push 0x1	;y1
	push 0x3	;x1
	call bresenLine
	;line from (0,4) to (0,4)
	push 0x4	;y2
	push 0x0	;x2
	push 0x4	;y1
	push 0x0	;x1
	call bresenLine
	;line from (1,3) to (1,3)
	push 0x3	;y2
	push 0x1	;x2
	push 0x3	;y1
	push 0x1	;x1
	call bresenLine
	;guardar separador
	mov [xcoord + edi], byte ' '	
	mov [ycoord + edi], byte ' '
	inc edi
	mov esp, ebp
	pop ebp
	ret

drawLetterY:
	push ebp
	mov ebp, esp
	;line from (0,0) to (2,2)
	push 0x2	;y2
	push 0x2	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (2,2) to (2,4)
	push 0x4	;y2
	push 0x2	;x2
	push 0x2	;y1
	push 0x2	;x1
	call bresenLine
	;line from (4,0) to (4,0)
	push 0x0	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x4	;x1
	call bresenLine
	;line from (3,1) to (3,1)
	push 0x1	;y2
	push 0x3	;x2
	push 0x1	;y1
	push 0x3	;x1
	call bresenLine
	;guardar separador
	mov [xcoord + edi], byte ' '	
	mov [ycoord + edi], byte ' '
	inc edi
	mov esp, ebp
	pop ebp
	ret
	
drawLetterZ:
	push ebp
	mov ebp, esp
	;line from (0,0) to (4,0)
	push 0x0	;y2
	push 0x4	;x2
	push 0x0	;y1
	push 0x0	;x1
	call bresenLine
	;line from (0,4) to (4,4)
	push 0x4	;y2
	push 0x4	;x2
	push 0x4	;y1
	push 0x0	;x1
	call bresenLine
	;line from (3,1) to (3,1)
	push 0x1	;y2
	push 0x3	;x2
	push 0x1	;y1
	push 0x3	;x1
	call bresenLine
	;line from (2,2) to (2,2)
	push 0x2	;y2
	push 0x2	;x2
	push 0x2	;y1
	push 0x2	;x1
	call bresenLine
	;line from (1,3) to (1,3)
	push 0x3	;y2
	push 0x1	;x2
	push 0x3	;y1
	push 0x1	;x1
	call bresenLine
	;guardar separador
	mov [xcoord + edi], byte ' '	
	mov [ycoord + edi], byte ' '
	inc edi
	mov esp, ebp
	pop ebp
	ret

drawLetterComma:
	push ebp
	mov ebp, esp
	;line from (0,3) to (0,4)
	push 0x4	;y2
	push 0x0	;x2
	push 0x3	;y1
	push 0x0	;x1
	call bresenLine
	;guardar separador
	mov [xcoord + edi], byte ' '	
	mov [ycoord + edi], byte ' '
	inc edi
	mov esp, ebp
	pop ebp
	ret

drawLetterDot:
	push ebp
	mov ebp, esp
	;line from (0,4) to (0,4)
	push 0x4	;y2
	push 0x0	;x2
	push 0x4	;y1
	push 0x0	;x1
	call bresenLine
	;guardar separador
	mov [xcoord + edi], byte ' '	
	mov [ycoord + edi], byte ' '
	inc edi
	mov esp, ebp
	pop ebp
	ret
