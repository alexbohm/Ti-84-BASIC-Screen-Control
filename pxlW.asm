.nolist
	#include "ti84pcse.inc"
.list
.org    userMem - 2
.db tExtTok,tAsm84CCmp
	;created by Alex Bohm
	;optimised for size & speed
	;assembly is a pain in the ass
	;x 0-319 (inclusive)
	;y 0-239 (inclusive)
	;color follows coding of rrrrrxgggggbbbbb
	;where r is red, g is green, b is blue, and x is ignored
	b_call(_RclY);set var y into OP1
	b_call(_ConvOP1);convert OP1 into int, store in de
	ld a, lrRow
	call setLCD
	b_call(_RclX);set var x into OP1
	b_call(_ConvOP1)
	ld a, lrCol
	call setLCD
	ld de, $ffff
	ld a, lrGram
	call setLCD
	ret
setLCD:
	out ($10),a
	out ($10),a
	ld c,$11
	out (c),d
	out (c),e
	ret
.end
.end