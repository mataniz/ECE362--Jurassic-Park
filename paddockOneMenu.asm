		 xdef paddockOneMenu
         xref pot_value,displaypot,read_pot,strings,optionmenu,ledrun1,showflag1
         
variable: SECTION


constants:  section
table:      dc.b  1         
 
 ;This is the file for the paddockOne option menu that determines which label to branch to in paddockOne
 ;so it calls the correct subroutine
 
 
paddockOneMenu:
				movb #1, showflag1
				jsr ledrun1
				ldaa  #4
			  ldab  #0
			  jsr   strings
			  ldd	pot_value
			  subd 	#42	
			  lbeq	option0
			  ldd	pot_value
			  subd		#84		
			  lbeq	option1
			  ldd	pot_value
			  subd		#126	
			  lbeq	option2
			  ldd	pot_value
			  subd		#168		
			  lbeq	option3
			  ldd	pot_value
			  subd		#210		
			  lbeq	option4
				ldd pot_value
				subd #255
				lbeq option5

			  
			  
option0:	ldaa #4
			ldab #0
			jsr strings
			jsr #lcdstring
			jsr display_string


option1:	ldaa #4
			ldab #1
			jsr strings
			jsr #lcdstring
			jsr display_string

			
option2:	ldaa #4
			ldab #2
			jsr strings
			jsr #lcdstring
			jsr display_string
			
option3:	ldaa #4
			ldab #3
			jsr strings
			jsr #lcdstring
			jsr display_string
			jsr Keypad
			jsr waitrelease
			ldaa keypress
			cmpa #15
			movb #0, keypress
			beq sound
			
option4:	ldaa #4
			ldab #4
			jsr strings
			jsr #lcdstring
			jsr display_string
			jsr Keypad
			jsr waitrelease
			ldaa keypress
			cmpa #15
			movb #0, keypress
			beq return
			
option5:	ldaa #3
			ldab #4
			jsr strings
			jsr #lcdstring
			jsr display_string
			jsr Keypad
			jsr waitrelease
			ldaa keypress
			cmpa #15
			movb #0, keypress
			beq return
			
sound:	ldaa dino1note
				cmpa #1
				ldaa speakervar
				cmpa #1
				jsr speaker
				bra paddockOneMenu
				
feed: jsr feed1
			bra paddockOneMenu

return: jsr optionmenu