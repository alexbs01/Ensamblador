.data
palabra: .space 25
numero1: .space 2
numero2: .space 2

.text
.globl main

main:

# Guardamos la palabra en $t0
la $a0, palabra		# Almacenamos momentaneamente la palabra en $a0
addi $a1, $0, 100		# En $a1, el tamaño que tendrá la palabra
addi $v0, $0, 8		# Con syscall y el 8, indicamos que vamos a recoger una cadena de texto
syscall

add $t0, $0, $a0		# La cadena de texto recogida que está en $a0, la cambiaremos al registro $t0

# Guardamos el primer numero en $t1
la $a0, numero1		
addi $a1, $0, 100
addi $v0, $0, 5		# Como es un número entero, hay que pasar el número 5
syscall

add $t1, $0, $v0		# Almacenamos en $t1

# Guardamos en $t2 el segundo numero
la $a0, numero2		# Repetimos el mismo proceso que antes
addi $a1, $0, 100
addi $v0, $0, 5
syscall

add $t2, $0, $v0		# Almecenamos en $t2

###

add $t4, $t1, $t2		# Sumamos los dos números que escribimos
sub $t5, $t1, $t2		# Y aquí los restamos, y guardamos el resultado de cada operación en $t4 y $t5 respectivamente

add $a0, $0, $t0		# Pasamos la cadena de $t0 a $a0
add $v0, $0, $a0		# Y luego de $a0 a $v0
addi $v0, $0, 4		# Imprimimos la cadena que se escribió antes
syscall

add $a0, $0, $t4		# Repetimos lo mismo pero para mostrar la suma
add $v0, $0, $a0
addi $v0, $0, 1
syscall

add $a0, $0, $t5		# Y por último mostramos la resta
add $v0, $0, $a0
addi $v0, $0, 1
syscall


