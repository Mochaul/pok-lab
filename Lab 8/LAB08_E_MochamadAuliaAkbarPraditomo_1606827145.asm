.include "m8515def.inc"

.org$00
	rjmp RESET

.org$06
	rjmp ISR_TOV1

RESET:
	ldi r16,low(RAMEND)
	out SPL,r16
	ldi r16,high(RAMEND)
	out SPH,r16

	ldi r16,(1<<CS01)
	out TCCR1B,r16

	ldi r16,(1<<TOV1)
	out TIFR,r16

	ldi r16, (1<<TOIE1)
	out TIMSK, r16

	sei

INIT_LED:
	ser r17
	out DDRA, r17
	ldi r17, 0xff
	out PORTA, r17

	ser r16
	out DDRB, r16
	ldi r16,0x0f
	out PORTB, r16


FOREVER:
	rjmp FOREVER

ISR_TOV1:
	lsr r17
	out PORTA, r17
	tst r17
	breq READY
	reti

READY:
	ldi r16, 0xf0
	out PORTB,r16
	ret
