
/* -----------------------------------------------
* UNIVERSIDAD DEL VALLE DE GUATEMALA 
* Org de computadoras y Assembler
* Ciclo 1 - 2022
* Gonzalo Santizo
* Jose Daniel Gomez
* Melanie Maldonado
 ----------------------------------------------- */



	
	/*Assembly code */
	.text
	.align		2

	
	.global		main
	.type		main, %function


main:
	@@ save info in stack
	stmfd	sp!, {lr}
	mov r4,#5 @counter
	ldr r0, =WelcomeMessage1 /* welcome */
	bl puts


loops:
	cmp r4, #0 
	beq exit /*exit loop*/

	sub r4,r4,#1 /* decrease counter */
	mov r6,r5
	
	ldr r0,=EntryMessage
	bl puts
	
	/*--solicitar notas--*/
	@ Here you can enter all the data
	@ r0 contains grading scores
	@ r1 storage section
	ldr r0,=entrada
	ldr r1,=a
	bl scanf
	
	@@ comparisons
	ldr r2,=a
	ldr r0,[r2]		/* adds value to r0*/
	cmp r0,#61
	addlt r9,#1		/* counter for bad scores goes up*/
	cmp r0,#85		/* b value in r1*/
	addlt r8,#1	/* counter for regular scores goes up*/
	cmp r0,#86		/* b value in R1*/
	addge r7,#1	/* counter for good scores goes up */
	cmp r0,#4	/* b value in r0*/
	b loops






exit:
	/*--show final results--*/	
	@notas malas
	ldr r0,=MalRendimiento
	str r9,[r0]
	ldr r0,=formato1				@@ Loads final scores for bad.
	mov r1,r9					@@ prints result
	bl printf

	@notas regular
	ldr r0,=RendimientoRegular
	str r8,[r0]
	ldr r0,=formato2 			@@ Loads final scores for regular.
	mov r1,r8
	bl printf

	@notas bueno
	ldr r0,=BuenRendimiento
	str r7,[r0]
	ldr r0,=formato3  			@@ Loads final scores for good.
	mov r1,r7
	bl printf 

	/*--salida del sistema--*/
	mov	r3, #0
	mov	r0, r3

	@ returns everything to start position
	ldmfd	sp!, {lr}
	bx	lr




.data
.align 2

a:	.word 0



entrada:
	.asciz " %d"
EntryMessage:
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
WelcomeMessage1: .asciz "welcome \n"