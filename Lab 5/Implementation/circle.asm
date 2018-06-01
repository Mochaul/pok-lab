.include "m8515def.inc"
.def diameter = R2
.def phi = R17 //ldi must be >= 17
.def perimeter = R3
.def area = R4
.def radiusSquare = R5

main :
	ldi R17,3	// load 3 into phi
	ldi R18,4 	// example diameter  = 4
	mov R2,R18 	// moves r18 to r2

calculation:	
	mul R2,R17 	// perimeter = phi x diameter (saves in r0)
	mov R3,R0 	// moves  r0 to R3
	lsr R2		// divides r2 by 2 (shift right)
	mul R2,R2	// r * r (saves in r0)
	mov R5,R0	// moves r0 to r5
	mul R5,R17	// phi * r * r (saves in r0)
	mov R4,R0	// moves r0 to r4
	


