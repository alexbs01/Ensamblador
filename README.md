# Assembly

## Registros

| Registro                                          | Número | Uso  | ¿Preservado? |
| :-----------------------------------------------: | :----: | :--: | :----------: |
| **$zero**     |    0     |   Constante con valor 0    |       No aplicable       |
| **$at**         | 1 | Reservado para el ensamblador | No |
| **$v0** - **$v1** | 2 - 3 | Valores devueltos en funciones y evaluación de funciones | No |
| **$a0** - **$a3** | 4 - 7 |             Paso de argumentos en funciones              | No |
| **$t0** - **$t7**            | 8 - 15 | Registros temporales | No |
| **$s0** - **$s7** | 16 - 23 | Registros que deben preservarse | Sí |
| **$t8** - **$t9**           | 24 - 25 | Registros temporales | No |
| **$k0** - **$k1** | 26 - 27 | Reservado para OS | No |
| **$gp**                      | 28 | Puntero global | Sí |
| **$sp**                     | 29 | Puntero de pila | Sí |
| **$fp**                    | 30 | Puntero de bloque de activación | Sí |
| **$ra**                | 31 | Dirección de retorno | Sí |



## Tipos de instrucciones de MIPS

La longitud de todas las instrucciones es de 32 bits.  

Nombre de los campos de las instrucciones MIPS:

- **Op**: Nombre de la operación o de la instrucción.
- **Rs**: Primer registro.  
- **Rt**: Segundo registro.  
- **Rd**: Registro de destino, la operación de Rs y Rt se almacena en este registro.  
- **Shamt**: Tamaño del desplazamiento (Shift Amount).
- **Funct**: Identificador de la operación aritmética a realizar
- **Inmediato**: Operado inmediato
- **DIreccion**: Dirección de destino del salto.  

### Tipo R

Las instrucciones de tipo R son para las operaciones aritmético-lógicas como las sumas las restas o las comparaciones. Tienen esta forma:  

```| op 6 bits| rs 5 bits | rt 5 bits | rd 5 bits | shamt 5 bits | func 6 bits |```  

Ejemplos:  

| Instrucción | Formato          | Definición |
| ----------- | ---------------- | ------------ |
| add         | ```add $1, $2, $3``` | Almacena en el registro **$1** la suma de **$2** y **$3** |
| sub | ```sub $1, $2, $3``` | Almacena en el registro **$1** la resta de **$2** y **$3** |
| and | ```and $1, $2, $3``` | Guarda en el registro **$1** el resultado de hacer la operación AND entre **$2** y **$3** |
| or | ```or $1, $2, $3``` | Guarda en el registro **$1** el resultado de hacer la operación OR entre **$2** y **$3** |
| slt | ```slt $1, $2, $3``` | Almacena un 1 en **$1** si **$2** < **$3**, en caso contrario guarda un 0 |
| sll | ```sll $1, $2, n``` | Almacena en el registro **$1** el valor del registro **$2** desplazado n bits a la izquierda |
| srl | ```srl $1, $2, n``` | Almacena en el registro **$1** el valor del registro **$2** desplazado n bits a la derecha |
| sra | ```sra $1, $2, n``` | Almacena en el registro **$1** el valor del registro **$2** después de hacer un desplazamiento de n bits a la derecha |

-----

### Tipo I

Las instrucción de tipo I son para referencias a memoria, operaciones aritméticas inmediatas o para saltos condicionales. Tienen la forma:  

```| op 6 bits| rs 5 bits | rt 5 bits | inmediato 16 bits |```  

Ejemplos
| Instrucción | Formato          | Definición |
| ----------- | ---------------- | ------------ |
| addi        | ```addi $1, $2, cte``` | Almacena en el registro **$1** la suma de **$2** y el valor **constante** |
| andi | ```andi $1, $2, cte``` | Guarda en el registro **$1** el resultado de hacer la operación AND entre **$2** y  el valor **constante** |
| ori | ```ori $1, $2, cte``` | Guarda en el registro **$1** el resultado de hacer la operación OR entre **$2** y el valor **constante** |
| slti | ```slti $1, $2, cte``` | Almacena un 1 en **$1** si **$2** < el valor **constante**, en caso contrario guarda un 0 |
| lui | ```lui $1, cte``` | Carga el valor **constante** en los 16 bits superiores del registro **$1** |
| lw | ```lw $1, desplazamiento($2)``` | Carga en el registro **$1** la palabra almacenada en la dirección de memoria que contiene el registro **$2** más el desplazamiento. La nueva posición debe ser un múltiplo de 4 |
| lb | ``` lb $1, desplazamiento($2) ``` | Carga en el registro **$1** el byte de memoria apuntado por la dirección almacenada en el registro **$2** más el desplazamiento |
| la | ```la $1, direccion``` | Carga en el registro **$1** la dirección (address) de memoria etiquetada con **direccion**. |
| sw | ```sw $1, desplazamiento($2)``` | Almacena en memoria en la posición obtenida de sumarle el desplazamiento a la dirección del registro **$2**, la palabra del registro **$1**. La nueva dirección debe ser un múltiplo de 4. |
| sb | ```sb $1, desplazamiento($2)``` | Almacena en la posición de memoria correspondiente al valor de **$2** más el desplazamiento, el primer byte de la palabra almacenada en **$1**. |
| beq | ```beq $1, $1, etiqueta``` | Si los valores de **$1** y **$2** son iguales, se modifica el valor del PC para pasar a ejecutar el trozo de código en el que está la etiqueta. |
| bne | ```bne $1, $1, etiqueta``` | Si los valores de **$1** y **$2** no son iguales, se modifica el valor de PC para pasar a ejecutar el troza de código en el que está la etiqueta. |

-----

### Tipo J

Las instrucciones de tipo J, son utilizadas para realizar saltos incondicionales. Tienen la forma:  

``` | op 6 bits | direcion 26 bits |```  

| Instrucción | Formato            | Definición                                                   |
| ----------- | ------------------ | ------------------------------------------------------------ |
| j           | ```j etiqueta```   | Modifica el valor de PC para ejecutar la siguiente instrucción a la etiqueta |
| jal         | ```jal etiqueta``` | Modifica el valor del PC por aquel al que apunta la etiqueta y almacena la dirección actual del PC en $ra |

----

## Códigos de ejemplo

Para comenzar a escribir código en ensamblador, hay que escribir una **cabecera obligatoria** para cada programa.  

```assembly
.text
.globl main

:main
# Codigo del programa
```

También podemos reservar espacio en memoria para unos determinador valores de números, caracteres o incluso cadenas de texto 

```assembly
.data								# Reservamos espacio en memoria
arrayNumeros: .word 2, 9, 8, 3, 4  	   # Bajo el nombre de la etiqueta, estaremos guardando 5 numeros
variableX: .word 10					 # Tambien podemos utilizarlo para valores unicos
cadena: .ascii "Esto es una cadena"   # Con .asciiz guaradamos una cadena de texto
espacio: .space 150 				 # Con .space estaremos reservando 150 bytes de memoria para despues ocuparla con lo que deseemos
```

Con todo esto podemos hacer un pequeño programa que sume dos enteros como el 10 y el 7.  

```assembly
.data
variableX: .word 10 	# Almacenamos en memoria el número 10
variableY: .word 7 	# Y hacemos lo mismo con el número 7

.text 	# Ponemos las líneas obligatorias de inicio de programa
.globl main 

main:

la $a0, variableX 	# En carga en $a0 el valor del array de variableX 
la $a1, variableY 	# Hacemos lo mismo con variableY

lw $t0, 0($a0) 	# Cargamos en el registro del valor del primer elemento guardado en $a0, que es el numero 10
lw $t1, 0($a1) 	# Hacems lo mismo con el $a1 solo que guardándolo en $t1

add $a0, $t0, $t1 	# Sumamos $t0 y $t1, y lo almacenamos en $a0
add $v0, $0, $a0	# Pasmos el valor de $a0 a $v0

addi $v0, $0, 1 	# Y finalmente una suma inmediate de 1 y 0, almacenandose en $v0 para que con el
syscall 	# syscall, se muestre por pantalla el valor de la suma de los enteros

addi $v0, $0, 10
syscall
```

