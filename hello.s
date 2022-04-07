/* -----------------------------------------------
* UNIVERSIDAD DEL VALLE DE GUATEMALA 
* Org de computadoras y Assembler
* Ciclo 1 - 2022
* Gonzalo Santizo
* Jose Daniel Gomez
* Melanie ... pls agrega tu apellido :v
 ----------------------------------------------- */



	@@ codigo de assembler: se coloca en la seccion .text
	.text
	.align		2

	@@ etiqueta "main" llama a la funcion global
	.global		main
	.type		main, %function


main:
	@@ grabar registro de enlace en la pila
	stmfd	sp!, {lr}
	mov r4,#5 @contador para realizar 5 iteraciones
	ldr r0, =bienvenute @mensaje de bienvenida
	bl puts


loops:
	cmp r4, #0 
	beq exit /*Salir del loop a seguir con el programa*/

	sub r4,r4,#1 /* decrementar contador */
	mov r6,r5
	
	ldr r0,=mensaje_ingreso
	bl puts
	
	/*--solicitar camisa--*/
	@ ingreso de datos
	@ r0 contiene formato de ingreso
	@ r1 contiene direccion donde almacena dato leido
	ldr r0,=entrada
	ldr r1,=a
	bl scanf
	
	@@ calculos
	ldr r2,=a
	ldr r0,[r2]		/* direccion y valor de a en R0*/
	cmp r0,#1
	blt Wrong		/*en caso de ingesar un valor infrior al rango de 1-3 indicar que no es valido-*/
	addeq r9,#1		/* aumentar conteo de camisas pequenas*/
	cmp r0,#2		/* direccion y valor de b en R1*/
	addeq r8,#1	/* aumentar conteo talla M*/
	cmp r0,#3		/* direccion y valor de b en R1*/
	addeq r7,#1	/* aumentar conteo talla G */
	cmp r0,#4	/* direccion y valor de b en*/
	bge Wrong /*en caso de ingesar un valor superior al rango de 1-3 indicar que no es valido-*/
	b loops


Wrong:
	ldr r0,=wrong
	bl puts
	b loops



exit:
	/*--mostrar el resultado de las camisas--*/	
	@camisas pequenas
	ldr r0,=MalRendimiento
	str r9,[r0]
	ldr r0,=formato1				@@ carga inicio de mensaje a imprimir.
	mov r1,r9					@@ mueve resultado de R3 a R1 a imprimir
	bl printf

	@camisas medianas
	ldr r0,=RendimientoRegular
	str r8,[r0]
	ldr r0,=formato2
	mov r1,r8
	bl printf

	@camisas grandes 
	ldr r0,=BuenRendimiento
	str r7,[r0]
	ldr r0,=formato3
	mov r1,r7
	bl printf 

	/*--salida del sistema--*/
	mov	r3, #0
	mov	r0, r3

	@ colocar registro de enlace para desactivar la pila y retorna al SO
	ldmfd	sp!, {lr}
	bx	lr




.data
.align 2

a:	.word 0


formato:
	.asciz "\nCalculo de x=(a+b)-c = %d\n"
entrada:
	.asciz " %d"
mensaje_ingreso:
	.asciz "Ingrese dato: "
formato1:
	.asciz "El resultado de las personas con MAL rendimiento : %d\n"
formato2: 
	.asciz "El resultado de la personas con rendimiento REGULAR: %d\n"
formato3:
	.asciz "El resultado de la personas con BUEN rendimiento: %d\n"
wrong:
	.asciz "Tipo no valido \n"
MalRendimiento:
	.word 0
RendimientoRegular:
	.word 0
BuenRendimiento:
	.word 0
bienvenute: .asciz "welcome \n"
