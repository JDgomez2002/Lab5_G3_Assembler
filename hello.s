/* -----------------------------------------------
* UNIVERSIDAD DEL VALLE DE GUATEMALA 
* Organizacion de computadoras y Assembler
* Ciclo 1 - 2022
*
* hello1.s
* Imprime en pantalla el mensaje utilizando pro-
* gramacion mixta.
*
* R0: inicio de cadena o mensaje a imprimir.
* R1: valor numerico a imprimir, no se usa.
 ----------------------------------------------- */
 

.text											# Inicio de segmento de codigo
.align 2
.global main
.type main,%function

main:

	stmfd sp!, {lr}								# SP = R13 link register 

	mov r4,#5
	ldr r0, =Welcome
	bl puts

	

loop: 
	cmp r4,#0
	beq exit
	sub r5,r4,#1
	move r6,r5
	ldr r0 =Formating
	mov r1,r6
	bl printf
	mov r4,r5
	b loops

exit: 
	mov r0, #0									# salida correcta 
	mov r3, #0
	ldmfd sp!, {lr}	/* R13 = SP */
	bx lr


.data
.align 2
Welcome: .asciz "Holiwiz \n"
Formating: .asciz "Result"
Contador: .word 0

