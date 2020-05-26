                 xdef   irq                                                                                                         
                 xref  PlayTone,emergencynote,speakervar,port_t,port_tddr,runledemergency,sequenceflag,showflag
								 xref  checkpass, keypress
constants:  section
sequence:       dc.b    $FF, $00							 
								 
irq: movb #0, keypress
		 jsr checkpass
		 brset port_t, #$10000000 ;checks if switch 8 is on for alarm
		 beq alarm
		 
alarm: ldaa emergencynote
			 cmpa #1
			 ldaa speakervar
			 cmpa #1
			 pshx
			 pshy
			 pshd
			 jsr PlayTone
			 movb #$FF, PTS
			 movb #$00, PTS
		 	 puld
			 puly
			 pulx
			 ldaa #10
			 jsr strings
			 ldd #lcdstring
			 jsr displaystring
			 jsr optionmenu
		 