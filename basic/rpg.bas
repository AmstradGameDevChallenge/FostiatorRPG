1 '  
1 ' *FOSTIATOR RPG* DEMO BASIC PROJECT
1 ' by @DefectoDigital
1 ' July-August 2019
1 ' Amstrad GameDev Challenge #TeamBASIC
1 ' Thanks to @FranGallegoBR & @Hec_Linares
1 '


20 SYMBOL AFTER 240
30 SYMBOL 240, &0, &0, &81, &81, &0, &81, &81, &0: ' Ruedas
40 SYMBOL 241, &18, &3C, &42, &7E, &7E, &66, &42, &7E: ' Chasis
50 SYMBOL 242, &0, &0, &3C, &0, &0, &18, &3C, &0: ' Cristales
55 SYMBOL 243, &18, &0, &3C, &0, &0, &18, &0, &0: ' Cristales
70 a1$=CHR$(15)+CHR$(1)
80 a2$=CHR$(15)+CHR$(2)
90 a3$=CHR$(15)+CHR$(3)
95 'cosa$=CHR$(15)+CHR$(4) ' Probando un 4º color
96 izq$=CHR$(8): ' Mover el cursor a la izquierda
97 trans$=CHR$(22)+CHR$(1):
99 enemy$=a2$+CHR$(240)+a3$+izq$+CHR$(241)+a1$+izq$+CHR$(242): '+cosa$+izq$+CHR$(243)

1 ' INITIALIZE
1 ' e  = energy   , a  = attack   , d = defends
1 ' ee = energyen,  ae = attacken, ed = defendsen

100 DEFINT a-z
110 e=99:a=30:d=15:x=5:f=0
120 ee=99:ae=20:ed=10:ex=15:en=0:a$=""
130 DIM em(8):em(0)=-1:em(1)=-1:em(2)=-1:em(3)=-1:em(4)=1:em(5)=1:em(6)=1:em(7)=1
140 DEF FNr(m)=m-3+(RND*6)

1 ' PRESENTATION
200 MODE 1:CLS:BORDER 1:INK 0,1:INK 1,26:INK 2,19:INK 3,6:PAPER 0:PEN 1
210 PRINT" *************************************"
215 PRINT" **********":PEN 2:LOCATE 14,2:PRINT"FOSTIATOR RPG":PEN 1:LOCATE 29,2:PRINT"**********"
220 PRINT" *************************************"
230 PEN 3:PRINT:PRINT"       AMSTRAD GAMEDEV CHALLENGE"
240 PAPER 2:PEN 0:LOCATE 13,6:PRINT"DEFECTO DIGITAL":PEN 1:PAPER 0

1 'GOSUB 10000:
250 RANDOMIZE TIME

1 ' PRINT GAME STATUS
300 WHILE 1:PEN 1
310 LOCATE 2,9:PRINT"PLAYER":PEN 3:LOCATE 10,9:PRINT CHR$(228):PEN 1:LOCATE 11,9:PRINT"["e"] ATTACK"a" DEFENSE"d
320 LOCATE 2,10:PRINT"ENEMY":PEN 3:LOCATE 10,10:PRINT CHR$(228):PEN 1:LOCATE 11,10:PRINT"["ee"] ATTACK"ae" DEFENSE"ed
321 LOCATE 2,12:PAPER 1:PEN 0:PRINT"KEYS:   D: DEFENSE  O: LEFT  P: RIGHT":PAPER 0:PEN 1
330 LOCATE x,18:PRINT" "CHR$(248)" "
340 LOCATE ex,18:PRINT" "trans$;enemy$;CHR$(22)+CHR$(0)" ": 'CHR$(225)
350 PEN 2:PAPER 3:LOCATE 2,19:PRINT STRING$(38,127):PAPER 0:PEN 3:LOCATE 2,20:PRINT STRING$(38,127):PEN 1

1 ' PLAYER ACTIONS
400 a$=INKEY$:IF a$="" THEN GOTO 400
405 GOSUB 10200
410 IF a$="O" OR a$="o" THEN GOSUB 1000:GOTO 500
420 IF a$="P" OR a$="p" THEN GOSUB 1100:GOTO 500
430 IF a$="D" OR a$="d" THEN GOSUB 1400:GOTO 500
450 GOTO 400

1 ' ENEMY ACTIONS: ATTACKS or MOVES
500 IF ex=x+2 THEN GOSUB 1200 ELSE GOSUB 1300

1 ' END GAME
850 IF e <=0 THEN LOCATE 15,15:PAPER 3:PRINT"ENEMY  WINS!":CALL &BB18:PAPER 0:RUN
860 IF ee<=0 THEN LOCATE 15,15:PAPER 2:PRINT"PLAYER WINS!":CALL &BB18:PAPER 0:RUN

900 WEND


1 ' MOVE PLAYER LEFT
1000 x=x-1: IF x=0 THEN x=1
1010 RETURN

1 ' MOVE PLAYER RIGHT
1100 LOCATE 6,23:PRINT"                             "
1110 x=x+1: IF x=ex-1 THEN x=x-1:f=FNr(a):ee=ee-f:LOCATE 6,23:PEN 2:PRINT"PLAYER ATTACKS WITH FORCE:"f:PEN 1
1120 RETURN

1 ' 17 18 19 20 21 22 23

1 ' ENEMY ATTACKS
1200 LOCATE 6,22:PRINT"                             "
1210 f=FNr(ae):e=e-f:LOCATE 6,22:PEN 3:PRINT"ENEMY  ATTACKS WITH FORCE:"f:PEN 1
1220 RETURN

1 ' ENEMY MOVES
1300 ex=ex+em(en):en=en+1:IF en=8 THEN en=0
1310 RETURN


1 ' PLAYER DEFENDS
1400 LOCATE 6,24:PRINT"                             "
1410 f=FNr(d):e=e+f:IF e<=99 THEN LOCATE 6,24:PEN 2:PRINT"PLAYER RELOADS:"f:PAPER 0 ELSE e=99:LOCATE 6,24:PEN 2:PRINT"ENERGY FULL!":PEN 1
1420 RETURN

1 ' PRESS ENTER TO CONTINUE
10000 PRINT"         PRESS KEY TO CONTINUE":PRINT
10010 a$=INKEY$:IF a$="" THEN GOTO 10010
10020 RETURN

1 ' DELETE MESSAGES
10200 LOCATE 1,22:PRINT"                                       "
10210 LOCATE 1,23:PRINT"                                       "
10220 LOCATE 1,24:PRINT"                                       "
10230 RETURN


1


