                xdef speaker,speakvar,dino1note,dino2note,dino3note,emergencynote
        				xref SendsChr
        
 
variables:  section
speakvar:  		ds.b 1
tablecount:  	ds.w 1
dino1note:   	ds.b 1
dino2note: 		ds.b 1
dino3note:  	ds.b 1
emergencynote: 	ds.b 1
tableholder: 	ds.w 1


constants:  section
A3:    equ   37
B3:    equ   33
C3:    equ   63
D3:    equ   56
E3:    equ   50
F3:    equ   47
G3:    equ   42
A4:    equ   19
B4:    equ   17
C4:    equ   31
D4:    equ   28
E4:    equ   25
F4:    equ   23
G4:    equ   21
Ab3:   equ   39
Bb3:   equ   35
Db3:   equ   59
Eb3:   equ   53
Gb3:   equ   44
Ab4:   equ   20
Bb4:   equ   18
Db4:   equ   30
Eb4:   equ   26
Gb4:   equ   22
A5:    equ   9;D4;9
B5:    equ   8;F4;8
C5:    equ   16;G4;16
D5:    equ   14;G4;14
E5:    equ   12;A5;12
F5:    equ   12;A5;12
G5:    equ   10;A5;10
Ab5:   equ   10;Db4;10
Bb5:   equ   9;Eb4;9
Db5:   equ   15;G5;15
Eb5:   equ   13;G5;13
Gb5:   equ   11;G5;11
PA:    equ   255


;It uses the notes as defined above, and then sends to the C function until done.
;This file includes all of the sounds


dino1:   dc.b Ab4,Ab4,C5,C5,Gb3,Gb3,Ab4,0
                      
dino2:   dc.b  Eb4,Eb4,C4,C4,Eb4,Eb4,B4,B4,B4,0
           
dino3:   dc.b  D4,D4,D4,F4,F4,F4,0

emergencys: dc.b D3,D3,F5,F5,D3,D3,F5,F5,0


speaker: ldaa dino1note
         cmpa #1
         bne  dino2
         ldaa speakvar
         cmpa #0
         beq  loaded
         movb #0,speakvar
         movb #0,tablecount
         movb #0,tablecount+1
         ldy  #dino1   ;load in Data Address
         sty  tableholder
         bra  loaded
         
dino2: ldaa dino2note
       cmpa #1
       bne  dino3
       ldaa speakvar
       cmpa #0
       beq  loaded
       movb #0,speakvar
       movb #0,tablecount 
       movb #0,tablecount+1
       ldy  #dino2   ;load in Data Address
       sty  tableholder
       bra  loaded
			 
dino3: ldaa dino3note
       cmpa #1
       bne  emergencys
       ldaa speakvar
       cmpa #0
       beq  loaded
       movb #0,speakvar
       movb #0,tablecount 
       movb #0,tablecount+1
       ldy  #dino3   ;load in Data Address
       sty  tableholder
       bra  loaded
           
emergencys:ldaa emergencynote
       cmpa #1
       bne  ending
	   ldaa speakvar
       cmpa #0
       beq  loaded
       movb #0,speakvar
       movb #0,tablecount 
       movb #0,tablecount+1
       ldy  #emergencys    ;load in Data Address
       sty  tableholder	



loaded:  ldd  tableholder
         addd tablecount
         tfr  d,y    
         ldd tablecount
         addd #1
         std tablecount
         ldaa y
         cmpa #0
         bne  notend
         movb #1,speakvar
         movb #0,dino1
         movb #0,dino2
				 movb #0,dino3
         
notend:  psha             ;put char on stack
         jsr  SendsChr   ;use CALL command
         pula 
ending:  rts