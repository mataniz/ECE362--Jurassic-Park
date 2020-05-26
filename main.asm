 INCLUDE 'derivative.inc'

; export symbols
            XDEF Entry, _Startup, lcdstring, keypress, loggeduser, PortU, PTP,PortS,mode,emergency,PTT
            XDEF CRGFLG, PTS,

            XREF __SEG_END_SSTACK, init_LCD, read_pot, display_string, pot_value, strings, Keypad
            XREF  checkpass,optionmenu, paddockOneMenu,paddockTwoMenu, paddockThreeMenu,choice, waitrelease,Keypad2 
            XREF port_tddr,ton,toff,tempon,tempoff,port_t,rti_isr, sturn, stpcnt, stpcnt1, smflag, portP, portPddr,
            XREF  ledrun1, ledrun2, ledrun3,SendsChr,PlayTone,speakvar,tablecount,dino1note,dino2note, dino3note, emergencynote, 
            XREF dcount,dcflag,ledcnt1,ledcnt2,ledcnt3,paddock1flg,padddock2flg,paddock3flg
	    			XREF stpcnt,stpcnt1,stpflg,counter,dino1cnt,dino2cnt,dino3cnt
						XREF sequence1,sequence2,sequence3, showflag1,showflag2,showflag3
          

; variable/data section
my_variable: SECTION
lcdstring:	ds.b 33
keypress:   ds.b 1
loggeduser: ds.b 1
usercount:  ds.b  1
mode: ds.b 1
emergency: ds.b 1
switchdif:  ds.b 1

;constants section
my_constants: SECTION
PortU       equ $268
PortU_ddr:  equ $26A
PortU_psr:  equ $26D
PortU_pder: equ $26C
PortSddr:   equ $24a
PortS:      equ $248

; code section
MyCode:     SECTION
Entry:
_Startup:
            
                        
	;All this file really does is just start with the log in, then show the menu display and wait for the user to 
	;press F to select one, then calls the subroutine that corresponds. The labels and subroutine names make it clear
	;what each section of code covers.

            ;Inititalizations:        

            lds #__SEG_END_SSTACK               ;initializet the stack pointer
            jsr init_LCD                        ;initialize LCD
            BSET      PortU_ddr,#$f0            ;Initializes the keypad ports
            BSET      PortU_psr,#$f0
            BSET      PortU_pder,#$0f
            BSET      PortSddr,#$ff             ;Inititalizes the LEDs as output
            BSET      portPddr,#$1e
            movb   #$80,CRGINT                  ;enable real time interrupts
            movb   #$10,RTICTL                  ;get that 1ms delay
            movb  #0,emergency
            movb   #%00101000,port_tddr
            movb   #$08,port_t
            movb  #05,tempon
            movb  #10,tempoff
            movb  #05,ton
            movb  #10,toff
            movb   #0,stpcnt
            movb   #0,stpcnt+1
            movb   #0,stpcnt1
            movb   #0,stpcnt1+1
	    			movb   #0,dccount
            movb   #0,dccount+1
            movb   #0,tablecount
            movb   #0,tablecount+1
            movb   #0,smflag
            movb   #1,speakvar
            movb   #0,dino1note
	    			movb   #0,dino2note
            movb   #0,dino3note
						movb   #0,emergencynote
            movb   #1,PTS

						
						ldaa #0
						jsr strings
						jsr #lcdstring
						jsr display_string
						movb #1, loggeduser
            jsr checkpass ;checkspassword
						movb #0,keypress
						movb #1, smflag
						CLI
						jsr optionmenu