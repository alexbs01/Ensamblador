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