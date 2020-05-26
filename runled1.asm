							xdef runled1, sequenceflag1, showflag1, sequence1
							xref PTS, ledflag

variables:  section
sequenceflag	 ds.b 	1
showflag			 ds.b   1


constants:  section
sequence1:       dc.b    $FF, $7F, $3F, $1F, $0F, $07, $03, $01, $00

runled1:	pshx
					pshy 
					pshd

					ldaa ledflag
					cmpa #0
					beq resetsequence
					bra loop

loop: 		ldaa sequenceflag1
					cmpa #10
					bne loop2
reset:		ldaa #1
					staa sequenceflag1

loop2:		ldx #sequence
					ldab #1
loop3: 		cmpb sequenceflag1
					beq show
					incb
					incx ;increases to the next led sequence
					bra loop3


resetsequence:		reset

show:			ldaa 0,x
					inc sequenceflag1
					ldaa showflag1
					cmpa #0
					beq done
									
  
					staa PTS
done:			puld
					puly
					pulx
					rts

