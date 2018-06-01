 ;a simple program using compare
.include "m8515def.inc"
.def value1 = r16
.def value2= r17
.def temp1 = r18

ser temp1
out DDRB,temp1 
 
ldi value1, 3
ldi value2, 4

cp value1, value2
breq turn_on_all_led

cp value1, value2
brlt turn_on_47_led

cp value1, value2
brge turn_on_03_led

rjmp forever 

turn_on_all_led:
ldi temp1, 0xFF
out PORTB,temp1

turn_on_47_led:
ldi temp1,0xF0
out PORTB,temp1

turn_on_03_led;
ldi temp1,0x0F
out PORTB,temp1

forever:
rjmp forever ;infinite loop
