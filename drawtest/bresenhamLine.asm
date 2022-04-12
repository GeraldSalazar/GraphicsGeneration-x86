%include 'bresenhamcircle.asm'
section	.data
	outputFile: db 'output.txt', 0
	fd: dd 0
	
section .bss
	binaryLetters resb 17700
	binaryLen equ 17450
	
	xcoord resb	25000
	ycoord resb 25000
	
	deltax resd 1
	deltay resd 1
	
section .text

writeTxt:
	mov eax, 8 ; creat
    mov ebx, outputFile ; first argument
    mov ecx, 644O ; the suffix O means Octal in nasm, like the leading 0 in C. see: http://www.nasm.us/doc/nasmdoc3.html
    int 80h ; calls the kernel
    
    mov [fd], eax ; the return value is in eax - the file descriptor
    
    xor edi, edi
    mov esi, 0
    call generateImg
    mov eax, 4 ; write
    mov ebx, [fd]
    mov ecx, binaryLetters
    mov edx, binaryLen
    add edx, 100
    int 80h
    
    mov eax, 6 ; close
    mov ebx, [fd]
    int 80h

    mov eax, 1 ; exit
    mov ebx, 0 ; return value
    int 80h

generateImg:
	push ebp
	mov ebp, esp
	jmp charLoop
	

charLoop:
	movzx eax, byte [xcoord + edi]	;eax = xcoords
	movzx ebx, byte [ycoord + edi]	;ebx = ycoords
	
	cmp eax, byte ' '
	je finishFill
	
	jmp checkZero
	
putpixel:	
	inc edi
	cmp ebx, 0
	je row1
	cmp ebx, 1
	je row2
	cmp ebx, 2
	je row3
	cmp ebx, 3
	je row4
	cmp ebx, 4
	je row5

checkZero:
	cmp [binaryLetters + edi], byte 0x31
	jne addZero
	jmp putpixel

addZero:
	mov [binaryLetters + edi], byte 0x30	;Rellenando con 0
	jmp putpixel
	
finishFill: 
	mov edx, 0
	jmp fillLoop

fillLoop:
	cmp edx, 25
	je checkNext
	
	movzx eax, byte [binaryLetters + esi + edx]
	cmp eax, byte 0x31
	jne	fillZero
	
	inc edx
	jmp fillLoop

fillZero:
	mov [binaryLetters + esi + edx], byte 0x30
	inc edx
	jmp fillLoop
	
checkNext:
	add esi, 25
	cmp esi, binaryLen		;caracter de finalizacion en la sig pos?
	je addSigning
	movzx eax, byte [xcoord + edi]	
	jmp nextLetter
	
row1:
	mov [binaryLetters + esi + eax], byte 0x31
	jmp charLoop
row2:
	add eax, 5
	mov [binaryLetters + esi + eax], byte 0x31
	jmp charLoop
row3:
	add eax, 10
	mov [binaryLetters + esi + eax], byte 0x31
	jmp charLoop
row4:
	add eax, 15
	mov [binaryLetters + esi + eax], byte 0x31
	jmp charLoop
row5:
	add eax, 20
	mov [binaryLetters + esi + eax], byte 0x31
	jmp charLoop

nextLetter:
	inc edi
	jmp charLoop
		
bresenLine:
	push ebp
	mov ebp, esp
	
	;[esp+8]	;x1
	;[esp+12]	;y1
	;[esp+16]	;x2
	;[esp+20]	;y2
	
	mov eax, [esp+16]	;eax = x2
	mov ebx, [esp+20]	;ebx = y2
	
	sub eax, [esp+8]	;dx = x2 - x1
	sub ebx, [esp+12]	;dy = y2 - y1
	
	;abs(dx)
	mov ecx, eax
	neg eax
	cmovl eax, ecx
	
	;abs(dy)
	mov ecx, ebx
	neg ebx
	cmovl ebx, ecx
	
	mov [deltax], al
	mov [deltay], bl
	
	cmp eax, ebx
	jg penNegativa
	jmp penPositiva
	
	
penNegativa:
	mov eax, [esp+8]	;x1
	mov ebx, [esp+12]	;y1
	
	;guardar el pixel a dibujar
	mov [xcoord + edi], al	
	mov [ycoord + edi], bl
	
	xor eax, eax	;limpiar eax
	xor ebx, ebx	;limpiar ebx
	
	mov eax, [deltax]	;eax = dx
	mov ebx, [deltay]	;ebx = dy
		
	add ebx, ebx	;eax = 2dy
	sub ebx, eax	;ebx = 2dy - dx
	mov ecx, ebx	;pk = 2dy - dx
	
	mov edx, 0
	jmp bresenLoopN
	
bresenLoopN:
	add edi, 1		;aumentar contador para guardar siguiente dato/pixel
	cmp edx, [deltax]	;for(edx = 0; edx<deltax, edx++)
	jge return
	inc edx
	
	
	add [esp+8], byte 0x1	;x1 += 1
	cmp ecx, 0
	jl pk1
	jmp pk2
	
pk1:
	xor eax, eax	;limpiar eax
	
	mov eax, [deltay]	;eax = dy
	
	add eax, eax 	;eax = 2dy
	add ecx, eax	; ecx = pk = pk + 2dy
	
	mov eax, [esp+8]	;x1
	mov ebx, [esp+12]	;y1
	
	;guardar el pixel a dibujar
	mov [xcoord + edi], al
	mov [ycoord + edi], bl
	
	jmp bresenLoopN

pk2:
	add [esp+12], byte 0x1	;y += 1
	xor eax, eax	;limpiar eax y ebx
	xor ebx, ebx
	
	mov eax, [deltax]	;eax = dx
	mov ebx, [deltay]	;ebx = dy
	
	add eax, eax 	;eax = 2dx
	add ebx, ebx 	;ebx = 2dy
	sub ebx, eax	;ebx = 2dy - 2dx
	add ecx, ebx	; ecx = pk = pk + (2dy - 2dx)
	
	mov eax, [esp+8]	;x1
	mov ebx, [esp+12]	;y1
	
	;guardar el pixel a dibujar
	mov [xcoord + edi], al	
	mov [ycoord + edi], bl
	
	jmp bresenLoopN
	
penPositiva:
	mov eax, [esp+8]	;x1
	mov ebx, [esp+12]	;y1
	
	;guardar el pixel a dibujar
	mov [xcoord + edi], al
	mov [ycoord + edi], bl
	
	xor eax, eax	;limpiar eax
	xor ebx, ebx	;limpiar ebx
	
	mov eax, [deltax]	;eax = dx
	mov ebx, [deltay]	;ebx = dy
		
	add eax, eax	;eax = 2dx
	sub eax, ebx	;eax = 2dx - dy
	mov ecx, eax	;pk = 2dx - dy
	
	mov edx, 0
	jmp bresenLoopP

bresenLoopP:
	add edi, 1	;aumentar contador para guardar siguiente dato/pixel
	cmp edx, [deltay]	;for(edx = 0; edx<deltay, edx++)
	jge return
	inc edx
	
	
	add [esp+12], byte 0x1	;y1 += 1
	cmp ecx, 0
	jl pk1Pos
	jmp pk2Pos

pk1Pos:
	xor eax, eax	;limpiar eax
	
	mov eax, [deltax]	;eax = dx
	
	add eax, eax 	;eax = 2dx
	add ecx, eax	; ecx = pk = pk + 2dx
	
	mov eax, [esp+8]	;x1
	mov ebx, [esp+12]	;y1
	
	;guardar el pixel a dibujar
	mov [xcoord + edi], al	
	mov [ycoord + edi], bl
	
	jmp bresenLoopP
	
pk2Pos:
	add [esp+8], byte 0x1	;x1 += 1
	xor eax, eax	;limpiar eax y ebx
	xor ebx, ebx
	
	mov eax, [deltax]	;eax = dx
	mov ebx, [deltay]	;ebx = dy
	
	add eax, eax 	;eax = 2dx
	add ebx, ebx 	;ebx = 2dy
	sub eax, ebx	;ebx = 2dx - 2dy
	add ecx, eax	; ecx = pk = pk + (2dx - 2dy)
	
	mov eax, [esp+8]	;x1
	mov ebx, [esp+12]	;y1
	
	;guardar el pixel a dibujar
	mov [xcoord + edi], al	
	mov [ycoord + edi], bl
	
	jmp bresenLoopP
	
return:
	mov esp, ebp
	pop ebp
	ret

addSigning:
	inc edi
	call fillCircleBytes
	mov esp, ebp
	pop ebp
	ret
