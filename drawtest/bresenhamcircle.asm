
section .data
	
	
section .bss
	; Circle center coords
	p resd 1
	q resd 1
	
	; Circle radius
	r resd 1
	
	;current pixel
	x resd 1
	y resd 1
	
	;decision parameter
	d resd 1

section .text

bresenCircle:
	; center at (4,4)
	mov [p], dword 4
	mov [q], dword 4
	
	;radius = 2
	mov [r], dword 2
	
	; d = 0
	mov [d], dword 0
	
bresenhamCircle:
	
	mov eax, [r]	; eax = r
	add eax, eax	; eax = 2r
	mov ebx, 3	; ebx = 3
	sub ebx, eax	; ebx = d = 3-2r
	mov [d], ebx
	
	mov eax, [r]	; eax = r
	
	mov [x], dword 0	; x = 0
	mov [y], eax		; y = r
		
circleLoopMain:

	mov ebx, [y]	; ebx = y
	cmp [x], ebx	; if (x >= y) return
	jl plotPoints	
	jmp return

	
plotPoints:
	;//////Pixel 1//////////
	
	mov edx, [y]	;edx = y
	mov ebx, [x]	;ebx = x
	
	;(p, q) circle center
	mov ecx, [p]	;ecx = xc
	mov eax, [q]	;eax = yc
	
	add ecx, ebx	;ebx = xc + x
	add eax, edx	;eax = yc + y
	
	mov esi, dword 10
	mul esi			;ax = 10(yc+y)	(colum Offset)
	add eax, ecx	;eax = 10(yc + y) + (xc + x)
	mov [binaryLetters + binaryLen + eax], byte '1'	;put pixel
	
	
	;//////Pixel 2//////////
	
	mov edx, [y]	;edx = y
	mov ebx, [x]	;ebx = x
	
	;(p, q) circle center
	mov ecx, [p]	;ecx = xc
	mov eax, [q]	;eax = yc
	
	sub ecx, ebx	;ebx = x = xc - x
	add eax, edx	;edx = yc + y
	
	mov esi, dword 10
	mul esi			;eax = 10(yc + y)	(colum Offset)
	add eax, ecx	;eax = 10(yc + y) + (xc - x)
	mov [binaryLetters + binaryLen + eax], byte '1'	;put pixel
	
	
	;//////Pixel 3//////////
	
	mov edx, [y]	;edx = y
	mov ebx, [x]	;ebx = x
	
	;(p, q) circle center
	mov ecx, [p]	;ecx = xc
	mov eax, [q]	;eax = yc
	
	add ecx, ebx	;ebx = x = xc + x
	sub eax, edx	;edx = yc - y
	
	mov esi, dword 10
	mul esi			;eax = 10(yc + y)	(colum Offset)
	add eax, ecx	;eax = 10(yc - y) + (xc + x)
	mov [binaryLetters + binaryLen + eax], byte '1'	;put pixel
	
	
	;//////Pixel 4//////////
	
	mov edx, [y]	;edx = y
	mov ebx, [x]	;ebx = x
	
	;(p, q) circle center
	mov ecx, [p]	;ecx = xc
	mov eax, [q]	;eax = yc
	
	sub ecx, ebx	;ecx = x = xc - x
	sub eax, edx	;eax = yc - y
	
	mov esi, dword 10
	mul esi			;eax = 10(yc - y)	(colum Offset)
	add eax, ecx	;eax = 10(yc - y) + (xc - x)
	mov [binaryLetters + binaryLen + eax], byte '1'	;put pixel
	
	;//////Pixel 5//////////
	
	mov edx, [y]	;edx = y
	mov ebx, [x]	;ebx = x
	
	;(p, q) circle center
	mov ecx, [p]	;ecx = xc
	mov eax, [q]	;eax = yc
	
	add ecx, edx	;ecx = xc + y
	add eax, ebx	;eax = yc + x
	
	mov esi, dword 10
	mul esi			;eax = 10(yc + x)	(colum Offset)
	add eax, ecx	;eax = 10(yc + x) + (xc + y)
	mov [binaryLetters + binaryLen + eax], byte '1'	;put pixel
	
	
	;//////Pixel 6//////////
	
	mov edx, [y]	;edx = y
	mov ebx, [x]	;ebx = x
	
	;(p, q) circle center
	mov ecx, [p]	;ecx = xc
	mov eax, [q]	;eax = yc
	
	sub ecx, edx	;ecx = xc - y
	add eax, ebx	;eax = yc + x
	
	mov esi, dword 10
	mul esi			;eax = 10(yc + x)	(colum Offset)
	add eax, ecx	;eax = 10(yc + x) + (xc - y)
	mov [binaryLetters + binaryLen + eax], byte '1'	;put pixel
	

	;//////Pixel 7//////////
	
	mov edx, [y]	;edx = y
	mov ebx, [x]	;ebx = x
	
	;(p, q) circle center
	mov ecx, [p]	;ecx = xc
	mov eax, [q]	;eax = yc
	
	add ecx, edx	;ecx = xc + y
	sub eax, ebx	;eax = yc - x
	
	mov esi, dword 10
	mul esi			;eax = 10(yc - x)	(colum Offset)
	add eax, ecx	;eax = 10(yc - x) + (xc + y)
	mov [binaryLetters + binaryLen + eax], byte '1'	;put pixel

	
	;//////Pixel 8//////////
	
	mov edx, [y]	;edx = y
	mov ebx, [x]	;ebx = x
	
	;(p, q) circle center
	mov ecx, [p]	;ecx = xc
	mov eax, [q]	;eax = yc
	
	sub ecx, edx	;ecx = xc - y
	sub eax, ebx	;eax = yc - x
	
	mov esi, dword 10
	mul esi			;eax = 10(yc - x)	(colum Offset)
	add eax, ecx	;eax = 10(yc - x) + (xc - y)
	mov [binaryLetters + binaryLen + eax], byte '1'	;put pixel
	
	
	jmp findNextPixel

	
findNextPixel:
	cmp [d], dword 0	; if d < 0 jmp dNegative
	jl dNegative
	
	mov eax, [x]	; eax = x
	mov ebx, [y]	; ebx = y
	
	sub eax, ebx	; eax= x - y
	mov ecx, 4
	mul ecx			; eax = 4(x-y)
	add eax, dword 10		; eax = 4(x-y) + 10
	
	add [d], eax	; d = d + 4(x-y) + 10
	
	add [x], dword 1	;x+=1
	sub [y], dword 1	;y-=1
	
	jmp circleLoopMain
	
dNegative:

	mov eax, [x]	; eax = x
	mov ecx, 4
	mul ecx		; eax = 4(x)
	
	add eax, 6		; eax = 4(x) + 6
	
	add [d], eax	; d = d + 4(x) + 6
	
	add [x], dword 1			; x+=1
	jmp circleLoopMain
	
;;;////////////////////////////////////////////////
;Llenado con ceros de la memoria para colocar los pixeles del circulo

fillCircleBytes:
	
	push ebp
	mov ebp, esp
	
	mov edx, 0

zerosLoop:
	cmp edx, dword 100
	je bresenCircle
	
	mov [binaryLetters + esi + edx], byte '0'
	mov [binaryLetters + binaryLen + 0], byte '1'	;put pixel
	mov [binaryLetters + binaryLen + 1], byte '1'	;put pixel
	mov [binaryLetters + binaryLen + 2], byte '1'	;put pixel
	mov [binaryLetters + binaryLen + 3], byte '1'	;put pixel
	
	mov [binaryLetters + binaryLen + 20], byte '1'	;put pixel
	mov [binaryLetters + binaryLen + 30], byte '1'	;put pixel
	mov [binaryLetters + binaryLen + 40], byte '1'	;put pixel
	mov [binaryLetters + binaryLen + 50], byte '1'	;put pixel
	
	mov [binaryLetters + binaryLen + 90], byte '1'	;put pixel
	mov [binaryLetters + binaryLen + 91], byte '1'	;put pixel
	mov [binaryLetters + binaryLen + 92], byte '1'	;put pixel
	mov [binaryLetters + binaryLen + 93], byte '1'	;put pixel
	mov [binaryLetters + binaryLen + 94], byte '1'	;put pixel
	
	mov [binaryLetters + binaryLen + 59], byte '1'	;put pixel
	mov [binaryLetters + binaryLen + 69], byte '1'	;put pixel
	mov [binaryLetters + binaryLen + 79], byte '1'	;put pixel
	mov [binaryLetters + binaryLen + 89], byte '1'	;put pixel
	mov [binaryLetters + binaryLen + 99], byte '1'	;put pixel
	
	mov [binaryLetters + binaryLen + 9], byte '1'	;put pixel
	mov [binaryLetters + binaryLen + 19], byte '1'	;put pixel
	mov [binaryLetters + binaryLen + 29], byte '1'	;put pixel
	
	add edx, dword 1
	jmp zerosLoop
	


	
	
	
	
	
	
	
	
