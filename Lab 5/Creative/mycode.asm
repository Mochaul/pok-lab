.include "m8515def.inc"

.def numbers = R1
.def subtractor = R17
.def result = R3

main :
	ldi ZL,LOW(2*NUM) //load address num
	ldi ZH,HIGH(2*NUM) // load address num
	ldi R17,2 // load 1 to R17


	lpm // load program memory,insert memory from num to R0
	add R1,R0			//R1=R1+R0
	sub R1,R17			//R1=R1-R17
	mov result,numbers	

NUM :
	.db 2
	
