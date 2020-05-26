         xdef  checkpass
      xref  keypress, Keypad, strings, loggeduser, display_string, lcdstring, waitrelease


variables:  section
count:      ds.b  1
flag1:      ds.b  1


constants:  section

;Passwords for each user:
pass1:      dc.b        0,2,4,6,8,1,0






checkpass:  pshx
            pshy
            pshd
            
            


;This finds which user is logged in
spot1:      ldaa  #2
            ldab  #0
            jsr   strings
            ldd   #lcdstring
            jsr   display_string
            ldaa  loggeduser
            cmpa  #1
            beq   one

            
            
;This sets index at correct password                    
one:        ldx   #pass1
            bra   spot2


            
;This checks each digit against the password, and sets a flag if they don't match            
spot2:      ldaa  #0
            staa  flag1
            staa  count 
            
spot3:      jsr   Keypad
            jsr   waitrelease
            inc   count
            ldaa  #2
            ldab  count
            jsr   strings
            ldd   #lcdstring
            pshx
            jsr   display_string
            pulx
            ldaa  keypress
            cmpa  0,x
            beq   matches
            cmpa  #15
            beq   enter1
            ldaa  #1         ;sets flag to one if digit doesn't match
            staa  flag1
            inx   
            bra   spot3


;Code for if the digit was a match
matches:    inx
            bra   spot3              
            
          
          
;Code for when enter is pressed            
enter1:   
            puld
            puly
            pulx
            rts




