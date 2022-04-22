# Assembly

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

