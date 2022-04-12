%include 'letters.asm'

section .data
  file db "inputText.txt",0 ;filename ends with '\0' byte
  
  
section .bss
  descriptor resb 4 ;memory for storing descriptor
  buffer resb 5593	;Bytes para guardar el txt a leer
  len equ $ - buffer	;Longitud del txt en bytes
  
  data resb 700 ;Input fromateado
  lenData equ $ - data
  
  graphCont resd 1
  
section .text
global _start

_start:
	
	
	mov eax,5 ;abrir
	mov ebx,file ;nombre del archiuvo
	mov ecx,0 ;rsolo lectura
	int 80h ;sys_call para abrir archivo

	mov [descriptor],eax ;se guarda el id del archivo
	
	mov eax,3 ;leer
	mov ebx,[descriptor] ;descriptor del archivo
	mov ecx,buffer ;leer al buffer reservado
	mov edx, len ;cantidad de bytes a leer
	int 80h ;sys_call para guardar los datos
	
	mov eax,6 ;cerrar
	mov ebx,[descriptor] ;descriptor del archivo
	int 80h ;sys_call para cerrar archivo
	
	mov edi, 0	;Contador para formar grupos de 8 bits (ASCII)
	mov dl, 0	;contenedor de la cadena de cada byte ASCII
	
	mov esi, 0	;Offset de momeoria para recorrer el buffer
	
	xor eax, eax	;Limpiar registros. eax contiene el valor entrante del txt
	xor ebx, ebx	;y ebx contiene contador para el guardado de datos en mem
	
  
agruparbytes:
	cmp esi, len		;Se chequea si ya termino de leer los datos
	je startDrawing		;Se inicia con la generacion de graficos

	cmp edi, 0x8	
	je clasificarChar			;jump done if(edi ?= 8)
					;else continue
					
	movzx eax, byte [buffer+esi]	;Se toma el valor (0 o 1 del txt de entrada)
	
	inc edi		;edi += 1
	inc esi		;edi += 1
	
	cmp eax, byte '0'	;Es el valor del byte del texto igual a 0?	
	je addzero			;
	jmp addone			;formar cadena segun entrada


;Agrega un cero en la cadena a formar	
addzero:
	shl dl, 1
	or dl, byte 0
	jmp agruparbytes
	
;Agrega un uno en la cadena a formar	
addone:
	shl dl, 1
	or dl, byte 1
	jmp agruparbytes


clasificarChar:
	mov [data + ebx], byte dl		;guardar byte (letra) en mem
	inc ebx							;Restaurar contadores/registros
	mov edi, 0 
	mov dl, byte 0
	jmp agruparbytes

startDrawing:
	mov eax, 0			;Clear eax
	xor dl, dl
	
	mov [graphCont], dword 0
	jmp genGraphics
	

genGraphics:
	mov ebx, [graphCont]
	mov dl, byte [data + ebx]
	add [graphCont], dword 1
	cmp dl, byte 0
	je done
	
	cmp dl, byte ' '
	je space
	cmp dl, byte '.'
	je dot
	cmp dl, byte ','
	je comma
	cmp dl, byte 'A'
	je letterA
	cmp dl, byte 'B'
	je letterB
	cmp dl, byte 'C'
	je letterC
	cmp dl, byte 'D'
	je letterD
	cmp dl, byte 'E'
	je letterE
	cmp dl, byte 'F'
	je letterF
	cmp dl, byte 'G'
	je letterG
	cmp dl, byte 'H'
	je letterH
	cmp dl, byte 'I'
	je letterI
	cmp dl, byte 'J'
	je letterJ
	cmp dl, byte 'K'
	je letterK
	cmp dl, byte 'L'
	je letterL
	cmp dl, byte 'M'
	je letterM
	cmp dl, byte 'N'
	je letterN
	cmp dl, byte 'O'
	je letterO
	cmp dl, byte 'P'
	je letterP
	cmp dl, byte 'Q'
	je letterQ
	cmp dl, byte 'R'
	je letterR
	cmp dl, byte 'S'
	je letterS
	cmp dl, byte 'T'
	je letterT
	cmp dl, byte 'U'
	je letterU
	cmp dl, byte 'V'
	je letterV
	cmp dl, byte 'W'
	je letterW
	cmp dl, byte 'X'
	je letterX
	cmp dl, byte 'Y'
	je letterY
	cmp dl, byte 'Z'
	je letterZ

space:
	call drawSpace
	jmp genGraphics
comma:
	call drawLetterComma
	jmp genGraphics
dot:
	call drawLetterDot
	jmp genGraphics
letterA:
	call drawLetterA
	jmp genGraphics
letterB:
	call drawLetterB
	jmp genGraphics
letterC:
	call drawLetterC
	jmp genGraphics
letterD:
	call drawLetterD
	jmp genGraphics
letterE:
	call drawLetterE
	jmp genGraphics
letterF:
	call drawLetterF
	jmp genGraphics
letterG:
	call drawLetterG
	jmp genGraphics
letterH:
	call drawLetterH
	jmp genGraphics
letterI:
	call drawLetterI
	jmp genGraphics
letterJ:
	call drawLetterJ
	jmp genGraphics
letterK:
	call drawLetterK
	jmp genGraphics	
letterL:
	call drawLetterL
	jmp genGraphics
letterM:
	call drawLetterM
	jmp genGraphics
letterN:
	call drawLetterN
	jmp genGraphics
letterO:
	call drawLetterO
	jmp genGraphics
letterP:
	call drawLetterP
	jmp genGraphics
letterQ:
	call drawLetterQ
	jmp genGraphics
letterR:
	call drawLetterR
	jmp genGraphics
letterS:
	call drawLetterS
	jmp genGraphics
letterT:
	call drawLetterT
	jmp genGraphics
letterU:
	call drawLetterU
	jmp genGraphics
letterV:
	call drawLetterV
	jmp genGraphics
letterW:
	call drawLetterW
	jmp genGraphics
letterX:
	call drawLetterX
	jmp genGraphics
letterY:
	call drawLetterY
	jmp genGraphics
letterZ:
	call drawLetterZ
	jmp genGraphics
	
done:
	;Separadores para indicar final de texto
	mov [xcoord + edi - 1], byte 0x23
	mov [ycoord + edi - 1], byte 0x23
	jmp writeTxt
    

