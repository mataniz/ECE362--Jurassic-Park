							xdef runled1, sequenceflag2, showflag2,sequence2
							xref PTS, ledflag

variables:  section
sequenceflag	 ds.b 	1
showflag			 ds.b   1


constants:  section
sequence2:       dc.b    $FF, $7F, $3F, $1F, $0F, $07, $03, $01, $00

runled1:	pshx
					pshy 
					pshd

					ldaa ledflag2
					cmpa #0
					beq resetsequence
					bra loop

loop: 		ldaa sequenceflag2
					cmpa #10
					bne loop2
reset:		ldaa #1
					staa sequenceflag2

loop2:		ldx #sequence
					ldab #1
loop3: 		cmpb sequenceflag2
					beq show
					incb
					incx ;increases to the next led sequence
					bra loop3


resetsequence:		reset

show:			ldaa 0,x
					inc sequenceflag2
					ldaa showflag2
					cmpa #0
					beq done
									
  
					staa PTS
done:			puld
					puly
					pulx
					rts

