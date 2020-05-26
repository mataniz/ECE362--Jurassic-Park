                XDEF strings
                XREF lcdstring, keypress, dt1, dt2, dt3, dt4


;This file changes the string that is used for display on the lcd. The first value, passed through A, determines which section 
;to branch to, and the second, passed through B determines the subsection. This routine is called in multiple other files.

strings:   cmpa #0
           lbeq  logbasic
           cmpa #1
           lbeq  namelogin
           cmpa #2
           lbeq  passlogin
           cmpa #3
           lbeq  optionbasic
					 cmpa #4
					 lbeq  paddockOne
					 cmpa #5
					 lbeq  paddockTwo
					 cmpa #6
					 lbeq  paddockThree
           cmpa #7
           lbeq  emergence
					 cmpa #8
					 lbeq  feedoptions
					 cmpa #9
					 lbeq  wrongfood
					 cmpa #10
					 lbeq  security
       
                  
           
logbasic:  movb #'u',lcdstring
           movb #'s',lcdstring+1
           movb #'e',lcdstring+2
           movb #'r',lcdstring+3
           movb #'n',lcdstring+4
           movb #'a',lcdstring+5
           movb #'m',lcdstring+6
           movb #'e',lcdstring+7
           movb #':',lcdstring+8
           movb #'R',lcdstring+9
           movb #'A',lcdstring+10
           movb #'N',lcdstring+11
           movb #'G',lcdstring+12
           movb #'E',lcdstring+13
           movb #'R',lcdstring+14
           movb #' ',lcdstring+15
           movb #'p',lcdstring+16
           movb #'a',lcdstring+17
           movb #'s',lcdstring+18
           movb #'s',lcdstring+19
           movb #'w',lcdstring+20
           movb #'o',lcdstring+21
           movb #'r',lcdstring+22
           movb #'d',lcdstring+23
           movb #':',lcdstring+24
           movb #' ',lcdstring+25
           movb #' ',lcdstring+26
           movb #' ',lcdstring+27
           movb #' ',lcdstring+28
           movb #' ',lcdstring+29
           movb #' ',lcdstring+30
           movb #' ',lcdstring+31
           movb #0,lcdstring+32  
           rts
           
 optionbasic: cmpb #0
           		lbeq option0
 				      cmpb #1
           		lbeq option1
           		cmpb #2
           		lbeq  option2
           		cmpb #3
              lbeq  option3
        	    cmpb #4
           	  lbeq  option4
							
 paddockOne: 		cmpb #0
           		lbeq paddockOne0
 				      cmpb #1
           		lbeq paddockOne1
           		cmpb #2
           		lbeq  paddockOne2
           		cmpb #3
              lbeq  paddockOne3
           		cmpb #4
              lbeq  paddockOne4
							

							
 paddockTwo: 		cmpb #0
           		lbeq paddockTwo0
 				      cmpb #1
           		lbeq paddockTwo1
           		cmpb #2
           		lbeq  paddockTwo2
           		cmpb #3
              lbeq  paddockTwo3
           		cmpb #4
              lbeq  paddockTwo4

							
 paddockThree: 		cmpb #0
           		lbeq paddockThree0
 				      cmpb #1
           		lbeq paddockThree1
           		cmpb #2
           		lbeq  paddockThree2
           		cmpb #3
              lbeq  paddockThree3
           		cmpb #4
              lbeq  paddockThree4

							

               
option1:   movb #'P',lcdstring+17
           movb #'a',lcdstring+18
           movb #'d',lcdstring+19
           movb #'d',lcdstring+20
           movb #'o',lcdstring+21
           movb #'c',lcdstring+22
           movb #'k',lcdstring+23
           movb #'1',lcdstring+24
           movb #' ',lcdstring+25
           movb #' ',lcdstring+26
           movb #' ',lcdstring+27
           movb #' ',lcdstring+28
           movb #' ',lcdstring+29
           movb #' ',lcdstring+30
           movb #' ',lcdstring+31
           movb #0,lcdstring+32  
           rts
               
option2:   movb #'P',lcdstring+17
           movb #'a',lcdstring+18
           movb #'d',lcdstring+19
           movb #'d',lcdstring+20
           movb #'o',lcdstring+21
           movb #'c',lcdstring+22
           movb #'k',lcdstring+23
           movb #'2',lcdstring+24
           movb #' ',lcdstring+25
           movb #' ',lcdstring+26
           movb #' ',lcdstring+27
           movb #' ',lcdstring+28
           movb #' ',lcdstring+29
           movb #' ',lcdstring+30
           movb #' ',lcdstring+31
           movb #0,lcdstring+32  
           rts
               
option3:   movb #'P',lcdstring+17
           movb #'a',lcdstring+18
           movb #'d',lcdstring+19
           movb #'d',lcdstring+20
           movb #'a',lcdstring+21
           movb #'o',lcdstring+22
           movb #'c',lcdstring+23
           movb #'k',lcdstring+24
           movb #'3',lcdstring+25
           movb #' ',lcdstring+26
           movb #' ',lcdstring+27
           movb #' ',lcdstring+28
           movb #' ',lcdstring+29
           movb #' ',lcdstring+30
           movb #' ',lcdstring+31
           movb #0,lcdstring+32  
           rts
               
option4:   movb #'R',lcdstring+17
           movb #'e',lcdstring+18
           movb #'t',lcdstring+19
           movb #'u',lcdstring+20
           movb #'r',lcdstring+21
           movb #'n',lcdstring+22
           movb #' ',lcdstring+23
           movb #' ',lcdstring+24
           movb #' ',lcdstring+25
           movb #' ',lcdstring+26
           movb #' ',lcdstring+27
           movb #' ',lcdstring+28
           movb #' ',lcdstring+29
           movb #' ',lcdstring+30
           movb #' ',lcdstring+31
           movb #0,lcdstring+32  
           rts
               

           
emergence: movb #'E',lcdstring
           movb #'M',lcdstring+1
           movb #'E',lcdstring+2
           movb #'R',lcdstring+3
           movb #'G',lcdstring+4
           movb #'E',lcdstring+5
           movb #'N',lcdstring+6
           movb #'C',lcdstring+7
           movb #'Y',lcdstring+8
           movb #'!',lcdstring+9
           movb #' ',lcdstring+10
           movb #'F',lcdstring+11
           movb #'A',lcdstring+12
           movb #'I',lcdstring+13
           movb #'L',lcdstring+14
           movb #'U',lcdstring+15
           movb #'R',lcdstring+16
           movb #'E',lcdstring+17
           movb #'!',lcdstring+18
           movb #' ',lcdstring+19
           movb #' ',lcdstring+20
           movb #' ',lcdstring+21
           movb #' ',lcdstring+22
           movb #' ',lcdstring+23
           movb #' ',lcdstring+24
           movb #' ',lcdstring+25
           movb #' ',lcdstring+26
           movb #' ',lcdstring+27
           movb #' ',lcdstring+28
           movb #' ',lcdstring+29
           movb #' ',lcdstring+30
           movb #' ',lcdstring+31
           movb #0,lcdstring+32  
           rts
paddockOne0:   movb #'N',lcdstring
           		 movb #'A',lcdstring+1
           		 movb #'M',lcdstring+2
           		 movb #'E',lcdstring+3
           		 movb #':',lcdstring+4
           		 movb #' ',lcdstring+5
           		 movb #'D',lcdstring+6
           		 movb #'I',lcdstring+7
           		 movb #'N',lcdstring+8
           		 movb #'O',lcdstring+9
           		 movb #' ',lcdstring+10
           		 movb #' ',lcdstring+11
           		 movb #' ',lcdstring+12
           		 movb #' ',lcdstring+13
           		 movb #' ',lcdstring+14
           		 movb #' ',lcdstring+15
           		 movb #' ',lcdstring+16
           		 movb #' ',lcdstring+17
           		 movb #' ',lcdstring+18
           		 movb #' ',lcdstring+19
           		 movb #' ',lcdstring+20
           		 movb #' ',lcdstring+21
							 rts
							 
paddockOne1:   movb #'T',lcdstring
           		 movb #'Y',lcdstring+1
           		 movb #'P',lcdstring+2
           		 movb #'E',lcdstring+3
           		 movb #':',lcdstring+4
           		 movb #' ',lcdstring+5
           		 movb #'H',lcdstring+6
           		 movb #'E',lcdstring+7
           		 movb #'R',lcdstring+8
           		 movb #'B',lcdstring+9
           		 movb #'I',lcdstring+10
           		 movb #'V',lcdstring+11
           		 movb #'O',lcdstring+12
           		 movb #'R',lcdstring+13
           		 movb #'E',lcdstring+14
           		 movb #' ',lcdstring+15
           		 movb #' ',lcdstring+16
           		 movb #' ',lcdstring+17
           		 movb #' ',lcdstring+18
           		 movb #' ',lcdstring+19
           		 movb #' ',lcdstring+20
           		 movb #' ',lcdstring+21
							 rts
							 
paddockOne2:   movb #'H',lcdstring
           		 movb #'U',lcdstring+1
           		 movb #'N',lcdstring+2
           		 movb #'G',lcdstring+3
           		 movb #'E',lcdstring+4
           		 movb #'R',lcdstring+5
           		 movb #' ',lcdstring+6
           		 movb #'C',lcdstring+7
           		 movb #'A',lcdstring+8
           		 movb #'P',lcdstring+9
           		 movb #'A',lcdstring+10
           		 movb #'C',lcdstring+11
           		 movb #'I',lcdstring+12
           		 movb #'T',lcdstring+13
           		 movb #'Y',lcdstring+14
           		 movb #':',lcdstring+15
           		 movb #' ',lcdstring+16
           		 movb #'4',lcdstring+17
           		 movb #'K',lcdstring+18
           		 movb #'G',lcdstring+19
           		 movb #' ',lcdstring+20
           		 movb #' ',lcdstring+21
							 rts
							 
paddockOne3:   movb #'S',lcdstring
           		 movb #'O',lcdstring+1
           		 movb #'U',lcdstring+2
           		 movb #'N',lcdstring+3
           		 movb #'D',lcdstring+4
           		 movb #' ',lcdstring+5
           		 movb #' ',lcdstring+6
           		 movb #' ',lcdstring+7
           		 movb #' ',lcdstring+8
           		 movb #' ',lcdstring+9
           		 movb #' ',lcdstring+10
           		 movb #' ',lcdstring+11
           		 movb #' ',lcdstring+12
           		 movb #' ',lcdstring+13
           		 movb #' ',lcdstring+14
           		 movb #' ',lcdstring+15
           		 movb #' ',lcdstring+16
           		 movb #' ',lcdstring+17
           		 movb #' ',lcdstring+18
           		 movb #' ',lcdstring+19
           		 movb #' ',lcdstring+20
           		 movb #' ',lcdstring+21
							 rts
							 
paddockOne4:   movb #'F',lcdstring
           		 movb #'E',lcdstring+1
           		 movb #'E',lcdstring+2
           		 movb #'D',lcdstring+3
           		 movb #'?',lcdstring+4
           		 movb #' ',lcdstring+5
           		 movb #' ',lcdstring+6
           		 movb #' ',lcdstring+7
           		 movb #' ',lcdstring+8
           		 movb #' ',lcdstring+9
           		 movb #' ',lcdstring+10
           		 movb #' ',lcdstring+11
           		 movb #' ',lcdstring+12
           		 movb #' ',lcdstring+13
           		 movb #' ',lcdstring+14
           		 movb #' ',lcdstring+15
           		 movb #' ',lcdstring+16
           		 movb #' ',lcdstring+17
           		 movb #' ',lcdstring+18
           		 movb #' ',lcdstring+19
           		 movb #' ',lcdstring+20
           		 movb #' ',lcdstring+21
							 rts
							 
paddockTwo0:   movb #'N',lcdstring
           		 movb #'A',lcdstring+1
           		 movb #'M',lcdstring+2
           		 movb #'E',lcdstring+3
           		 movb #':',lcdstring+4
           		 movb #' ',lcdstring+5
           		 movb #'P',lcdstring+6
           		 movb #'A',lcdstring+7
           		 movb #'T',lcdstring+8
           		 movb #'R',lcdstring+9
           		 movb #'I',lcdstring+10
           		 movb #'C',lcdstring+11
           		 movb #'K',lcdstring+12
           		 movb #' ',lcdstring+13
           		 movb #' ',lcdstring+14
           		 movb #' ',lcdstring+15
           		 movb #' ',lcdstring+16
           		 movb #' ',lcdstring+17
           		 movb #' ',lcdstring+18
           		 movb #' ',lcdstring+19
           		 movb #' ',lcdstring+20
           		 movb #' ',lcdstring+21
							 rts
							 
paddockTwo1:   movb #'T',lcdstring
           		 movb #'Y',lcdstring+1
           		 movb #'P',lcdstring+2
           		 movb #'E',lcdstring+3
           		 movb #':',lcdstring+4
           		 movb #' ',lcdstring+5
           		 movb #'C',lcdstring+6
           		 movb #'A',lcdstring+7
           		 movb #'R',lcdstring+8
           		 movb #'N',lcdstring+9
           		 movb #'I',lcdstring+10
           		 movb #'V',lcdstring+11
           		 movb #'O',lcdstring+12
           		 movb #'R',lcdstring+13
           		 movb #'E',lcdstring+14
           		 movb #' ',lcdstring+15
           		 movb #' ',lcdstring+16
           		 movb #' ',lcdstring+17
           		 movb #' ',lcdstring+18
           		 movb #' ',lcdstring+19
           		 movb #' ',lcdstring+20
           		 movb #' ',lcdstring+21
							 rts
							 
paddockTwo2:   movb #'H',lcdstring
           		 movb #'U',lcdstring+1
           		 movb #'N',lcdstring+2
           		 movb #'G',lcdstring+3
           		 movb #'E',lcdstring+4
           		 movb #'R',lcdstring+5
           		 movb #' ',lcdstring+6
           		 movb #'C',lcdstring+7
           		 movb #'A',lcdstring+8
           		 movb #'P',lcdstring+9
           		 movb #'A',lcdstring+10
           		 movb #'C',lcdstring+11
           		 movb #'I',lcdstring+12
           		 movb #'T',lcdstring+13
           		 movb #'Y',lcdstring+14
           		 movb #':',lcdstring+15
           		 movb #' ',lcdstring+16
           		 movb #'8',lcdstring+17
           		 movb #'K',lcdstring+18
           		 movb #'G',lcdstring+19
           		 movb #' ',lcdstring+20
           		 movb #' ',lcdstring+21
							 rts
							 
paddockTwo3:   movb #'S',lcdstring
           		 movb #'O',lcdstring+1
           		 movb #'U',lcdstring+2
           		 movb #'N',lcdstring+3
           		 movb #'D',lcdstring+4
           		 movb #' ',lcdstring+5
           		 movb #' ',lcdstring+6
           		 movb #' ',lcdstring+7
           		 movb #' ',lcdstring+8
           		 movb #' ',lcdstring+9
           		 movb #' ',lcdstring+10
           		 movb #' ',lcdstring+11
           		 movb #' ',lcdstring+12
           		 movb #' ',lcdstring+13
           		 movb #' ',lcdstring+14
           		 movb #' ',lcdstring+15
           		 movb #' ',lcdstring+16
           		 movb #' ',lcdstring+17
           		 movb #' ',lcdstring+18
           		 movb #' ',lcdstring+19
           		 movb #' ',lcdstring+20
           		 movb #' ',lcdstring+21
							 rts
							 
paddockTwo4:   movb #'F',lcdstring
           		 movb #'E',lcdstring+1
           		 movb #'E',lcdstring+2
           		 movb #'D',lcdstring+3
           		 movb #'?',lcdstring+4
           		 movb #' ',lcdstring+5
           		 movb #' ',lcdstring+6
           		 movb #' ',lcdstring+7
           		 movb #' ',lcdstring+8
           		 movb #' ',lcdstring+9
           		 movb #' ',lcdstring+10
           		 movb #' ',lcdstring+11
           		 movb #' ',lcdstring+12
           		 movb #' ',lcdstring+13
           		 movb #' ',lcdstring+14
           		 movb #' ',lcdstring+15
           		 movb #' ',lcdstring+16
           		 movb #' ',lcdstring+17
           		 movb #' ',lcdstring+18
           		 movb #' ',lcdstring+19
           		 movb #' ',lcdstring+20
           		 movb #' ',lcdstring+21
							 rts
							 
paddockThree0:   movb #'N',lcdstring
           		 movb #'A',lcdstring+1
           		 movb #'M',lcdstring+2
           		 movb #'E',lcdstring+3
           		 movb #':',lcdstring+4
           		 movb #' ',lcdstring+5
           		 movb #'L',lcdstring+6
           		 movb #'I',lcdstring+7
           		 movb #'T',lcdstring+8
           		 movb #'T',lcdstring+9
           		 movb #'L',lcdstring+10
           		 movb #'E',lcdstring+11
           		 movb #' ',lcdstring+12
           		 movb #'F',lcdstring+13
           		 movb #'O',lcdstring+14
           		 movb #'O',lcdstring+15
           		 movb #'T',lcdstring+16
           		 movb #' ',lcdstring+17
           		 movb #' ',lcdstring+18
           		 movb #' ',lcdstring+19
           		 movb #' ',lcdstring+20
           		 movb #' ',lcdstring+21
							 rts
							 
paddockThree1:   movb #'T',lcdstring
           		 movb #'Y',lcdstring+1
           		 movb #'P',lcdstring+2
           		 movb #'E',lcdstring+3
           		 movb #':',lcdstring+4
           		 movb #' ',lcdstring+5
           		 movb #'B',lcdstring+6
           		 movb #'O',lcdstring+7
           		 movb #'T',lcdstring+8
           		 movb #'H',lcdstring+9
           		 movb #' ',lcdstring+10
           		 movb #' ',lcdstring+11
           		 movb #' ',lcdstring+12
           		 movb #' ',lcdstring+13
           		 movb #' ',lcdstring+14
           		 movb #' ',lcdstring+15
           		 movb #' ',lcdstring+16
           		 movb #' ',lcdstring+17
           		 movb #' ',lcdstring+18
           		 movb #' ',lcdstring+19
           		 movb #' ',lcdstring+20
           		 movb #' ',lcdstring+21
							 rts
							 
paddockThree2:   movb #'H',lcdstring
           		 movb #'U',lcdstring+1
           		 movb #'N',lcdstring+2
           		 movb #'G',lcdstring+3
           		 movb #'E',lcdstring+4
           		 movb #'R',lcdstring+5
           		 movb #' ',lcdstring+6
           		 movb #'C',lcdstring+7
           		 movb #'A',lcdstring+8
           		 movb #'P',lcdstring+9
           		 movb #'A',lcdstring+10
           		 movb #'C',lcdstring+11
           		 movb #'I',lcdstring+12
           		 movb #'T',lcdstring+13
           		 movb #'Y',lcdstring+14
           		 movb #':',lcdstring+15
           		 movb #' ',lcdstring+16
           		 movb #'1',lcdstring+17
           		 movb #'6',lcdstring+18
           		 movb #'K',lcdstring+19
           		 movb #'G',lcdstring+20
           		 movb #' ',lcdstring+21
							 rts
							 
paddockThree3:   movb #'S',lcdstring
           		 movb #'O',lcdstring+1
           		 movb #'U',lcdstring+2
           		 movb #'N',lcdstring+3
           		 movb #'D',lcdstring+4
           		 movb #' ',lcdstring+5
           		 movb #' ',lcdstring+6
           		 movb #' ',lcdstring+7
           		 movb #' ',lcdstring+8
           		 movb #' ',lcdstring+9
           		 movb #' ',lcdstring+10
           		 movb #' ',lcdstring+11
           		 movb #' ',lcdstring+12
           		 movb #' ',lcdstring+13
           		 movb #' ',lcdstring+14
           		 movb #' ',lcdstring+15
           		 movb #' ',lcdstring+16
           		 movb #' ',lcdstring+17
           		 movb #' ',lcdstring+18
           		 movb #' ',lcdstring+19
           		 movb #' ',lcdstring+20
           		 movb #' ',lcdstring+21
							 rts
							 
paddockThree4:   movb #'F',lcdstring
           		 movb #'E',lcdstring+1
           		 movb #'E',lcdstring+2
           		 movb #'D',lcdstring+3
           		 movb #'?',lcdstring+4
           		 movb #' ',lcdstring+5
           		 movb #' ',lcdstring+6
           		 movb #' ',lcdstring+7
           		 movb #' ',lcdstring+8
           		 movb #' ',lcdstring+9
           		 movb #' ',lcdstring+10
           		 movb #' ',lcdstring+11
           		 movb #' ',lcdstring+12
           		 movb #' ',lcdstring+13
           		 movb #' ',lcdstring+14
           		 movb #' ',lcdstring+15
           		 movb #' ',lcdstring+16
           		 movb #' ',lcdstring+17
           		 movb #' ',lcdstring+18
           		 movb #' ',lcdstring+19
           		 movb #' ',lcdstring+20
           		 movb #' ',lcdstring+21
							 rts


           


           

           
option0:   movb #'O',lcdstring
           movb #'p',lcdstring+1
           movb #'t',lcdstring+2
           movb #'i',lcdstring+3
           movb #'o',lcdstring+4
           movb #'n',lcdstring+5
           movb #'-',lcdstring+6
           movb #'>',lcdstring+7
           movb #' ',lcdstring+8
           movb #' ',lcdstring+9
           movb #' ',lcdstring+10
           movb #' ',lcdstring+11
           movb #' ',lcdstring+12
           movb #' ',lcdstring+13
           movb #' ',lcdstring+14
           movb #' ',lcdstring+15
           movb #'>',lcdstring+16
           movb #' ',lcdstring+17
           movb #' ',lcdstring+18
           movb #' ',lcdstring+19
           movb #' ',lcdstring+20
           movb #' ',lcdstring+21
           movb #' ',lcdstring+22
           movb #' ',lcdstring+23
           movb #' ',lcdstring+24
           movb #' ',lcdstring+25
           movb #' ',lcdstring+26
           movb #' ',lcdstring+27
           movb #' ',lcdstring+28
           movb #' ',lcdstring+29
           movb #' ',lcdstring+30
           movb #' ',lcdstring+31
           movb #0,lcdstring+32  
           rts
           



           
passlogin: cmpb #0
           lbeq logpass0
           cmpb #1
           lbeq logpass1
           cmpb #2
           lbeq  logpass2
           cmpb #3
           lbeq  logpass3
           cmpb #4
           lbeq  logpass4
           cmpb #5
           lbeq  logpass5
           cmpb #6
           lbeq  logpass6
           cmpb #7
           lbeq  logpass7
           
logpass0:  movb #' ',lcdstring+25
           movb #' ',lcdstring+26
           movb #' ',lcdstring+27
           movb #' ',lcdstring+28
           movb #' ',lcdstring+29
           movb #' ',lcdstring+30
           movb #' ',lcdstring+31
           movb #0,lcdstring+32  
           rts

logpass1:  movb #'*',lcdstring+25
           movb #' ',lcdstring+26
           movb #' ',lcdstring+27
           movb #' ',lcdstring+28
           movb #' ',lcdstring+29
           movb #' ',lcdstring+30
           movb #' ',lcdstring+31
           movb #0,lcdstring+32  
           rts
           
logpass2:  movb #'*',lcdstring+25
           movb #'*',lcdstring+26
           movb #' ',lcdstring+27
           movb #' ',lcdstring+28
           movb #' ',lcdstring+29
           movb #' ',lcdstring+30
           movb #' ',lcdstring+31
           movb #0,lcdstring+32  
           rts

logpass3:  movb #'*',lcdstring+25
           movb #'*',lcdstring+26
           movb #'*',lcdstring+27
           movb #' ',lcdstring+28
           movb #' ',lcdstring+29
           movb #' ',lcdstring+30
           movb #' ',lcdstring+31
           movb #0,lcdstring+32  
           rts

logpass4:  movb #'*',lcdstring+25
           movb #'*',lcdstring+26
           movb #'*',lcdstring+27
           movb #'*',lcdstring+28
           movb #' ',lcdstring+29
           movb #' ',lcdstring+30
           movb #' ',lcdstring+31
           movb #0,lcdstring+32  
           rts

logpass5:  movb #'*',lcdstring+25
           movb #'*',lcdstring+26
           movb #'*',lcdstring+27
           movb #'*',lcdstring+28
           movb #'*',lcdstring+29
           movb #' ',lcdstring+30
           movb #' ',lcdstring+31
           movb #0,lcdstring+32  
           rts
                      
logpass6:  movb #'*',lcdstring+25
           movb #'*',lcdstring+26
           movb #'*',lcdstring+27
           movb #'*',lcdstring+28
           movb #'*',lcdstring+29
           movb #'*',lcdstring+30
           movb #' ',lcdstring+31
           movb #0,lcdstring+32  
           rts

logpass7:  movb #'*',lcdstring+25
           movb #'*',lcdstring+26
           movb #'*',lcdstring+27
           movb #'*',lcdstring+28
           movb #'*',lcdstring+29
           movb #'*',lcdstring+30
           movb #'*',lcdstring+31
           movb #0,lcdstring+32  
           rts    
           
           
feedoptions:	cmpb #0
           		lbeq feed1
 				      cmpb #1
           		lbeq feed2
           		cmpb #2
           		lbeq  feed3
           		cmpb #3
feed0: 				 movb #'F',lcdstring
           		 movb #'E',lcdstring+1
           		 movb #'E',lcdstring+2
           		 movb #'D',lcdstring+3
           		 movb #'?',lcdstring+4
           		 movb #' ',lcdstring+5
           		 movb #' ',lcdstring+6
           		 movb #' ',lcdstring+7
           		 movb #' ',lcdstring+8
           		 movb #' ',lcdstring+9
           		 movb #' ',lcdstring+10
           		 movb #' ',lcdstring+11
           		 movb #' ',lcdstring+12
           		 movb #' ',lcdstring+13
           		 movb #' ',lcdstring+14
           		 movb #' ',lcdstring+15
           		 movb #' ',lcdstring+16
           		 movb #' ',lcdstring+17
           		 movb #' ',lcdstring+18
           		 movb #' ',lcdstring+19
           		 movb #' ',lcdstring+20
           		 movb #' ',lcdstring+21
          		 rts
feed1: 				 movb #'W',lcdstring
           		 movb #'A',lcdstring+1
           		 movb #'T',lcdstring+2
           		 movb #'E',lcdstring+3
           		 movb #'R',lcdstring+4
           		 movb #'M',lcdstring+5
           		 movb #'E',lcdstring+6
           		 movb #'L',lcdstring+7
           		 movb #'O',lcdstring+8
           		 movb #'N',lcdstring+9
           		 movb #' ',lcdstring+10
           		 movb #'D',lcdstring+11
           		 movb #'I',lcdstring+12
           		 movb #'N',lcdstring+13
           		 movb #'O',lcdstring+14
           		 movb #' ',lcdstring+15
           		 movb #' ',lcdstring+16
           		 movb #' ',lcdstring+17
           		 movb #' ',lcdstring+18
           		 movb #' ',lcdstring+19
           		 movb #' ',lcdstring+20
           		 movb #' ',lcdstring+21
          		 rts
feed2: 				 movb #'S',lcdstring
           		 movb #'H',lcdstring+1
           		 movb #'E',lcdstring+2
           		 movb #'E',lcdstring+3
           		 movb #'P',lcdstring+4
           		 movb #' ',lcdstring+5
           		 movb #' ',lcdstring+6
           		 movb #'P',lcdstring+7
           		 movb #'A',lcdstring+8
           		 movb #'T',lcdstring+9
           		 movb #'R',lcdstring+10
           		 movb #'I',lcdstring+11
           		 movb #'C',lcdstring+12
           		 movb #'K',lcdstring+13
           		 movb #' ',lcdstring+14
           		 movb #' ',lcdstring+15
           		 movb #' ',lcdstring+16
           		 movb #' ',lcdstring+17
           		 movb #' ',lcdstring+18
           		 movb #' ',lcdstring+19
           		 movb #' ',lcdstring+20
           		 movb #' ',lcdstring+21
          		 rts
feed3: 				 movb #'B',lcdstring
           		 movb #'O',lcdstring+1
           		 movb #'T',lcdstring+2
           		 movb #'H',lcdstring+3
           		 movb #' ',lcdstring+4
           		 movb #' ',lcdstring+5
           		 movb #'L ',lcdstring+6
           		 movb #'I',lcdstring+7
           		 movb #'T',lcdstring+8
           		 movb #'T',lcdstring+9
           		 movb #'L',lcdstring+10
           		 movb #'E',lcdstring+11
           		 movb #' ',lcdstring+12
           		 movb #'F',lcdstring+13
           		 movb #'O',lcdstring+14
           		 movb #'O',lcdstring+15
           		 movb #'T',lcdstring+16
           		 movb #' ',lcdstring+17
           		 movb #' ',lcdstring+18
           		 movb #' ',lcdstring+19
           		 movb #' ',lcdstring+20
           		 movb #' ',lcdstring+21
          		 rts
							 
							 
wrongfood: 		movb #'W',lcdstring
           		 movb #'R',lcdstring+1
           		 movb #'O',lcdstring+2
           		 movb #'N',lcdstring+3
           		 movb #'G',lcdstring+4
           		 movb #' ',lcdstring+5
           		 movb #'F ',lcdstring+6
           		 movb #'O',lcdstring+7
           		 movb #'O',lcdstring+8
           		 movb #'D',lcdstring+9
           		 movb #' ',lcdstring+10
           		 movb #' ',lcdstring+11
           		 movb #' ',lcdstring+12
           		 movb #' ',lcdstring+13
           		 movb #' ',lcdstring+14
           		 movb #' ',lcdstring+15
           		 movb #' ',lcdstring+16
           		 movb #' ',lcdstring+17
           		 movb #' ',lcdstring+18
           		 movb #' ',lcdstring+19
           		 movb #' ',lcdstring+20
           		 movb #' ',lcdstring+21
          		 rts
							 
							 
security: 		movb #'S',lcdstring
           		 movb #'E',lcdstring+1
           		 movb #'C',lcdstring+2
           		 movb #'U',lcdstring+3
           		 movb #'R',lcdstring+4
           		 movb #'I',lcdstring+5
           		 movb #'T ',lcdstring+6
           		 movb #'Y',lcdstring+7
           		 movb #' ',lcdstring+8
           		 movb #'C',lcdstring+9
           		 movb #'A',lcdstring+10
           		 movb #'L',lcdstring+11
           		 movb #'L',lcdstring+12
           		 movb #'E',lcdstring+13
           		 movb #'D',lcdstring+14
           		 movb #' ',lcdstring+15
           		 movb #' ',lcdstring+16
           		 movb #' ',lcdstring+17
           		 movb #' ',lcdstring+18
           		 movb #' ',lcdstring+19
           		 movb #' ',lcdstring+20
           		 movb #' ',lcdstring+21
          		 rts