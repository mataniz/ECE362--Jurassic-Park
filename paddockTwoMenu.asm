		 xdef paddockTwoMenu
         xref pot_value,displaypot,read_pot,strings,optionmenu,feed2,speaker,speakervar,dino2note
				 xref showflag2, ledrun2
         
variable: SECTION


constants:  section
table:      dc.b  1         
 
 ;This is the file for the paddockOne option menu that determines which label to branch to in paddockOne
 ;so it calls the correct subroutine
 
 
paddockTwoMenu:	  
				movb #1, showflag2
				jsr ledrun2
				ldaa  #5
			  ldab  #0
			  jsr   strings
				jsr displaypot
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
			  ldd	pot_value
			  subd		#255		
			  lbeq	option4

			  
			  
option0:	ldaa #5
			ldab #0
			jsr strings
			jsr #lcdstring
			jsr display_string

option1:	ldaa #5
			ldab #1
			stab choice
			jsr  strings
			jsr  #lcdstring
			jsr  display_string
			
			
option2:	ldaa #5
			ldab #2
			jsr strings
			jsr #lcdstring
			jsr display_string
			
option3:	ldaa #5
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
			
option4:	ldaa #5
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
			
			
sound:	ldaa dino2note
				cmpa #1
				ldaa speakervar
				cmpa #1
				jsr speaker
				bra paddockTwoMenu
				
feed: jsr feed2
			bra paddockTwoMenu

return: jsr optionmenu