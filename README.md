# GraphicsGeneration-x86
Graphics generation by applying Bresenham-line algorithm in order to draw the letters from A to Z.

El sistema cumple las siguientes características:
1. Carga un archivo de texto con aproximadamente 100
palabras.
2. Es procesado por x86 con NASM y se obtiene una imagen de salida binarizada (fondo blanco con bit en uno
y el texto en negro con un bit en cero) contenida en un archivo de texto plano con resolución de 250x250 px.
3. Cada letra es 10 × 10 con un espacio de 1 píxel a la
izquierda y abajo de cada letra.
4. Se utiliza un algoritmo de predicción para realizar un salto de linea en caso que la totalidad de la palabra no tenga suficiente especio en el resto del renglón.
 
![image](https://user-images.githubusercontent.com/39849481/162957597-b6e02c07-17c1-40fa-8c75-d198dee62d2e.png)
