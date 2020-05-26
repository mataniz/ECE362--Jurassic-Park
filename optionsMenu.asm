		 xdef optionmenu, choice
         xref pot_value,displaypot,read_pot,strings, dcflag, dcmotor
         
variable: SECTION
choice:   ds.b    1


constants:  section
table:      dc.b  1         
 
 ;This is the file for the main option menu that determines which label to branch to in main 
 ;so it calls the correct subroutine
 
 
optionmenu:	  ldaa  #3
			  ldab  #0
			  jsr   strings
				jsr   #lcdstring
				jsr display_string
				jsr displaypot
			  ldd	pot_value
			  subd 	#85	
			  lbeq	option1
			  ldd	pot_value
			  subd		#170		
			  lbeq	option2
			  ldd	pot_value
			  subd		#255	
			  lbeq	option3


			  
			  
option1:	ldaa #3
			ldab #1
			jsr strings
			jsr #lcdstring
			jsr display_string
			jsr Keypad
			jsr waitrelease
			ldaa keypress
			cmpa #15
			movb #0, keypress
			beq paddock1

option2:	ldaa #3
			ldab #2
			stab choice
			jsr  strings
			jsr  #lcdstring
			jsr  display_string
			jsr Keypad
			jsr waitrelease
			ldaa keypress
			cmpa #15
			movb #0, keypress
			beq paddock2
			
			
option3:	ldaa #3
			ldab #3
			jsr strings
			jsr #lcdstring
			jsr display_string
			jsr Keypad
			jsr waitrelease
			ldaa keypress
			cmpa #15
			movb #0, keypress
			beq paddock3
			
paddock1: movb #1, dcflag ;starts to rotate dcmotor for 5 seconds 
					jsr paddockOneMenu

paddock2: movb #1, dcflag
					jsr paddockTwoMenu

paddock3: movb #1, dcflag
					jsr paddockThreeMenu
			

