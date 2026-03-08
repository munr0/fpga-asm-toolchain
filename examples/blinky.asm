; Blinky.asm: blinks LEDR0 of the DE0-CV
$MODDE0CV

org 0000H
	ljmp myprogram

; For a 50MHz one clock cycle  takes 20ns
WaitHalfSec:
	mov R2, #133
L3: mov R1, #250
L2: mov R0, #250
L1: djnz R0, L1
	djnz R1, L2
	djnz R2, L3
	ret

myprogram:
	mov SP, #7FH
	mov LEDRA,#0
	mov LEDRB,#0
	mov LEDRC,#0
	mov LEDG,#0
M0:
	cpl LEDRA.0
	lcall WaitHalfSec
	sjmp M0
END
