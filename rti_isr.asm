              xdef rti_isr, dcount,dcflag,ledcnt1,ledcnt2,ledcnt3,paddock1flg,padddock2flg,paddock3flg
							xdef stpcnt,stpcnt1,stpflg,counter,dino1cnt,dino2cnt,dino3cnt
            xref dcmotor, sturn, CRGFLG, runled, PTS, PlayTone, lcdstring, runled1, runled2, runled3
            xref ledflag1,ledflag2,ledflag3 dino1note, dino2note, dino3note, emergencynote, speaker, loggeduser, keypress
						xref sequence1,sequence2,sequence3, showflag1,showflag2,showflag3
					
variables:  section
dccount:    	ds.w    1
dcflag:				ds.b.   1
ledcnt1: 			ds.w  	1
ledcnt2: 			ds.w  	1
ledcnt3: 			ds.w  	1
paddock1flg:	ds.b		1
paddock2flg:	ds.b		1
paddock3flg:	ds.b		1
stpcnt:     	ds.w    1
stpcnt1:			ds.w		1
stpflg:				ds.b		1
counter:    	ds.w 		1
dino1cnt			ds.w		1
dino2cnt			ds.w		1
dino3cnt			ds.w		1

constants:  section
rtiflg				equ 	$0038


rti_isr: 	 ldaa smflg
						cmpa #1
						bne dc
						
sm:					ldy stpcnt
						ldx stpcnt
sm1:				iny
						sty stpcnt
						tfr y, x
						cpx #1000 ;1 second?
						beq sm2
						ldx #0
						bra sm1
						
sm2:				jsr sturn
						ldx #0
						movw 0, stpcnt
						bra dc1
						
dc1:				ldaa dcflag
						cmpa #1
						bne paddock1
						
						ldy dcount
						ldx dcount
dc2:				iny
						sty dcount
						tfr y, x
						cpx #5000 ;5 seconds?
						beq dc3
						ldx #0
						bra dc2
						
dc3:				jsr dcmotor
						ldx #0
						movw 0, stpcnt
						bra paddock1
						
						
paddock1:		ldy ledcnt1
						ldx ledcnt1
pd1:				iny
						sty ledcnt1
						tfr y, x
						cpx #30000 ;30 seconds?
						beq ledrun1
						ldx #0
						bra pd1
						
ledrun1:		movb 1, ledflag1
						movb 0, showflag1
						jsr ledrun1
						ldx #0
						movw 0, ledcnt1
						ldx sequence1
						cpx #$00
						beq dino1sound
						bra paddock2
						
dino1sound: ldaa dino1note
	 					cmpa #1
						ldaa speakervar
						cmpa #1
						pshx
						pshy
						pshd
						jsr PlayTone
						puld
						puly
						pulx
						ldaa #8
						ldab #0
						jsr strings
						ldd #lcdstring
						jsr displaystring
						ldy dino1cnt
						ldx dino1cnt
repeat1:		iny
						sty dino1cnt
						trf y, x
						cpx #10000 ;10 seconds to decide
						beq sm3
						ldx #0
						jsr Keypad
						jsr waitrelease
						cmpa #15
						bne repeat1
						jsr feed1
						
											
paddock2:		ldy ledcnt2
						ldx ledcnt2
pd2:				iny
						sty ledcnt2
						tfr y, x
						cpx #20000 ;20 seconds?
						beq ledrun2
						ldx #0
						bra pd2
						
ledrun2:		movb 1, ledflag2
						movb 0, showflag2
						jsr ledrun2
						ldx #0
						movw 0, ledcnt2
						ldx sequence2
						cpx #$00
						beq dino2sound
						bra paddock3
						
dino2sound: ldaa dino2note
	 					cmpa #1
						ldaa speakervar
						cmpa #1
						pshx
						pshy
						pshd
						jsr PlayTone
						puld
						puly
						pulx
						ldaa #8
						ldab #0
						jsr strings
						ldd #lcdstring
						jsr displaystring
						ldy dino2cnt
						ldx dino2cnt
repeat2:		iny
						sty dino2cnt
						trf y, x
						cpx #10000 ;10 seconds to decide
						beq sm3
						ldx #0
						jsr Keypad
						jsr waitrelease
						cmpa #15
						bne repeat2
						jsr feed2						
						
paddock3:		ldy ledcnt3
						ldx ledcnt3
pd3:				iny
						sty led3cnt
						tfr y, x
						cpx #15000 ;15 seconds?
						beq ledrun3
						ldx #0
						bra pd3
						
ledrun3:		movb 1, ledflag3
						movb 0, showflag3
						jsr ledrun3
						ldx #0
						movw 0, ledcnt3
						ldx sequence3
						cpx #$00
						beq dino3sound
						bra paddocktwo
						
dino3sound: ldaa dino3note
	 					cmpa #1
						ldaa speakervar
						cmpa #1
						pshx
						pshy
						pshd
						jsr PlayTone
						puld
						puly
						pulx
						ldaa #8
						ldab #0
						jsr strings
						ldd #lcdstring
						jsr displaystring
						ldy dino3cnt
						ldx dino3cnt
repeat3:		iny
						sty dino3cnt
						trf y, x
						cpx #10000 ;10 seconds to decide
						beq sm3
						ldx #0
						jsr Keypad
						jsr waitrelease
						cmpa #15
						bne repeat3
						jsr feed3		
						
												
sm3:				ldy stpcnt1
						ldx stpcnt1
sm4:				iny
						sty	stpcnt1
						tfr y, x
						cpx #100 ;0.1 second?
						beq sm5
						ldx #0
						bra sm4
						
sm5:				jsr sturn
						ldx #0
						movw 0, stpcnt
						bra emergencytimer
						
emergencytimer:	ldy counter
								ldx counter
								iny
								sty counter
								tfr y,x
								cpx #6000 ; 6 seconds to react and press IRQ
								ldaa #7
								jsr strings
								ldd #lcdstring
								jsr displaystring
								jsr Entry ;reset the program
						

						
            
done:       movb   #$80, CRGFLG
            RTI

					
					
					
					