.include "m8515def.inc"
               .def result = R17 
               .def final = R1
               main :
                   ldi ZL, LOW(2*SESUATU) 		// load address of SESUATU
                   ldi ZH, HIGH(2*SESUATU)		//load address of SESUATU
loop : lpm						//load program memory
                   adiw ZL,1 				//increment the address by 1
                   tst R0 				//to check if the contect of R0 =0
                   breq stop 				//if R0=0 jump to stop
                   add result, R0 			//Result = result +R0
                   rjmp loop 				//jump to loop
               stop :
                   mov final, result 			// move the content of result to final
               forever :
                   rjmp forever	 			// jump to forever
               SESUATU:
               .db 1,2,3,4,5,6
               .db 0