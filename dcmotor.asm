        xdef dcmotor,ton,toff,tempoff,tempon,port_tddr,port_t
        xref CRGFLG
        
variables:  section
ton: ds.b  1
toff: ds.b  1
tempoff: ds.b  1
tempon: ds.b  1

constants:  section
port_tddr:  equ  $242
port_t:  		equ  $240 

       
        
;Turns the DC like in the lab, called in RTI

dcmotor:    jsr read_pot
			
						ldx pot_value
			
			  		movb  #15,tempoff
			  		movb  #0,tempon
			  		movb  #15,toff
			  		movb  #0,ton
			  		ldd	pot_value
			  		subd	#16	
			  		lble	condition1
			  		movb  #14,tempoff
			  		movb  #1,tempon
			  		movb  #14,toff
			  		movb  #1,ton
			  		ldd	pot_value
			  		subd	#32	
			  		lble	condition1
			  		movb  #13,tempoff
			  		movb  #2,tempon
			  		movb  #13,toff
			  		movb  #2,ton
			  		ldd	pot_value
			  		subd	#48	
			  		lble	condtion1
			  		movb  #12,tempoff
			  		movb  #3,tempon
			  		movb  #12,toff
			  		movb  #3,ton
			  		ldd	pot_value
			  		subd	#64	
			  		lble	condition1
			  		movb  #11,tempoff
			  		movb  #4,tempon
			  		movb  #11,toff
			  		movb  #4,ton
			  		ldd	pot_value
			  		subd	#80	
			  		lble	condition1
			  		movb  #10,tempoff
			  		movb  #5,tempon
			  		movb  #10,toff
			  		movb  #5,ton
			  		ldd	pot_value
			  		subd	#96	
			  		lble	condtion1
			  		movb  #9,tempoff
			  		movb  #6,tempon
			  		movb  #9,toff
			  		movb  #6,ton
			   	 	ldd	pot_value
			  	 	subd	#112	
			  	 	lble	condtion1
			  	 	movb  #8,tempoff
			  	 	movb  #7,tempon
			  	 	movb  #8,toff
			  	 	movb  #7,ton
			   		ldd	pot_value
			 	 		subd	#128	
			  		lble	condtion1
			  		movb  #7,tempoff
			  		movb  #8,tempon
			  		movb  #7,toff
			  		movb  #8,ton
			  		ldd	pot_value
			  		subd	#144	
			  		lble	condition1
			  		movb  #6,tempoff
			  		movb  #9,tempon
			  		movb  #6,toff
			  		movb  #9,ton
			  	 	ldd	pot_value
			  		subd	#160	
			  		lble	condition1
			  		movb  #5,tempoff
			  		movb  #10,tempon
			  		movb  #5,toff
			  		movb  #10,ton
			   	 	ldd	pot_value
			  	 	subd	#176	
			  		lble	condition1
			  		movb  #4,tempoff
			  		movb  #11,tempon
			  		movb  #4,toff
			  		movb  #11,ton
			   	 ldd	pot_value
			  	 subd	#192	
			  	 lble	condition1
			  	 movb  #3,tempoff
			  	 movb  #12,tempon
			  	 movb  #3,toff
			  	 movb  #12,ton
			   	ldd	pot_value
			  	subd	#208	
			  	lble	condition1
			  	movb  #2,tempoff
			  	movb  #13,tempon
			  	movb  #2,toff
			  	movb  #13,ton
			  	ldd	pot_value
			  	subd	#224	
			  	lble	condition1
	     	  movb  #1,tempoff
			  	movb  #14,tempon
			  	movb  #1,toff
			  	movb  #14,ton
			  	subd	#240	
			  	lble	condition1
		   	  movb  #0,tempoff
			  	movb  #15,tempon
			  	movb  #0,toff
			  	movb  #15,ton	
					

condition1: brset port_t, #$000110011 ;checks to see if switches 0,1,4 & 5 are set & then runs the motor based on value
						beq 	runmotor
						

runmotor:		ldab   ton
            cmpb   #0
            beq    turnoff
            movb   #$08,port_t
            decb   
            stab   ton
            bra    ending
turnoff:    movb   #$00,port_t
            ldab   toff
            cmpb   #0
            beq    restore
            decb   
            stab   toff
ending:     BSET   CRGFLG, #$80
            rts
restore:    BSET   CRGFLG, #$80
            ldab   tempon     
            stab   ton
            ldab   tempoff
            stab   toff  
            rts