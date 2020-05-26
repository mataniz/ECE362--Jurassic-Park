		 		xdef optionmenu, choice
         xref pot_value,displaypot,read_pot,strings,lcdstring, speaker, dino2note, speakervar, runled2, sequenceflag
         
variable: SECTION
choice:   ds.b    1



constants:  section
table:      dc.b  1         
 
 ;This is the file for the feeding option menu for dinosour 1 that determines which label to branch to in main 
 ;so it calls the correct subroutine
 
 
feed2:	  ldaa  #8
			  ldab  #0
			  jsr   strings
				ldd #ldcstring
				jsr Keypad
				jsr waitrelease
				cmpa #15
				jsr displaypot
			  ldd	pot_value
			  subd 	#85
			  lbeq option1
			  ldd	pot_value
			  subd		#170		
			  lbeq	option2
			  ldd	pot_value
			  subd		#255		
			  lbeq	option3
			  
option1:	ldaa #8
			ldab #1
			jsr strings
			jsr #lcdstring
			jsr Keypad
			jsr waitrelease
			ldaa keypress
			cmpa #15
			beq feeddino1

option2:	ldaa #8
			ldab #2
			jsr strings
			jsr #lcdstring
			jsr Keypad
			jsr waitrelease
			ldaa keypress
			cmpa #15
			movb 1, dinonote
			movb 1, speakervar
			beq feeddino2
			
option3:ldaa #8
			ldab #3
			jsr strings
			jsr #lcdstring
			jsr Keypad
			jsr waitrelease
			ldaa keypress
			cmpa #15
			movb 1, dinonote
			movb 1, speakervar
			beq feeddino3

feeddino2:	movb 0, sequenceflag
						jsr runled2
						jsr paddockTwoMenu

feeddino1: ldaa dino2note
					 cmpa #1
					 ldaa speakervar
					 cmpa #1
					 jsr speaker
					 bra feed2
					 
feeddino3: ldaa dino2note
					 cmpa #1
					 ldaa speakervar
					 cmpa #1
					 jsr speaker
					 bra feed2
				 