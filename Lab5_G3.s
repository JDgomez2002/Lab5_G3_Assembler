.text
.align 2
.global main
.type main,%function

main:

    stmfd sp!, {lr}
    
    mov r2, #7
    ldr r0, = prueba
    mov r1, #6
    bl printf 

    //printf (prueba, 6);
    //        r0      r1

    ldr r0, = promedio_1
    ldr r1, [r0]
    ldr r0, =prueba

    bl printf

    mov r0, #0
    mov r3, #0
    ldmfd sp!, {lr} /* comentario */
    bx lr

.data
.align 2



prueba:
    .asciz "Hello World! %d %d\n"

promedio_1:
    .word 45

promedio_2:
    .word 59

promedio_3:
    .word 71

promedio_4:
    .word 86

promedio_5:
    .word 99

calificacion_1:
    .asciz "Regular\n"

calificacion_2:
    .asciz "Regular\n"

calificacion_3:
    .asciz "Regular\n"

calificacion_4:
    .asciz "Regular\n"

calificacion_5:
    .asciz "Regular\n"