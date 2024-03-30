; Copyright Firebird 1984, 2024 ArcadeGeek LTD.
; NOTE: Disassembly is Work-In-Progress.
; Label naming is loosely based on Action_ActionName_SubAction e.g. Print_HighScore_Loop.

> $4000 @rom
> $4000 @start
> $4000 @expand=#DEF(#POKE #LINK:Pokes)
> $4000 @expand=#DEF(#ANIMATE(delay,count=$50)(name=$a)*$name-1,$delay;#FOR$02,$count||x|$name-x|;||($name-animation))
> $4000 @set-handle-unsupported-macros=1
b $4000 Loading Screen
D $4000 #UDGTABLE { =h Booty Loading Screen. } { #SCR$02(loading) } UDGTABLE#
@ $4000 label=Loading
  $4000,$1800,$20 Pixels.
  $5800,$0300,$20 Attributes.

b $5B00

g $5B3F
W $5B3F,$02

b $5B41

g $5BCC

g $5BD0 Current Room Paper Colour
@ $5BD0 label=CurrentRoom_PaperColour
B $5BD0,$01

g $5BD1

g $5BD3

g $5BDA
W $5BDA,$02

g $5BDC
W $5BDC,$02

g $5BDE Pirate Reference
@ $5BDE label=PirateReference
W $5BDE,$02 Reference to Pirate data.

g $5BE0

g $5BE7 Pirate Attribute
@ $5BE7 label=PirateAttribute
B $5BE7,$01 Pirate INK colour.

g $5BEA Control Method
@ $5BEA label=ControlMethod
D $5BEA #TABLE(default,centre,centre)
. { =h Byte | =h Control Method }
. { #N$0C | Kempston Joystick }
. { #N$14 | Cursor Joystick }
. { #N$1C | Interface 2 Joystick }
. { #N$24 | Keyboard }
. TABLE#
B $5BEA,$01

g $5BEB User-Defined Keys
@ $5BEB label=UserDefinedKeys_Left
B $5BEB,$01
@ $5BEC label=UserDefinedKeys_Right
B $5BEC,$01
@ $5BED label=UserDefinedKeys_Up
B $5BED,$01
@ $5BEE label=UserDefinedKeys_Down
B $5BEE,$01
@ $5BEF label=UserDefinedKeys_Fire
B $5BEF,$01

g $5BF0

g $5BF1 Player Lives
@ $5BF1 label=PlayerLives
B $5BF1,$01

g $5BF2 Player Treasure
@ $5BF2 label=PlayerTreasure
B $5BF2,$02

g $5BF4 Player Booty
@ $5BF4 label=PlayerBooty
B $5BF4,$02

t $5DDF Messaging: Booty
@ $5DDF label=Messaging_Booty
  $5DDF,$0A "#STR(#PC,$04,$0A)".

b $5DE9

> $6940 @org
c $6940 Game Entry Point
  $6940,$01 Disable interrupts.
  $6941,$04 #REGde=*#R$5B3F.
  $6945,$02 Jump to #R$6957.

b $6947

c $6957
  $6957,$03 #REGhl=#N$5B01.
  $695A,$03 #REGbc=#N($003E,$04,$04).
  $695D,$02 Copy #REGhl to #REGde #N($003E,$04,$04) times.
  $695F,$01 Switch to the shadow registers.
  $6960,$03 #REGhl'=#N$2758.
  $6963,$01 Switch back to the normal registers.
  $6964,$01 Enable interrupts.
  $6965,$01 Restore #REGde from the stack.
  $6966,$01 Return.

b $6967

b $6978 Introduction Screen
@ $6978 label=IntroductionScreen
D $6978 #PUSHS #SIM(start=$CD9D,stop=$CDA8)
. #UDGTABLE { =h Booty Introduction Screen. }
. { #SCR$02(introduction-screen) }
. UDGTABLE#
. #POPS
  $6978,$1800,$20 Pixels.
  $8178,$0300,$20 Attributes.

b $8478

b $8F28 UDG Data: Pirates
@ $8F28 label=UDG_Pirates
  $8F28,$08 #UDGTABLE { #UDG(#PC) } UDGTABLE#
L $8F28,$08,$10

b $924C
  $924C,$08 #UDGTABLE { #UDG(#PC) } UDGTABLE#
L $924C,$08,$40

b $944C
  $944C,$08 #UDGTABLE { #UDG(#PC) } UDGTABLE#
L $944C,$08,$30

b $95CC
  $95CC,$08 #UDGTABLE { #UDG(#PC) } UDGTABLE#
L $95CC,$08,$10

b $964C Graphics: Sand (Goldfish Game)
@ $964C label=Graphics_GoldfishGameSand
D $964C See #R$CEE6.
. #UDGTABLE { #UDGS$20,$01,$04(sand)(#UDG($964C+($08*($x%$10)),attr=$0E)(*sand)sand) } UDGTABLE#
. It's actually chosen randomly in the game (the image here is simply sequential for an example).
  $964C,$08 #UDGTABLE { #UDG(#PC,attr=$0E) } UDGTABLE#
L $964C,$08,$10

b $96CC Graphics: Dolphin (Goldfish Game)
@ $96CC label=Graphics_GoldfishGameDolphin
E $96CC #UDGTABLE { #UDGARRAY#(#ANIMATE$0F,$03(dolphin)) } UDGTABLE#
  $96CC,$40,$08 #LET(filename=#EVAL(#PC-$96CC)/$40) #UDGTABLE { #UDGS$04,$02,$04(#FORMAT(dolphin-{filename}*))(#UDG(#PC+$08*($04*$y+$x),attr=$0D)(*dolphin)dolphin) } UDGTABLE#
L $96CC,$40,$04

b $97CC Graphics: Sea Snake (Goldfish Game)
@ $97CC label=Graphics_GoldfishGameSeaSnake
E $97CC #UDGTABLE { #UDGARRAY#(#ANIMATE$0F,$03(sea-snake)) } UDGTABLE#
  $97CC,$30,$08 #LET(filename=#EVAL(#PC-$97CC)/$30) #UDGTABLE { #UDGS$03,$02,$04(#FORMAT(sea-snake-{filename}*))(#UDG(#PC+$08*($03*$y+$x),attr=$0A)(*sea-snake)sea-snake) } UDGTABLE#
L $97CC,$30,$04,$02

b $988C Graphics: Marlin (Goldfish Game)
@ $988C label=Graphics_GoldfishGameMarlin
E $988C #UDGTABLE { #UDGARRAY#(#ANIMATE$0F,$03(marlin)) } UDGTABLE#
  $988C,$30,$08 #LET(filename=#EVAL(#PC-$988C)/$30) #UDGTABLE { #UDGS$03,$02,$04(#FORMAT(marlin-{filename}*))(#UDG(#PC+$08*($03*$y+$x),attr=$0B)(*marlin)marlin) } UDGTABLE#
L $988C,$30,$04,$02

b $994C Graphics: Squid (Goldfish Game)
@ $994C label=Graphics_GoldfishGameSquid
E $994C #UDGTABLE { #UDGARRAY#(#ANIMATE$0F,$03(squid)) } UDGTABLE#
  $994C,$20,$08 #LET(filename=#EVAL(#PC-$994C)/$20) #UDGTABLE { #UDGS$02,$02,$04(#FORMAT(squid-{filename}*))(#UDG(#PC+$08*($02*$y+$x),attr=$0C)(*squid)squid) } UDGTABLE#
L $994C,$20,$04,$02

b $99CC Graphics: Goldfish (Goldfish Game)
@ $99CC label=Graphics_GoldfishGameFish
E $99CC #UDGTABLE { #UDGARRAY#(#ANIMATE$0F,$03(goldfish)) } UDGTABLE#
  $99CC,$08 #LET(filename=#EVAL(#PC-$99CC)/$08) #UDGTABLE { #UDG(#PC,attr=$0E)(#FORMAT(goldfish-{filename}*)) } UDGTABLE#
L $99CC,$08,$04,$02

b $99EC Graphics: Boat 1 (Goldfish Game)
@ $99EC label=Graphics_GoldfishGameBoat1
D $99EC See #R$D870.
. #UDGTABLE { #UDGS$0C,$08,$04(boat-01)(#UDG($99EC+$08*($0C*$y+$x))(*boat)boat) } UDGTABLE#
  $99EC,$08 #UDGTABLE { #UDG(#PC) } UDGTABLE#
L $99EC,$08,$60

b $9CEC Graphics: Boat 2 (Goldfish Game)
@ $9CEC label=Graphics_GoldfishGameBoat2
D $9CEC See #R$D870.
. #UDGTABLE { #UDGS$0C,$08,$04(boat-02)(#UDG($9CEC+$08*($0C*$y+$x))(*boat)boat) } UDGTABLE#
  $9CEC,$08 #UDGTABLE { #UDG(#PC) } UDGTABLE#
L $9CEC,$08,$60

b $9FEC Graphics: Player Sprite (Goldfish Game)
@ $9FEC label=Graphics_GoldfishGamePlayer
D $9FEC See #R$D4CC.
E $9FEC #UDGTABLE { #UDGARRAY#(#ANIMATE$0F,$07(swimmer)) } UDGTABLE#
  $9FEC,$10 #LET(filename=#EVAL(#PC-$9FEC)/$10) #UDGTABLE { #UDGS$02,$01,$04(#FORMAT(swimmer-{filename}*))(#UDG(#PC+$08*$x,attr=$0F)(*swimmer)swimmer) } UDGTABLE#
L $9FEC,$10,$08

b $A06C
  $A06C,$08 #UDGTABLE { #UDG(#PC) } UDGTABLE#
L $A06C,$08,$10

b $A10B

u $A16C Source Code Remnants
T $A16C,$03 #STR(#PC,$04,$03)
B $A16F,$01
T $A170,$0C #STR(#PC,$04,$0C)
B $A17C,$01
T $A17D,$04 #STR(#PC,$04,$04)
B $A181,$01
T $A182,$09 #STR(#PC,$04,$09)
B $A18B,$01
T $A18C,$05 #STR(#PC,$04,$05)
B $A191,$01
T $A192,$05 #STR(#PC,$04,$05)
B $A197,$01
T $A198,$0A #STR(#PC,$04,$0A)
B $A1A2,$01
T $A1A3,$06 #STR(#PC,$04,$06)
B $A1A9,$01
T $A1AA,$06 #STR(#PC,$04,$06)
B $A1B0,$01
T $A1B1,$03 #STR(#PC,$04,$03)
B $A1B4,$01
T $A1B5,$04 #STR(#PC,$04,$04)
B $A1B9,$01
T $A1BA,$07 #STR(#PC,$04,$07)
B $A1C1,$01
T $A1C2,$02 #STR(#PC,$04,$02)

b $A1C4

c $A804

g $BB2D Pirate 1 Data
@ $BB2D label=Data_Pirate1
B $BB2D,$01 State?
B $BB2E,$01 Y co-ordinate.
B $BB2F,$01 Y co-ordinate.
B $BB30,$01
B $BB31,$01 Moving in direction #TABLE (default,centre,centre) { =h Byte | =h Direction } { #N$01 | Left } { #N$FF | Right } TABLE#
B $BB32,$01
B $BB33,$01
B $BB34,$01 Width.
B $BB35,$01 Height.
B $BB36,$01 Colour.

g $BB4E Pirate 2 Data
@ $BB4E label=Data_Pirate2
B $BB4E,$01 State?
B $BB4F,$01 Y co-ordinate.
B $BB50,$01 Y co-ordinate.
B $BB51,$01
B $BB52,$01 Moving in direction #TABLE (default,centre,centre) { =h Byte | =h Direction } { #N$01 | Left } { #N$FF | Right } TABLE#
B $BB53,$01
B $BB54,$01
B $BB55,$01 Width.
B $BB56,$01 Height.
B $BB57,$01 Colour.

g $BB80 Pirate 3 Data
@ $BB80 label=Data_Pirate3
B $BB80,$01 State?
B $BB81,$01 Y co-ordinate.
B $BB82,$01 Y co-ordinate.
B $BB83,$01
B $BB84,$01 Moving in direction #TABLE (default,centre,centre) { =h Byte | =h Direction } { #N$01 | Left } { #N$FF | Right } TABLE#
B $BB85,$01
B $BB86,$01
B $BB87,$01 Width.
B $BB88,$01 Height.
B $BB89,$01 Colour.

b $BF10

u $CB95 Source Code Remnants
T $CB95,$09 #STR(#PC,$04,$09)
B $CB9E,$01
T $CB9F,$05 #STR(#PC,$04,$05)
B $CBA4,$01
T $CBA5,$07 #STR(#PC,$04,$07)
B $CBAC,$01
T $CBAD,$04 #STR(#PC,$04,$04)
B $CBB1,$01
T $CBB2,$0C #STR(#PC,$04,$0C)
B $CBBE,$01
T $CBBF,$0B #STR(#PC,$04,$0B)
B $CBCA,$01
T $CBCB,$0B #STR(#PC,$04,$0B)
B $CBBE,$01
T $CBBF,$0B #STR(#PC,$04,$0B)
B $CBCA,$01
T $CBCB,$0B #STR(#PC,$04,$0B)
B $CBD6,$01
T $CBD7,$0B #STR(#PC,$04,$0B)
B $CBE2,$01
T $CBE3,$0B #STR(#PC,$04,$0B)
B $CBEE,$01
T $CBEF,$08 #STR(#PC,$04,$08)
B $CBF7,$01
T $CBF8,$05 #STR(#PC,$04,$05)
B $CBFD,$01
T $CBFE,$09 #STR(#PC,$04,$09)
B $CC07,$01
T $CC08,$0B #STR(#PC,$04,$0B)
B $CC13,$01
T $CC14,$0C #STR(#PC,$04,$0C)
B $CC20,$01
T $CC21,$0B #STR(#PC,$04,$0B)
B $CC2C,$01
T $CC2D,$0C #STR(#PC,$04,$0C)
B $CC39,$01
T $CC3A,$0B #STR(#PC,$04,$0B)
B $CC45,$01
T $CC46,$0C #STR(#PC,$04,$0C)
B $CC52,$01
T $CC53,$0B #STR(#PC,$04,$0B)
B $CC5E,$01
T $CC5F,$0C #STR(#PC,$04,$0C)
B $CC6B,$01
T $CC6C,$11 #STR(#PC,$04,$11)
B $CC7D,$01
T $CC7E,$0B #STR(#PC,$04,$0B)
B $CC89,$01
T $CC8A,$05 #STR(#PC,$04,$05)
B $CC8F,$01
T $CC90,$05 #STR(#PC,$04,$05)
B $CC95,$01
T $CC96,$05 #STR(#PC,$04,$05)
B $CC9B,$01
T $CC9C,$0B #STR(#PC,$04,$0B)
B $CCA7,$01
T $CCA8,$07 #STR(#PC,$04,$07)
B $CCAF,$01
T $CCB0,$06 #STR(#PC,$04,$06)
B $CCB6,$01
T $CCB7,$0E #STR(#PC,$04,$0E)
B $CCC5,$01
T $CCC6,$06 #STR(#PC,$04,$06)
B $CCCC,$01
T $CCCD,$0C #STR(#PC,$04,$0C)
B $CCD9,$01
T $CCDA,$05 #STR(#PC,$04,$05)
B $CCDF,$01
T $CCE0,$05 #STR(#PC,$04,$05)
B $CCE5,$01
T $CCE6,$05 #STR(#PC,$04,$05)
B $CCEB,$01
T $CCEC,$07 #STR(#PC,$04,$07)
B $CCF3,$01
T $CCF4,$07 #STR(#PC,$04,$07)
B $CCFB,$01
T $CCFC,$05 #STR(#PC,$04,$05)
B $CD01,$01
T $CD02,$05 #STR(#PC,$04,$05)
B $CD07,$01
T $CD08,$08 #STR(#PC,$04,$08)
B $CD10,$01
T $CD11,$03 #STR(#PC,$04,$03)

b $CD14

c $CD50
  $CD50,$01 #REGhl+=#REGhl.
  $CD51,$01 Decrease #REGc by one.
  $CD52,$03 Write #REGa to *#R$FFF8.
  $CD55,$01 Enable interrupts.
  $CD56,$03 #REGhl=#R$A06C.
  $CD59,$02 #REGb=#N$80.
  $CD5B,$02 Write #N$00 to *#REGhl.
  $CD5D,$01 Increment #REGhl by one.
  $CD5E,$02 Decrease counter by one and loop back to #R$CD5C until counter is zero.
  $CD60,$01 Switch to the shadow registers.
  $CD61,$01 Stash #REGhl' on the stack.
  $CD62,$01 Switch back to the normal registers.
  $CD63,$04 #HTML(Write #N$00 to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C6B.html">DF_SZ</a>.)
  $CD67,$02 #REGa=#N$02.
  $CD69,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/1601.html">CHAN_OPEN</a>.)
  $CD6C,$03 Jump to #R$CD86.

c $CD6F Set Default Keyboard Inputs
@ $CD6F label=SetDefaultKeyboardInputs
N $CD6F See #R$D22C for the corresponding keymap table.
  $CD6F,$05 Write "5" (#N$04) to *#R$5BEB.
  $CD74,$03 Write "8" (#N$13) to *#R$5BEC.
  $CD77,$03 Write "7" (#N$0B) to *#R$5BED.
  $CD7A,$03 Write "6" (#N$03) to *#R$5BEE.
  $CD7D,$03 Write "A" (#N$26) to *#R$5BEF.
  $CD80,$05 Write Keyboard Input (#N$24) to *#R$5BEA.
  $CD85,$01 Return.

c $CD86 Display Introduction Screen
@ $CD86 label=DisplayIntroductionScreen
N $CD86 #PUSHS #UDGTABLE {
.   #SIM(start=$CD93,stop=$CDA8)
.   #FOR$01,$08||x|#SIM(start=$D0AC,stop=$D0D3)
.     #SCR$02(*title-screen-x)#PLOT(0,0,0)(title-screen-x)
.   ||
.   #UDGARRAY#(#ANIMATE$0F,$08(title-screen))
. } UDGTABLE# #POPS
E $CD86 Continue on to #R$CDD1.
  $CD86,$05 Write #N$04 to *#R$5BF1.
  $CD8B,$08 Call #R$CD6F if no control method has been set yet (as-in, game has just been loaded").
  $CD93,$05 #HTML(Set the border to MAGENTA using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/2294.html#229b">BORDER</a>.)
  $CD98,$05 Write MAGENTA to *#R$5BD0.
  $CD9D,$03 #REGde=#R$4000(#N$4000).
  $CDA0,$03 #REGbc=#N$1B00.
  $CDA3,$03 #REGhl=#R$6978.
  $CDA6,$02 Copy the introduction screen to the screen buffer.
N $CDA8 #HTML(Use <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/5C78.html">FRAMES</a> as a counter.)
  $CDA8,$07 #HTML(Reset *<a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/5C78.html">FRAMES</a> to #N($0000,$04,$04).)
@ $CDAF label=IntroductionScreen_Loop
  $CDAF,$04 #HTML(#REGbc=*<a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/5C78.html">FRAMES</a>.)
  $CDB3,$06 Call #R$D602 if #REGb is equal to #N$04.
  $CDB9,$03 Call #R$D0AC.
N $CDBC Don't bother checking the Kempston joystick port if we don't have to.
  $CDBC,$07 Skip down to #R$CDC9 if *#R$5BEA is not set to Kempston joystick (#N$0C).
N $CDC3 Handle checking input from the Kempston joystick.
  $CDC3,$02 Read from the Kempston joystick port.
  $CDC5,$04 Jump to #R$CDD1 if fire has been pressed.
N $CDC9 Even if the Kempston joystick is selected, we still check the keyboard here.
@ $CDC9 label=IntroductionScreen_KeyboardCheck
  $CDC9,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/028E.html">KEY_SCAN</a>.)
  $CDCC,$05 Loop back round to #R$CDAF if no keys have been pressed (#REGe is equal to #N$FF).

c $CDD1 Display Title Screen
@ $CDD1 label=TitleScreen
N $CDD1 #PUSHS #UDGTABLE { #SIM(start=$CDD1,stop=$CE1E)#SCR$02(title-screen) } UDGTABLE# #POPS
  $CDD1,$05 #HTML(Write #COLOUR$00 (#N$00) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C8D.html">ATTR_P</a>.)
  $CDD6,$03 Call #R$D4BE.
  $CDD9,$05 #HTML(Set the border to BLACK using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/2294.html#229b">BORDER</a>.)
  $CDDE,$05 Write #COLOUR$00 (#N$00) to *#R$5BD0.
  $CDE3,$03 #REGde=#R$D9FD.
  $CDE6,$03 Call #R$D60E.
  $CDE9,$08 Call #R$D259 if *#R$5BEA is set to Keyboard Input (#N$24).
  $CDF1,$03 Call #R$D60E with #R$DA3A.
  $CDF4,$08 Call #R$D259 if *#R$5BEA is set to Interface 2 joystick (#N$1C).
  $CDFC,$03 Call #R$D60E with #R$DA50.
  $CDFF,$08 Call #R$D259 if *#R$5BEA is set to Cursor joystick (#N$14).
  $CE07,$03 Call #R$D60E with #R$DA6E.
  $CE0A,$08 Call #R$D259 if *#R$5BEA is set to Kempston joystick (#N$0C).
  $CE12,$03 Call #R$D60E with #R$DA87.
  $CE15,$03 #REGa=*#R$5BEA (unused, #REGa is overwritten immediately by #R$D60E on the next line).
  $CE18,$03 Call #R$D60E with #R$DAA2.
  $CE1B,$03 Call #R$D60E with #R$DAB7.
N $CE1E Keep looping until we get user input.
@ $CE1E label=TitleScreen_InputLoop
  $CE1E,$03 Call #R$D5CF.
  $CE21,$05 Jump to #R$D253 if #REGa is set to Keyboard input (#N$24).
  $CE26,$05 Jump to #R$D10C if #REGa is set to Interface 2 joystick (#N$1C).
  $CE2B,$05 Jump to #R$D0D4 if #REGa is set to Cursor joystick (#N$14).
  $CE30,$05 Jump to #R$D0E2 if #REGa is set to Kempston joystick (#N$0C).
  $CE35,$05 Jump to #R$D188 if #REGa is set to User-Defined key input (#N$04).
  $CE3A,$04 Jump to #R$CE1E if #REGa is NOT set to start the game (#N$23).
N $CE3E Else, the player has selected "0" to start the game.
  $CE3E,$03 Jump to #R$D08A.

c $CE41 Hidden Goldfish Game
@ $CE41 label=GoldfishGame
D $CE41 See #POKE#goldfishGameAccess(Access Hidden Game).
N $CE41 #PUSHS #UDGTABLE {
.   #SIM(start=$CD63,stop=$CD6C)#SIM(start=$CE61,stop=$CF21)
.   #FOR$01,$50(x,#SIM(start=$CF44,stop=$CF4E)#SIM(start=$CF73,stop=$CF76)
.     #SCR$02(*goldfish-gameplay-x)#PLOT(0,0,0)(goldfish-gameplay-x)
.   )
.   #UDGARRAY#(#ANIMATE$0F(goldfish-gameplay))
. } UDGTABLE# #POPS
  $CE41,$03 Call #R$D4BE.
N $CE44 Print up the playing instructions.
N $CE44 #PUSHS #UDGTABLE
. { #SIM(start=$CDD1,stop=$CE1E)#SIM(start=$CE41,stop=$CE4A)#SCR$02(goldfish-game-instructions) }
. UDGTABLE# #POPS
  $CE44,$03 #REGde=#R$DD9A.
  $CE47,$03 Call #R$D60E.
N $CE4A Pause to let the message sink in...
  $CE4A,$03 #REGbc=#N$012C (pause loops).
@ $CE4D label=GoldfishGame_PauseLoop
  $CE4D,$01 Stash the pause loop counter on the stack.
  $CE4E,$03 Call #R$D3A6.
  $CE51,$01 Restore the pause loop counter from the stack.
  $CE52,$01 Decrease the pause loop counter by one.
  $CE53,$04 Jump to #R$CE4D until the pause loop counter is zero.
N $CE57 Initialise the number of goldfish needed to complete this mini-game.
N $CE57 See #POKE#goldfishGameNumberOfFish(Fish To Be Caught (Hidden Game)).
  $CE57,$05 Write #N$14 to *#R$DB44.
  $CE5C,$05 #HTML(Set the border to CYAN using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/2294.html#229b">BORDER</a>.)
  $CE61,$05 Write CYAN (#N$05) to *#R$5BD0.
  $CE66,$05 #HTML(Write #COLOUR$38 (#N$38) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C8D.html">ATTR_P</a>.)
  $CE6B,$03 Call #R$D4BE.
N $CE6E Start colouring the game playarea.
N $CE6E This is colourised in bands. First, #N$10 blue lines (from the bottom).
N $CE6E #PUSHS #UDGTABLE
. { #SIM(start=$CD63,stop=$CD6C)#SIM(start=$CE61,stop=$CE78)#SCR$02(goldfish-game-01) }
. UDGTABLE# #POPS
  $CE6E,$02 #REGb=#N$10.
  $CE70,$05 #HTML(Write #COLOUR$08 (#N$08) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C8D.html">ATTR_P</a>.)
  $CE75,$03 #HTML(Clear the bottom #N$10 lines using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0E44.html">CL_LINE</a>.)
N $CE78 Next, #N$08 yellow lines (again, from the bottom).
N $CE78 #PUSHS #UDGTABLE
. { #SIM(start=$CD63,stop=$CD6C)#SIM(start=$CE61,stop=$CE82)#SCR$02(goldfish-game-02) }
. UDGTABLE# #POPS
  $CE78,$05 #HTML(Write #COLOUR$30 (#N$30) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C8D.html">ATTR_P</a>.)
  $CE7D,$05 #HTML(Clear the bottom #N$08 lines using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0E44.html">CL_LINE</a>.)
N $CE82 Finally, #N$02 cyan lines (again, from the bottom).
N $CE82 #PUSHS #UDGTABLE
. { #SIM(start=$CD63,stop=$CD6C)#SIM(start=$CE61,stop=$CE8C)#SCR$02(goldfish-game-03) }
. UDGTABLE# #POPS
  $CE82,$05 #HTML(Write #COLOUR$28 (#N$28) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C8D.html">ATTR_P</a>.)
  $CE87,$05 #HTML(Clear the bottom #N$02 lines using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0E44.html">CL_LINE</a>.)
@ $CE8C label=GoldfishGame_InitialiseGame
  $CE8C,$04 #REGix=#R$DC0E.
  $CE90,$04 Write #N$0F to *#REGix+#N$00.
  $CE94,$04 Write #N$0A to *#REGix+#N$01.
  $CE98,$04 Write #N$03 to *#REGix+#N$02.
  $CE9C,$04 Write #N$03 to *#REGix+#N$03.
  $CEA0,$04 Write #N$00 to *#REGix+#N$04 (player X co-ordinate).
  $CEA4,$04 Write #N$00 to *#REGix+#N$05 (player Y co-ordinate).
  $CEA8,$04 Write #N$20 to *#REGix+#N$06.
  $CEAC,$04 Write #N$02 to *#REGix+#N$07.
  $CEB0,$04 Write #N$01 to *#REGix+#N$08.
  $CEB4,$04 Write #N$07 to *#REGix+#N$09.
  $CEB8,$04 Write #N$01 to *#REGix+#N$0A.
  $CEBC,$04 Write #N$03 to *#REGix+#N$0B.
  $CEC0,$04 Write #N$03 to *#REGix+#N$0C.
  $CEC4,$04 Write #N$0F to *#REGix+#N$0D.
  $CEC8,$04 Write #N$0A to *#REGix+#N$0E.
  $CECC,$04 Write #N$03 to *#REGix+#N$0F.
  $CED0,$03 #REGbc=#N($0064,$04,$04).
  $CED3,$03 #REGde=#R$DB46.
  $CED6,$03 #REGhl=#R$A06C.
  $CED9,$02 LDIR.
  $CEDB,$03 #REGhl=#R$A06C.
  $CEDE,$03 #REGde=#R$DBAA.
  $CEE1,$03 #REGbc=#N($0064,$04,$04).
  $CEE4,$02 LDIR.
N $CEE6 Randomly choose sand UDGs and write them into the Sand Animation Buffer. Note; the count is one screen width
. +#N$01 (so #N$21) so the animation doesn't happen on-screen.
@ $CEE6 label=PopulateSandBuffer
  $CEE6,$03 #REGde=#R$DC22.
  $CEE9,$02 #REGb=#N$21 (counter; number of sand UDGs to copy).
@ $CEEB label=PopulateSandBuffer_Loop
  $CEEB,$02 Stash the sand UDG counter and sand animation buffer pointer on the stack.
  $CEED,$03 Call #R$D8D4.
  $CEF0,$02,b$01 Keep only bits 0-3.
M $CEED,$05 Fetch a semi-random number from #N$00-#N$0F and store it in #REGa.
  $CEF2,$0D #REGhl=#R$964C+(#REGa*#N$08).
  $CEFF,$01 Restore the sand animation buffer pointer from the stack.
  $CF00,$03 #REGbc=#N($0008,$04,$04).
  $CF03,$02 Copy a sand UDG (#N($0008,$04,$04) bytes of data) to the sand animation buffer.
  $CF05,$01 Restore the sand UDG counter from the stack.
  $CF06,$02 Decrease the sand UDG counter by one and loop back to #R$CEEB until it is zero.
N $CF08 See; #R$99EC and #R$9CEC.
  $CF08,$03 Call #R$D870.
N $CF0B Set up the status bar.
N $CF0B Set the co-ordinates of where we're going to PRINT AT.
  $CF0B,$07 #HTML(Set up the screen buffer location #N$02/#N$21 using <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
N $CF12 Restore the default ZX Spectrum font.
  $CF12,$03 #HTML(#REGhl=<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/3D00.html">#N$3C00</a> (CHARSET-#N$100).)
  $CF15,$03 #HTML(Write #REGhl to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
N $CF18 Print the status bar messaging.
N $CF18 #PUSHS #UDGTABLE
. { #SIM(start=$CD63,stop=$CD6C)#SIM(start=$CE61,stop=$CF1E)#SCR$02(goldfish-game-04) }
. UDGTABLE# #POPS
  $CF18,$03 #REGde=#R$D9D2.
  $CF1B,$03 Call #R$D60E.
N $CF1E Draw the oxygen bar at the bottom of the screen.
N $CF1E #PUSHS #UDGTABLE
. { #SIM(start=$CD63,stop=$CD6C)#SIM(start=$CE61,stop=$CF21)#SCR$02(goldfish-game-05) }
. UDGTABLE# #POPS
  $CF1E,$03 Call #R$D2F8.
N $CF21 Reset any bubble data.
  $CF21,$03 #REGhl=#R$DD2A.
  $CF24,$02 #REGa=#N$00.
  $CF26,$02 #REGb=#N$6E.
@ $CF28 label=GoldfishGame_ClearBubblesLoop
  $CF28,$01 Write #N$00 to *#REGhl.
  $CF29,$01 Increment #REGhl by one.
  $CF2A,$02 Decrease counter by one and loop back to #R$CF28 until counter is zero.
N $CF2C Set player game entry variables.
  $CF2C,$05 Write #N$00 to *#R$DB42.
  $CF31,$05 Write #N$13 to *#R$D33E.
N $CF36 The "normal" game just starts on completion of the Goldfish game.
@ $CF36 label=GoldfishGame_GameLoop
  $CF36,$0B Jump to #R$D08A if *#R$DB42 is equal to *#R$DB44.
N $CF41 Handle the player "spending" air (only every 16th frame).
  $CF41,$03 Call #R$D2F2.
  $CF44,$03 Call #R$D8E2.
  $CF47,$07 Increment *#R$D93D by one.
  $CF4E,$03 Call #R$D92A.
N $CF51 Add the "float up" effect on every fourth frame.
  $CF51,$03 #REGa=*#R$D93D.
  $CF54,$02,b$01 Keep only bits 0-1.
  $CF56,$03 Call #R$D5CB if the result is zero.
M $CF51,$08 Call #R$D5CB when #R$D93D is divisable by #N$04 (with no remainder).
  $CF59,$04 #REGbc=*#R$DD98.
  $CF5D,$03 Call #R$D778.
  $CF60,$03 Call #R$D8D4.
  $CF63,$02,b$01 Keep only bits 0-2.
  $CF65,$01 Increment #REGa by one.
  $CF66,$01 #REGb=#REGa.
M $CF60,$07 Get a semi-random number between #N$01-#N$08 and store it in #REGb.
  $CF67,$03 Call #R$D778.
  $CF6A,$03 Call #R$D4CC.
  $CF6D,$03 Call #R$D260.
  $CF70,$03 Call #R$D579.
  $CF73,$03 Call #R$D8A2.
  $CF76,$08 Jump to #R$CFA8 if *#R$D33E is equal to #N$00.
  $CF7E,$04 #REGb=*#R$DD98.
  $CF82,$04 #REGix=#R$DB46.
@ $CF86 label=GoldfishGame_ProcessCreature
  $CF86,$01 Stash #REGbc on the stack.
  $CF87,$07 Jump to #R$CFA0 if *#REGix+#N$0A is equal to #N$00.
  $CF8E,$03 #REGa=*#R$DC0F.
  $CF91,$01 Decrease #REGa by one.
  $CF92,$03 #REGa+=*#REGix+#N$08.
  $CF95,$03 #REGb=*#REGix+#N$01.
  $CF98,$01 #REGa-=#REGb.
  $CF99,$03 #REGb=*#REGix+#N$08.
  $CF9C,$01 Increment #REGb by one.
  $CF9D,$03 Jump to #R$CFF6 if #REGa is lower than #REGb.
@ $CFA0 label=GoldfishGame_NextCreature
  $CFA0,$01 Restore #REGbc from the stack.
  $CFA1,$03 #REGde=#N($0018,$04,$04).
  $CFA4,$02 #REGix+=#REGde.
  $CFA6,$02 Decrease counter by one and loop back to #R$CF86 until counter is zero.
N $CFA8 Print the number of fish the player has caught so far.
@ $CFA8 label=GoldfishGame_PrintFishCaught
  $CFA8,$06 Set INK: #N$00.
  $CFAE,$06 Set PAPER: #N$05.
N $CFB4 Restore the default ZX Spectrum font.
  $CFB4,$03 #HTML(#REGhl=<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/3D00.html">#N$3C00</a> (CHARSET-#N$100).)
  $CFB7,$03 #HTML(Write #REGhl to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $CFBA,$07 #HTML(Set up the screen buffer location #N$02/#N$1C using <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
N $CFC1 Store *#R$DB42 in #REGbc so we can use OUT_NUM_1 to print it to the screen.
  $CFC1,$06 #REGbc=*#R$DB42.
  $CFC7,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/1A1B.html">OUT_NUM_1</a>.)
  $CFCA,$02 #REGa=ASCII "space" (#N$20).
  $CFCC,$03 Call #R$D353.
  $CFCF,$08 Jump to #R$CF36 if *#R$DC0F is not equal to #N$10.
  $CFD7,$08 Jump to #R$CF36 if *#R$DC11 is not equal to #N$03.
  $CFDF,$04 #REGc=*#R$DC0E.
  $CFE3,$02 #REGa=#N$21.
  $CFE5,$01 #REGa-=#REGc.
  $CFE6,$03 #REGhl=#N$47E0 (screen buffer location).
  $CFE9,$01 #REGe=#REGa.
  $CFEA,$02 #REGd=#N$00.
  $CFEC,$01 #REGhl+=#REGde.
  $CFED,$06 Jump to #R$D05B if *#REGhl is equal to #N$00.
  $CFF3,$03 Jump to #R$CF36.

c $CFF6 Goldfish Game: Collision
N $CFF6 The player has hit a sprite, let's see what it is.
@ $CFF6 label=GoldfishGame_Collision
  $CFF6,$04 #REGc=*#R$DC0E.
  $CFFA,$03 #REGa=*#REGix+#N$00.
  $CFFD,$03 #REGa-=*#REGix+#N$07.
  $D000,$01 Increment #REGa by one.
  $D001,$01 #REGa-=#REGc.
  $D002,$04 Jump to #R$CFA0 if #REGa is higher than #N$02.
  $D006,$02 Stash #REGix on the stack.
  $D008,$03 #REGhl=#N($0064,$04,$04).
  $D00B,$03 #REGde=#N($0064,$04,$04).
  $D00E,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/03B5.html">BEEPER</a>.)
  $D011,$02 Restore #REGix from the stack.
  $D013,$07 Jump to #R$D047 if *#REGix+#N$08 is not equal to #N$01.
N $D01A The player has caught a fish! Add it to the count and remove it from the screen.
@ $D01A label=GoldfishGame_CaughtFish
  $D01A,$07 Increment *#R$DB42 by one.
  $D021,$03 #REGc=vertical position (*#REGix+#N$00).
  $D024,$03 #REGb=horizontal position (*#REGix+#N$01).
  $D027,$03 #REGe=*#REGix+#N$07.
  $D02A,$03 #REGd=*#REGix+#N$08.
  $D02D,$07 Jump to #R$D035 if *#REGix+#N$02 is equal to #N$03.
  $D034,$01 Increment #REGe by one.
  $D035,$06 #HTML(Write #R$A06C(#N$9F6C) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $D03B,$02 #REGa=#N$20.
  $D03D,$03 Call #R$D460.
  $D040,$04 Write inactive (#N$00) to *#REGix+#N$0A.
  $D044,$03 Jump to #R$CFA0.
N $D047 When any sea creature touches you they steal all of your fish.
@ $D047 label=GoldfishGame_HitCreature
  $D047,$04 Write #N$00 to *#R$DB42.
  $D04B,$02 Stash #REGix on the stack.
  $D04D,$03 #REGhl=#N($00C8,$04,$04).
  $D050,$03 #REGde=#N($0032,$04,$04).
  $D053,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/03B5.html">BEEPER</a>.)
  $D056,$02 Restore #REGix from the stack.
  $D058,$03 Jump to #R$CFA0.

c $D05B Goldfish Game: Refill Oxygen
@ $D05B label=GoldfishGame_RefillOxygen
N $D05B Fill the air gauge back up to maximum.
  $D05B,$05 Write #N$13 to *#R$D33E.
  $D060,$03 Call #R$D2F8.
  $D063,$02 #REGb=#N$0A.
  $D065,$01 Stash #REGbc on the stack.
  $D066,$02 #REGa=#N$15.
  $D068,$02 #REGc=#N$FE.
  $D06A,$02 #REGb=#N$FF.
  $D06C,$02
  $D06E,$03 Call #R$D8D4.
  $D071,$01 #REGb=#REGa.
  $D072,$02 Decrease counter by one and loop back to #R$D072 until counter is zero.
  $D074,$03 Call #R$D8D4.
  $D077,$01 #REGb=#REGa.
  $D078,$02 #REGa=#N$05.
  $D07A,$01 Stash #REGbc on the stack.
  $D07B,$02 #REGc=#N$FE.
  $D07D,$02 #REGb=#N$FF.
  $D07F,$02
  $D081,$01 Restore #REGbc from the stack.
  $D082,$02 Decrease counter by one and loop back to #R$D078 until counter is zero.
  $D084,$01 Restore #REGbc from the stack.
  $D085,$02 Decrease counter by one and loop back to #R$D065 until counter is zero.
  $D087,$03 Jump to #R$CF36.

c $D08A Start Game
@ $D08A label=StartGame
  $D08A,$07 Jump to #R$D099 if *#R$5BF1 is equal to #N$04.
  $D091,$05 Write #N$02 to *#R$5BF0.
  $D096,$03 Jump to #R$D09E.
  $D099,$05 Write #N$01 to *#R$5BF0.
  $D09E,$03 Call #R$DEA8.
  $D0A1,$08 Jump to #R$CD86 if *#R$5BF1 is equal to #N$FF.
  $D0A9,$03 Jump to #R$CE8C.

c $D0AC Animate Title Screen
@ $D0AC label=AnimateTitleScreen
  $D0AC,$03 #REGhl=#R$4000(#N$4000) (screen buffer destination).
  $D0AF,$03 #REGde=#R$6978 (source).
N $D0B2 Find the next instance of "#N$05" in the source data.
@ $D0B2 label=AnimateTitleScreen_Loop
  $D0B2,$05 Jump to #R$D0C7 if *#REGde is not equal to #N$05.
  $D0B7,$03 Seems to do nothing; as both #REGa and the flags are overwritten in the #R$D8D4 call.
  $D0BA,$03 Call #R$D8D4.
N $D0BD On returning; #REGa=(*#R$D86F*#N$05)+#N$01.
  $D0BD,$04 Jump to #R$D0C4 if #REGa is higher than #N$80.
  $D0C1,$01 Write #REGa to the screen buffer pointer address.
  $D0C2,$02 Jump to #R$D0C7.
N $D0C4 This byte has finished its cycle, so reset it.
@ $D0C4 label=AnimateTitleScreen_Reset
  $D0C4,$03 Reset the current byte in the screen buffer back to #N$00.
N $D0C7 Increment both source and destination pointers and loop back until the entire screen buffer has been processed.
@ $D0C7 label=AnimateTitleScreen_Increment
  $D0C7,$01 Increment screen buffer pointer by one.
  $D0C8,$01 Increment source data pointer by one.
  $D0C9,$05 Jump to #R$D0B2 if #REGh is not equal to #N$58.
  $D0CE,$05 Jump to #R$D0B2 if #REGl is not equal to #N$00.
N $D0D3 The end of the screen buffer has been reached, so return.
  $D0D3,$01 Return.

c $D0D4 Set Cursor Joystick
@ $D0D4 label=SetCursorJoystick
  $D0D4,$03 Call #R$CD6F.
  $D0D7,$03 Write #N$23 to *#REGhl.
  $D0DA,$05 Write Cursor joystick (#N$14) to *#R$5BEA.
  $D0DF,$03 Jump to #R$CDE3.

c $D0E2 Set Kempston Joystick
@ $D0E2 label=SetKempstonJoystick
  $D0E2,$03 #REGde=#R$D9B6.
  $D0E5,$03 Call #R$D60E.
N $D0E8 Pause to let the message sink in...
  $D0E8,$02 #REGb=#N$64 (pause loops).
@ $D0EA label=SetKempstonJoystick_PauseLoop
  $D0EA,$01 Stash the pause loop counter on the stack.
  $D0EB,$03 Call #R$D3A6.
  $D0EE,$01 Restore the pause loop counter from the stack.
  $D0EF,$02 Decrease the pause loop counter by one and loop back to #R$D0EA until the counter is zero.
N $D0F1 After the above loop we loop again, this gives the player the chance to abort setting this control method.
  $D0F1,$03 #REGbc=#N$03E8 (counter).
@ $D0F4 label=SetKempstonJoystick_Read
  $D0F4,$02 Read from the Kempston joystick port.
  $D0F6,$05 Jump to #R$CDD1 if any control is being pressed.
  $D0FB,$01 Decrease #REGbc by one.
  $D0FC,$04 Jump to #R$D0F4 until #REGbc is zero.
N $D100 Else, finally, set this control method.
  $D100,$05 Set Kempston joystick (#N$0C) to *#R$5BEA.
  $D105,$03 Jump to #R$CDE3.

c $D108 Restart Set User-Defined Keys
@ $D108 label=Restart_SetUserDefinedKeys
N $D108 This subroutine is used when a duplicate control key has been detected. It performs housekeeping and then just
. kicks off #R$D188 again.
  $D108,$01 Restore #REGbc from the stack.
  $D109,$03 Jump to #R$D188.

c $D10C Set Interface 2 Joystick
@ $D10C label=SetInterface2Joystick
N $D10C Discover which port is being used.
N $D10C Ask the player to press the fire button on their joystick.
  $D10C,$03 #REGde=#R$D16F.
  $D10F,$03 Call #R$D60E.
N $D112 Pause to let the message sink in...
  $D112,$03 #REGbc=#N$03E8 (pause loops).
@ $D115 label=SetInterface2Joystick_Loop
  $D115,$01 Stash the pause loop counter on the stack.
  $D116,$03 Call #R$D3A6.
  $D119,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/028E.html">KEY_SCAN</a>.)
  $D11C,$01 Restore the pause loop counter from the stack.
  $D11D,$06 Jump to #R$D14D if the left-hand joystick port fire button was pressed (#N$04 == "5").
  $D123,$05 Jump to #R$D135 if the right-hand joystick port fire button was pressed (#N$23 == "0").
  $D128,$01 Decrease the pause loop counter by one.
  $D129,$04 Jump to #R$D115 until the pause loop counter is zero.
N $D12D No response from the player, so do nothing and return.
  $D12D,$05 #HTML(Clear the bottom #N$12 lines using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0E44.html">CL_LINE</a>.)
  $D132,$03 Jump to #R$CDE3.
N $D135 Sets the user-defined keys for the right-hand Interface 2 joystick.
@ $D135 label=SetInterface2Joystick_Right
  $D135,$03 #REGde=#R$5BEB.
  $D138,$03 #REGhl=#R$D16A.
  $D13B,$03 #REGbc=#N($0005,$04,$04).
  $D13E,$02 Copy the keymap to the user-defined keys store.
  $D140,$05 Write Interface 2 joystick (#N$1C) to *#R$5BEA.
  $D145,$05 #HTML(Clear the bottom #N$12 lines using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0E44.html">CL_LINE</a>.)
  $D14A,$03 Jump to #R$CDE3.
N $D14D Sets the user-defined keys for the left-hand Interface 2 joystick.
@ $D14D label=SetInterface2Joystick_Left
  $D14D,$03 #REGde=#R$5BEB.
  $D150,$03 #REGhl=#R$D165.
  $D153,$03 #REGbc=#N($0005,$04,$04).
  $D156,$02 Copy the keymap to the user-defined keys store.
  $D158,$05 Write Interface 2 joystick (#N$1C) to *#R$5BEA.
  $D15D,$05 #HTML(Clear the bottom #N$12 lines using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0E44.html">CL_LINE</a>.)
  $D162,$03 Jump to #R$CDE3.
N $D165 The key maps for left and right Interface 2 joystick ports.
@ $D165 label=Interface2KeyMap_Left
B $D165,$05
@ $D16A label=Interface2KeyMap_Right
B $D16A,$05

t $D16F Messaging: Press Fire Button
@ $D16F label=Messaging_PressFireButton
B $D16F,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
B $D172,$02 FLASH: #MAP(#PEEK(#PC+$01))(OFF,1:ON).
  $D174,$11 "#STR(#PC,$04,$11)".
B $D185,$02 FLASH: #MAP(#PEEK(#PC+$01))(OFF,1:ON).
B $D187,$01 Terminator.

c $D188 Set User-Defined Keys
@ $D188 label=SetUserDefinedKeys
N $D188 #PUSHS #UDGTABLE {
.   #SIM(sp=$68DD)
.   #SIM(start=$CDD1,stop=$CDE9)
.   #SIM(start=$CD6F,stop=$CD85)
.   #SIM(start=$D188,stop=$D19D)
.   #SIM(start=$D1A6,stop=$D1BF)
.   #SCR$02(user-defined-keys)
. } UDGTABLE# #POPS
  $D188,$05 Reset *#R$D20C to #N$00.
  $D18D,$05 Write Keyboard Input (#N$24) to *#R$5BEA.
N $D192 Don't clear the whole screen. Leave the header from the title screen.
  $D192,$05 #HTML(Clear the bottom #N$12 lines using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0E44.html">CL_LINE</a>.)
@ $D197 label=UserDefinedKeys_Loop
  $D197,$03 #REGde=#R$DACB.
  $D19A,$03 Call #R$D60E.
N $D19D Pause to let the message sink in...
  $D19D,$02 #REGb=#N$0A (pause loops).
@ $D19F label=UserDefinedKeys_PauseLoop
  $D19F,$01 Stash #REGbc on the stack.
  $D1A0,$03 Call #R$D3A6.
  $D1A3,$01 Restore #REGbc from the stack.
  $D1A4,$02 Decrease counter by one and loop back to #R$D19F until counter is zero.
N $D1A6 Display each (current) user-defined key, and the relevant messaging.
  $D1A6,$05 Call #R$D20D using key position: #N$00.
  $D1AB,$05 Call #R$D20D using key position: #N$01.
  $D1B0,$05 Call #R$D20D using key position: #N$02.
  $D1B5,$05 Call #R$D20D using key position: #N$03.
  $D1BA,$05 Call #R$D20D using key position: #N$04.
N $D1BF Fetch the user input.
@ $D1BF label=UserDefinedKeys_InputLoop
  $D1BF,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/028E.html">KEY_SCAN</a>.)
  $D1C2,$05 Loop back to #R$D1BF until any key has been pressed.
  $D1C7,$05 Jump to #R$D1EE if "SPACE" has been pressed (#N$20).
  $D1CC,$01 Stash the keypress on the stack briefly.
N $D1CD Create an offset for the currently in-focus key position using #REGde.
  $D1CD,$04 #REGe=*#R$D20C.
  $D1D1,$01 Restore the keypress from the stack.
  $D1D2,$02 #REGd=#N$00 (to finish creating the offset for the current key position using #REGde).
  $D1D4,$04 #REGhl=#R$5BEB+#REGde.
  $D1D8,$01 Write the keypress code to the appropriate position in the user-defined keys table held by *#REGhl.
N $D1D9 A small pause loop to give the user a chance to release the key.
  $D1D9,$02 #REGb=#N$02 (pause loops).
@ $D1DB label=UserDefinedKeys_Debounce
  $D1DB,$01 Stash #REGbc on the stack.
  $D1DC,$03 Call #R$D3A6.
  $D1DF,$01 Restore #REGbc from the stack.
  $D1E0,$02 Decrease counter by one and loop back to #R$D1DB until counter is zero.
N $D1E2 Move onto the next key position.
  $D1E2,$07 Increment *#R$D20C by one.
  $D1E9,$05 Loop back to #R$D197 until all #N$05 keys have been defined.
N $D1EE Each value is checked against other values ahead of it. It doesn't need to check "behind" as e.g.
. consider the following table:
. #TABLE(default,centre,centre,centre,centre,centre,centre)
. { =h,r2 Cycle | =h,r2 Using | =h,c4 Positions }
. { =h #N$01 | =h #N$02 | =h #N$03 | =h #N$04 }
. { =h #N$01 | #N$01 | #N$02 | #N$03 | #N$04 | #N$05 }
. { =h #N$02 | #N$02 | #N$03 | #N$04 | #N$05 |  ---  }
. { =h #N$03 | #N$03 | #N$04 | #N$05 |  ---  |  ---  }
. { =h #N$04 | #N$04 | #N$05 |  ---  |  ---  |  ---  }
. TABLE#
N $D1EE On the 1st cycle; #N$01 is checked against #N$02, #N$03, #N$04 and #N$05.
N $D1EE So on the 2nd cycle, there's no need to check #N$02 against #N$01 as this already happened in the 1st cycle.
N $D1EE And so on...
@ $D1EE label=CheckForDuplicates
  $D1EE,$02 Set a counter; there are #N$04 other keys to check at the beginning of the cycle.
  $D1F0,$03 Set a pointer in #REGhl to the beginning of the key storage: #R$5BEB.
@ $D1F3 label=CheckForDuplicates_Loop
  $D1F3,$01 Stash the current key map counter on the stack (this is reduced by one on each cycle).
  $D1F4,$01 Does nothing, this is immediately overwritten in the loop below.
N $D1F5 Clone #REGhl into #REGde to prepare for the checking loop.
  $D1F5,$02 #REGde=#REGhl (using the stack).
N $D1F7 Process this cycle. *#REGhl points to the current "checking" key map value, and #REGde is incremented on each cycle to check against it.
@ $D1F7 label=CheckForDuplicates_CheckLoop
  $D1F7,$01 *#REGde will contain the comparison key map value, so increment #REGde by one.
  $D1F8,$05 If there's a match between *#REGde and *#REGhl, jump to #R$D108 and get the user to try again.
  $D1FD,$02 Decrease the key map counter by one and loop back to #R$D1F7 until all key map values have been checked.
N $D1FF This cycle is finished, so prepare for the next one.
  $D1FF,$01 Restore the key map counter from the stack.
  $D200,$01 Move the value pointer to the next value.
  $D201,$01 Decrease the key map counter by one, each cycle checks one less key value.
  $D202,$02 Jump to #R$D1F3 until all key map values have been checked.
N $D204 We are good! Clear the screen and move back to the title screen.
  $D204,$05 #HTML(Clear the bottom #N$12 lines using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0E44.html">CL_LINE</a>.)
  $D209,$03 Jump to #R$CDE3.

g $D20C Current In-Focus User-Defined Key
@ $D20C label=Current_UserDefinedKey
D $D20C Contains the currently in-focus key position; used for highlighting.
B $D20C,$01

c $D20D Print User-Defined Key
@ $D20D label=PrintUserDefinedKey
R $D20D A The key position
R $D20D DE Pointer to the key position messaging
  $D20D,$01 Stash the key position messaging pointer on the stack.
  $D20E,$01 Store the current position in an offset...
  $D20F,$07 Call #R$D259 to highlight this key if it's the one currently in focus
. (i.e. if *#R$D20C is equal to the position currently being printed).
  $D216,$02 #REGd=#N$00 (to finish creating the offset for the current key position using #REGde).
N $D218 Point to the key in the user-defined key table relating to the requested key position.
  $D218,$04 #REGhl=#R$5BEB+#REGde.
  $D21C,$01 Exchange the #REGde and #REGhl registers.
  $D21D,$04 Fetch the key for this position and store it in #REGde as an offset.
N $D221 Point to the relevant key in the keymap table.
  $D221,$04 #REGhl=#R$D22C+#REGde.
  $D225,$01 Fetch the key value from the keymap table and store it in #REGa.
  $D226,$01 #HTML(Print it to the screen using RST <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0010.html">#N$10</a>.)
N $D227 Print the "action" messaging to signify what this key is for, e.g. "LEFT", "RIGHT", etc...
  $D227,$01 Restore the key position messaging pointer from the stack.
  $D228,$03 Jump to #R$D60E.

u $D22B
C $D22B,$01 This is never reached.

g $D22C Table: Key Map
@ $D22C label=Table_UserDefinedKeyMap
D $D22C See #R$CD6F for an example of how this is used. Each key is stored as
. an offset. So a stored value of #N$05 equates to the "T" key.
B $D22C,$01 #N(#PC-$D22C): "#CHR(#PEEK(#PC))".
L $D22C,$01,$27

c $D253 Set Default Keys
@ $D253 label=SetDefaultKeys
  $D253,$03 Call #R$CD6F.
  $D256,$03 Jump to #R$CDE3.

c $D259 Turn Inverse On
@ $D259 label=InverseOn
  $D259,$06 INVERSE: ON.
  $D25F,$01 Return.

c $D260 Goldfish Game: Handler: Bubbles
@ $D260 label=GoldfishGame_HandlerBubbles
  $D260,$04 #REGix=#R$DD2A.
  $D264,$02 #REGb=#N$05 (counter; maximum number of bubbles).
@ $D266 label=HandlerBubbles_Loop
  $D266,$01 Stash the bubble counter on the stack.
  $D267,$08 Jump to #R$D2B1 if the bubble state (*#REGix+#N$0A) is inactive (#N$00).
N $D26F A bubble exists, so we need to redraw it in a new position. Hence, we erase it first here.
  $D26F,$06 Set INVERSE: ON
N $D275 Fetch the current co-ordinates.
  $D275,$03 #REGc=vertical position (*#REGix+#N$00).
  $D278,$03 #REGb=horizontal position (*#REGix+#N$01).
N $D27B Plot while using inverse will erase the bubble (it's only a single pixel).
  $D27B,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/22DC.html#22e5">PLOT_SUB</a>.)
N $D27E Prepare for drawing the new bubble.
  $D27E,$06 Set INVERSE: OFF
N $D284 Fetch the current co-ordinates.
  $D284,$03 #REGc=vertical position (*#REGix+#N$00).
  $D287,$03 #REGb=horizontal position (*#REGix+#N$01).
N $D28A Move the bubble to the new position.
N $D28A The bubble always moves "up" three pixels and accelerates to the right exponentially.
  $D28A,$03 Increment #REGc by three.
  $D28D,$03 #REGa=horizontal velocity (*#REGix+#N$05).
  $D290,$03 Increment the horizontal velocity (*#REGix+#N$05) by one to simulate acceleration.
  $D293,$02 #REGb+=the velocity value.
  $D295,$04 Jump to #R$D2AB if #REGa is higher than #N$70.
N $D299 Update the data table with the new co-ordinates.
  $D299,$03 Write #REGc to vertical position (*#REGix+#N$00).
  $D29C,$03 Write #REGb to horizontal position (*#REGix+#N$01).
N $D29F Draw the bubble to the screen buffer.
@ $D29F label=HandlerBubbles_Plot
  $D29F,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/22DC.html#22e5">PLOT_SUB</a>.)
N $D2A2 Move onto the next bubble.
@ $D2A2 label=HandlerBubbles_Next
  $D2A2,$01 Restore the bubble counter from the stack.
  $D2A3,$05 #REGix+=#N($000B,$04,$04).
  $D2A8,$02 Decrease the bubble counter by one and loop back to #R$D266 until all bubbles have been evaluated.
  $D2AA,$01 Return.
N $D2AB The bubble has finished its cycle so deactivate it.
@ $D2AB label=HandlerBubbles_Deactivate
  $D2AB,$04 Write inactive (#N$00) to bubble state (*#REGix+#N$0A).
  $D2AF,$02 Jump to #R$D2A2.
N $D2B1 Decide if a new bubble should be created.
@ $D2B1 label=GoldfishGame_HandlerBubbles_Generate
  $D2B1,$03 Call #R$D8D4.
  $D2B4,$04 Jump to #R$D2A2 if #REGa is lower than #N$03.
N $D2B8 No bubbles if the players oxygen has run out.
  $D2B8,$07 Jump to #R$D2A2 if *#R$D33E is equal to #N$00.
N $D2BF Generate a new bubble.
N $D2BF Fetch the player co-ordinates to determine the bubbles starting position.
  $D2BF,$04 #REGbc=*#R$DC0E.
  $D2C3,$02 #REGa=#N$21.
  $D2C5,$01 #REGa-=#REGc.
  $D2C6,$02 Shift #REGa left (with carry).
  $D2C8,$02 Shift #REGa left (with carry).
  $D2CA,$02 Shift #REGa left (with carry).
  $D2CC,$02 #REGa+=#N$06.
  $D2CE,$03 Write #REGa to vertical position (*#REGix+#N$00).
  $D2D1,$01 #REGa=#REGb.
  $D2D2,$02 Decrease #REGa by two.
  $D2D4,$02 Shift #REGa left (with carry).
  $D2D6,$02 Shift #REGa left (with carry).
  $D2D8,$02 Shift #REGa left (with carry).
  $D2DA,$04 Jump to #R$D2A2 if #REGa is higher than #N$70.
N $D2DE Active the bubble.
  $D2DE,$03 Write #REGa to horizontal position (*#REGix+#N$01).
  $D2E1,$04 Write "active" (#N$01) to bubble state (*#REGix+#N$0A).
  $D2E5,$04 Write #N$01 to the horizontal velocity (*#REGix+#N$05).
N $D2E9 Fetch the current co-ordinates, and jump to plot the new bubble on the screen.
  $D2E9,$03 #REGc=vertical position (*#REGix+#N$00).
  $D2EC,$03 #REGb=horizontal position (*#REGix+#N$01).
  $D2EF,$03 Jump to #R$D29F.

c $D2F2 Goldfish Game: Air Bar
@ $D2F2 label=GoldfishGame_AirBar
N $D2F2 Only remove air every 16th frame.
  $D2F2,$03 #REGa=*#R$D93D.
  $D2F5,$02,b$01 Keep only bits 0-3.
  $D2F7,$01 Return if the result is not zero.
M $D2F5,$03 Only proceed every 16th frame, otherwise return.
@ $D2F8 label=GoldfishGame_PrintAirBar
  $D2F8,$06 #HTML(Write #R$D32E(#N$D22E) (#R$D32E) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
N $D2FE Set the co-ordinates of where we're going to PRINT AT.
  $D2FE,$07 #HTML(Set up the screen buffer location #N$15/#N$02 using <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
N $D305 Set the attributes.
  $D305,$06 Set INK: RED (#N$02).
  $D30B,$06 Set PAPER: CYAN (#N$05).
  $D311,$05 Is *#R$D33E zero?
  $D316,$01 Stash the current oxygen level on the stack.
  $D317,$03 Call #R$D550 if the current oxygen level is zero.
  $D31A,$01 Restore the current oxygen level from the stack.
  $D31B,$02 Jump to #R$D32A if the current oxygen level is zero.
N $D31D The player has air, so deplete it here.
N $D31D See #POKE#goldfishGameInfiniteOxygen(Infinite Oxygen (Hidden Game)).
  $D31D,$04 Decrease the current oxygen level by one, and write it back to *#R$D33E.
N $D321 Now draw a visual representation of the air level to the screen.
  $D321,$02 #REGb=the current oxygen level+#N$01 (as a counter for drawing the air bar).
  $D323,$02 #REGa=#R$D32E (#N$20).
@ $D325 label=GoldfishGame_PrintAirBar_Loop
  $D325,$01 Stash the air bar UDG reference on the stack.
  $D326,$01 #HTML(Print to the screen using RST <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0010.html">#N$10</a>.)
  $D327,$01 Restore the air bar UDG reference from the stack.
  $D328,$02 Decrease the air bar counter by one and loop back to #R$D325 until the counter is zero.
N $D32A Print some empty space to mask off the end of the air bar.
@ $D32A label=GoldfishGame_PrintNoAirBar
  $D32A,$02 #REGa=#R$D336 (#N$21).
  $D32C,$01 #HTML(Print to the screen using RST <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0010.html">#N$10</a>.)
  $D32D,$01 Return.
@ $D32E label=UDG_AirBar
@ $D336 label=UDG_NoAirBar
B $D32E,$08 #UDGTABLE { #UDG(addr=#PC,attr=$2A) } UDGTABLE#
L $D32E,$08,$02

g $D33E Goldfish Game: Oxygen Level
@ $D33E label=GoldfishGame_OxygenLevel
B $D33E,$01

c $D33F
  $D33F,$04 #HTML(Stash the current character set pointer at *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a> on the stack.)
  $D343,$06 #HTML(Write #R$A06C(#N$9F6C) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $D349,$02 #REGa=#N$20.
  $D34B,$03 Call #R$D460.
  $D34E,$04 #HTML(Restore the previous character set pointer from the stack, and write it to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $D352,$01 Return.

c $D353 Print Colour UDG
@ $D353 label=PrintColourUDG
N $D353 Identical clone of #R$E6DC.
R $D353 A Character to print
  $D353,$01 Switch to the shadow registers.
  $D354,$01 #REGe'=#REGa.
  $D355,$02 #REGd'=#N$00.
  $D357,$02 Shift #REGe' left (with carry).
  $D359,$02 Rotate #REGd' left.
  $D35B,$02 Shift #REGe' left (with carry).
  $D35D,$02 Rotate #REGd' left.
  $D35F,$02 Shift #REGe' left (with carry).
  $D361,$02 Rotate #REGd' left.
M $D354,$0F #REGde'=#REGa*#N$08.
  $D363,$04 #HTML(#REGhl'=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>+#REGde'.)
  $D367,$09 #HTML(Increment *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C84.html">DF_CC</a> by one.)
  $D370,$01 Decrease #REGde' by one.
N $D371 All character blocks are 1 x 8 bytes.
N $D371 Copy the data from the current character set to the screen buffer.
  $D371,$02 #REGb'=#N$08 (byte counter).
@ $D373 label=PrintColourUDG_Loop
  $D373,$01 #REGa=*#REGhl'.
  $D374,$01 Write #REGa to *#REGde'.
  $D375,$01 Increment #REGhl' by one.
  $D376,$01 Increment #REGd' by one.
  $D377,$02 Decrease counter by one and loop back to #R$D373 until counter is zero.
N $D379 Calculate the attribute buffer position.
  $D379,$04 #HTML(#REGbc'=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C88.html">S_POSN</a>.)
  $D37D,$03 #REGhl'=#N$5800 (attribute buffer location).
  $D380,$01 Decrease #REGc' by one.
  $D381,$04 #HTML(Write #REGbc' to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C88.html">S_POSN</a>.)
  $D385,$01 Increment #REGc' by one.
  $D386,$04 #REGe'=#N$21-#REGc'.
  $D38A,$02 #REGd'=#N$00.
  $D38C,$01 #REGhl'+=#REGde'.
  $D38D,$04 #REGe'=#N$18-#REGb'.
  $D391,$08 Shift #REGe' left four positions (with carry).
  $D399,$02 Rotate #REGd' left.
  $D39B,$02 Shift #REGe' left (with carry).
  $D39D,$02 Rotate #REGd' left.
  $D39F,$01 #REGhl'+=#REGde'.
  $D3A0,$03 #HTML(#REGa=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C8F.html">ATTR_T</a>.)
  $D3A3,$01 Write #REGa to *#REGhl'.
  $D3A4,$01 Switch back to the normal registers.
  $D3A5,$01 Return.

c $D3A6 Small Pause
@ $D3A6 label=SmallPause
  $D3A6,$03 #REGbc=#N$1388.
@ $D3A9 label=SmallPause_Loop
  $D3A9,$01 Decrease #REGbc by one.
  $D3AA,$04 Jump to #R$D3A9 until #REGbc is zero.
  $D3AE,$01 Return.

c $D3AF
  $D3AF,$01 #REGa=#REGc.
  $D3B0,$03 #REGa-=*#REGix+#N$0D.
  $D3B3,$02 Jump to #R$D3C1 if the result is zero.
  $D3B5,$02 Compare #REGa with #N$FF.
  $D3B7,$01 Stash #REGaf on the stack.
  $D3B8,$03 Call #R$D3EA if #REGa was equal to #N$FF on line #R$D3B3.
  $D3BB,$01 Restore #REGaf from the stack.
  $D3BC,$03 Call #R$D405 if #REGa was not equal to #N$FF on line #R$D3B3.
  $D3BF,$02 Jump to #R$D3CC.
  $D3C1,$06 Jump to #R$D3CC if #REGe is equal to *#REGix+#N$0B.
  $D3C7,$05 Call #R$D405 if #REGe is equal to #N$03.
  $D3CC,$01 #REGa=#REGb.
  $D3CD,$03 #REGa-=*#REGix+#N$0E.
  $D3D0,$02 Jump to #R$D3DE if the result is zero.
  $D3D2,$02 Compare #REGa with #N$FF.
  $D3D4,$01 Stash #REGaf on the stack.
  $D3D5,$03 Call #R$D445 if #REGa was equal to #N$FF on line #R$D3D2.
  $D3D8,$01 Restore #REGaf from the stack.
  $D3D9,$03 Call #R$D425 if #REGa was not equal to #N$FF on line #R$D3D2.
  $D3DC,$02 Jump to #R$D3E9.
  $D3DE,$06 Jump to #R$D3E9 if #REGd is equal to *#REGix+#N$0F.
  $D3E4,$05 Call #R$D425 if #REGd is equal to #N$03.
  $D3E9,$01 Return.

  $D3EA,$02 Stash #REGbc and #REGde on the stack.
  $D3EC,$03 #REGc=*#REGix+#N$0D.
  $D3EF,$03 #REGb=*#REGix+#N$0E.
  $D3F2,$03 #REGd=*#REGix+#N$08.
  $D3F5,$02 #REGe=#N$01.
  $D3F7,$07 Jump to #R$D3FF if *#REGix+#N$03 is equal to #N$03.
  $D3FE,$01 Increment #REGd by one.
  $D3FF,$03 Call #R$D33F.
  $D402,$02 Restore #REGde and #REGbc from the stack.
  $D404,$01 Return.

  $D405,$02 Stash #REGbc and #REGde on the stack.
  $D407,$03 #REGa=*#REGix+#N$0D.
  $D40A,$03 #REGc=*#REGix+#N$07.
  $D40D,$01 #REGa-=#REGc.
  $D40E,$01 #REGc=#REGa.
  $D40F,$03 #REGb=*#REGix+#N$0E.
  $D412,$03 #REGd=*#REGix+#N$08.
  $D415,$02 #REGe=#N$01.
  $D417,$07 Jump to #R$D41F if *#REGix+#N$03 is equal to #N$03.
  $D41E,$01 Increment #REGd by one.
  $D41F,$03 Call #R$D33F.
  $D422,$02 Restore #REGde and #REGbc from the stack.
  $D424,$01 Return.

  $D425,$02 Stash #REGbc and #REGde on the stack.
  $D427,$03 #REGa=*#REGix+#N$0E.
  $D42A,$03 #REGd=*#REGix+#N$08.
  $D42D,$01 #REGa-=#REGd.
  $D42E,$01 #REGb=#REGa.
  $D42F,$03 #REGe=*#REGix+#N$07.
  $D432,$03 #REGc=*#REGix+#N$0D.
  $D435,$02 #REGd=#N$01.
  $D437,$07 Jump to #R$D43F if *#REGix+#N$02 is equal to #N$03.
  $D43E,$01 Increment #REGe by one.
  $D43F,$03 Call #R$D33F.
  $D442,$02 Restore #REGde and #REGbc from the stack.
  $D444,$01 Return.

  $D445,$02 Stash #REGbc and #REGde on the stack.
  $D447,$03 #REGc=*#REGix+#N$0D.
  $D44A,$03 #REGb=*#REGix+#N$0E.
  $D44D,$02 #REGd=#N$01.
  $D44F,$03 #REGe=*#REGix+#N$07.
  $D452,$07 Jump to #R$D45A if *#REGix+#N$02 is equal to #N$03.
  $D459,$01 Increment #REGe by one.
  $D45A,$03 Call #R$D33F.
  $D45D,$02 Restore #REGde and #REGbc from the stack.
  $D45F,$01 Return.

c $D460 Goldfish Game: Print Sprite
@ $D460 label=GoldfishGame_PrintSprite
R $D460 A Sprite ID (where to begin)
R $D460 BC Print co-ordinates
R $D460 D Sprite height
R $D460 E Sprite width
  $D460,$01 Preserve #REGhl on the stack as it's not actively used.
N $D461 Store the Sprite ID. Note; it is incremented on each UDG character
. block being printed (see #R$D47F), hence why it's -#N$01 here.
  $D461,$04 Decrease the Spite ID by one and store it at *#R$DB3C.
  $D465,$04 Store the Sprite width at *#R$DB3B.
N $D469 Ensure that we're printing within the screen boundaries.
@ $D469 label=GoldfishGame_PrintSprite_Loop
  $D469,$06 Jump to #R$D49A if #REGc is lower than #N$02.
  $D46F,$04 #REGe=*#R$DB3B.
  $D473,$06 Jump to #R$D4AB if #REGc is higher than #N$22.
@ $D479 label=GoldfishGame_PrintSprite_At
  $D479,$02 Stash the print co-ordinates and the sprite height/ width on the stack.
N $D47B Set the current printing location.
  $D47B,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $D47E,$01 Restore the sprite height/ width from the stack, they're used here as loop counters.
N $D47F Action this sprite ID (+#N$01, and print it to the screen buffer).
@ $D47F label=GoldfishGame_PrintSprite_PrintUDG
  $D47F,$07 Increment *#R$DB3C by one.
  $D486,$03 Call #R$D353.
  $D489,$06 Call #R$D49C if #REGc is equal to #N$02.
N $D48F Keep track of where we're printing to on the screen.
  $D48F,$01 Move right one character block.
  $D490,$01 Decrease the sprite width counter by one.
  $D491,$02 Jump to #R$D47F until the sprite width counter is zero.
N $D493 A row of the sprite has been printed, so restore the screen position and move onto the next line.
  $D493,$01 Restore the current print co-ordinates from the stack.
  $D494,$01 Decrease the sprite height counter by one.
  $D495,$02 Jump to #R$D49A if the whole sprite has now finished printing.
  $D497,$01 Move down one row.
  $D498,$02 Jump to #R$D469.
N $D49A Housekeeping, and return.
@ $D49A label=GoldfishGame_PrintSprite_Return
  $D49A,$01 Restore #REGhl from the stack.
  $D49B,$01 Return.
  $D49C,$01 Decrease #REGe by one.
  $D49D,$01 Stash #REGaf on the stack.
  $D49E,$01 Increment #REGe by one.
  $D49F,$07 Increment *#R$DB3C by one.
  $D4A6,$01 Restore #REGaf from the stack.
  $D4A7,$01 Return if #REGa  is zero.
  $D4A8,$01 Decrease #REGe by one.
  $D4A9,$02 Jump to #R$D49C.
N $D4AB Try to discover the printable part of the sprite.
@ $D4AB label=GoldfishGame_FindViewableSprite
  $D4AB,$07 Increment *#R$DB3C by one.
  $D4B2,$01 Decrease the sprite width counter by one.
  $D4B3,$03 Jump to #R$D49A if the sprite width counter is zero.
  $D4B6,$01 Move right one character block.
  $D4B7,$05 Jump to #R$D479 if #REGc is higher than #N$22.
  $D4BC,$02 Keep looping back to #R$D4AB until we either return if this is
. invalid, or find a printable part of the sprite.

c $D4BE Clear Screen
@ $D4BE label=ClearScreen
N $D4BE The whole screen is #N$18 lines.
N $D4BE #HTML(Will use the colour set at <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C8D.html">ATTR_P</a>.)
  $D4BE,$05 #HTML(Clear the bottom #N$18 lines using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0E44.html">CL_LINE</a>.)
  $D4C3,$01 Return.

c $D4C4 Player: Move Right
@ $D4C4 label=PlayerMoveRight
  $D4C4,$03 Decrease *#REGix+#N$04 by one.
  $D4C7,$01 Return.

c $D4C8 Player: Move Left
@ $D4C8 label=PlayerMoveLeft
  $D4C8,$03 Increment *#REGix+#N$04 by one.
  $D4CB,$01 Return.

c $D4CC
  $D4CC,$04 #REGix=#R$DC0E.
  $D4D0,$06 Set PAPER: #N$01.
  $D4D6,$07 Jump to #R$D4E1 if *#REGix+#N$05 is equal to #N$00.
  $D4DD,$04 Write #N$04 to *#REGix+#N$04.
  $D4E1,$03 Call #R$D616.
  $D4E4,$06 Jump to #R$D547 if #REGc is equal to #N$19.
  $D4EA,$05 Jump to #R$D547 if #REGc is equal to #N$0D.
  $D4EF,$06 Jump to #R$D547 if #REGb is equal to #N$11.
  $D4F5,$05 Jump to #R$D547 if #REGb is equal to #N$05.
  $D4FA,$06 Jump to #R$D50C if #REGc is not equal to *#REGix+#N$00.
  $D500,$06 Jump to #R$D50C if #REGb is not equal to *#REGix+#N$01.
  $D506,$06 Jump to #R$D50C if *#REGix+#N$03 is equal to #REGd.
  $D50C,$03 Write #REGc to *#REGix+#N$00.
  $D50F,$03 Write #REGb to *#REGix+#N$01.
  $D512,$03 Write #REGe to *#REGix+#N$02.
  $D515,$03 Write #REGd to *#REGix+#N$03.
  $D518,$01 Stash #REGde on the stack.
  $D519,$03 Call #R$D3AF.
  $D51C,$01 Restore #REGde from the stack.
  $D51D,$03 Write #REGe to *#REGix+#N$02.
  $D520,$03 Write #REGd to *#REGix+#N$03.
  $D523,$03 Does nothing, this is immediately overwritten on the next line.
  $D526,$06 #HTML(Write #R$9FEC(#N$9EEC) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $D52C,$03 Call #R$D647.
  $D52F,$03 #REGa=*#REGix+#N$00.
  $D532,$03 Write #REGa to *#REGix+#N$0D.
  $D535,$03 #REGa=*#REGix+#N$01.
  $D538,$03 Write #REGa to *#REGix+#N$0E.
  $D53B,$03 #REGa=*#REGix+#N$03.
  $D53E,$03 Write #REGa to *#REGix+#N$0F.
  $D541,$03 #REGa=*#REGix+#N$02.
  $D544,$03 Write #REGa to *#REGix+#N$0B.
  $D547,$04 Write #N$00 to *#REGix+#N$04.
  $D54B,$04 Write #N$00 to *#REGix+#N$05.
  $D54F,$01 Return.

c $D550
  $D550,$0B Write #N($0000,$04,$04) to: #LIST { *#R$DC12/ *#R$DC13 } { *#R$DB42 } LIST#
  $D55B,$01 Return.

c $D55C Controls: Kempston Joystick
@ $D55C label=Controls_KempstonJoystick
  $D55C,$02 Read from the Kempston joystick port.
  $D55E,$01 Stash the control on the stack.
  $D55F,$05 If left has been pressed, call #R$D4C8.
  $D564,$02 Restore the current control but keep it on the stack.
  $D566,$05 If down has been pressed, call #R$D5C7.
  $D56B,$02 Restore the current control but keep it on the stack.
  $D56D,$05 If up has been pressed, call #R$D5CB.
  $D572,$01 Restore the current control from the stack.
  $D573,$05 If right has been pressed, call #R$D4C4.
  $D578,$01 Return.

c $D579 Action: Player Controls
@ $D579 label=Action_PlayerControls
  $D579,$04 #REGix=#R$DC0E.
  $D57D,$08 Jump to #R$D55C if *#R$5BEA is set to Kempston joystick (#N$0C).
  $D585,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/028E.html">KEY_SCAN</a>.)
  $D588,$01 #REGa=the keypress.
  $D589,$07 Jump to #R$D4C8 if #REGa is equal to *#R$5BEB.
  $D590,$05 Jump to #R$D4C4 if #REGa is equal to *#R$5BEC.
  $D595,$05 Jump to #R$D5CB if #REGa is equal to *#R$5BED.
  $D59A,$05 Jump to #R$D5C7 if #REGa is equal to *#R$5BEE.
  $D59F,$01 Return.

c $D5A0
  $D5A0,$05 #HTML(Write #N$02 to <a href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C6B.html">DF_SZ</a>.)
  $D5A5,$01 Restore #REGbc from the stack.
  $D5A6,$01 Switch to the shadow registers.
  $D5A7,$01 Restore #REGhl' from the stack.
  $D5A8,$01 Switch back to the normal registers.
N $D5A9 Restore the default ZX Spectrum font.
  $D5A9,$03 #HTML(#REGhl=<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/3D00.html">#N$3C00</a> (CHARSET-#N$100).)
  $D5AC,$03 #HTML(Write #REGhl to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $D5AF,$01 Return.

c $D5B0 Toggle Sound
@ $D5B0 label=ToggleSound
  $D5B0,$07 Jump to #R$D5BF if *#R$FFF8 is equal to #N$00.
  $D5B7,$05 Write OFF (#N$00) to *#R$FFF8.
  $D5BC,$03 Jump to #R$D5D6.
@ $D5BF label=ToggleSoundOn
  $D5BF,$05 Write ON (#N$01) to *#R$FFF8.
  $D5C4,$03 Jump to #R$D5D6.

c $D5C7 Player: Move Down
@ $D5C7 label=PlayerMoveDown
  $D5C7,$03 Decrease *#REGix+#N$05 by one.
  $D5CA,$01 Return.

c $D5CB Player: Move Up
@ $D5CB label=PlayerMoveUp
  $D5CB,$03 Increment *#REGix+#N$05 by one.
  $D5CE,$01 Return.

c $D5CF Menu Keypress
@ $D5CF label=MenuKeypress
N $D5CF #HTML(Use <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/5C78.html">FRAMES</a> as a timer.)
  $D5CF,$07 #HTML(Reset *<a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/5C78.html">FRAMES</a> to #N($0000,$04,$04).)
@ $D5D6 label=MenuKeypress_Loop
  $D5D6,$04 #HTML(#REGbc=*<a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/5C78.html">FRAMES</a>.)
  $D5DA,$06 #HTML(Jump to #R$D602 if the timer held by <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/5C78.html">FRAMES</a> is up.)
  $D5E0,$03 Call #R$D3A6 (presumably to debounce).
N $D5E3 Fetch the players pressed key (if any) and handle it.
N $D5E3 No keys being pressed returns a #N$FF response.
  $D5E3,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/028E.html">KEY_SCAN</a>.)
  $D5E6,$06 Jump to #R$D5B0 if the fire button has been pressed.
  $D5EC,$03 Return if any button has been pressed.
  $D5EF,$08 Jump to #R$D5F9 if *#R$5BEA is set to Kempston joystick (#N$0C).
  $D5F7,$02 Jump to #R$D5D6.
N $D5F9 Handle checking if the player has pressed fire on their Kempston joystick.
@ $D5F9 label=MenuKeypress_Kempston
  $D5F9,$02 Read from the Kempston joystick port.
  $D5FB,$02,b$01 Keep only bit 4.
  $D5FD,$02 Jump to #R$D5D6 if the result is zero.
M $D5FB,$04 Jump to #R$D5D6 if fire has not been pressed.
  $D5FF,$02 #REGa=#N$23.
  $D601,$01 Return.

c $D602
  $D602,$01 Restore #REGbc from the stack.
  $D603,$05 Write #N$03 to #R$5BF0.
  $D608,$03 Call #R$DEA8.
  $D60B,$03 Jump to #R$CD86.

c $D60E Print String
@ $D60E label=PrintString
R $D60E DE Pointer to string data
  $D60E,$01 Fetch a character from the string data pointer.
  $D60F,$01 Increment the string data pointer by one.
  $D610,$03 Return if the current character is equal to #N$FF (the terminator).
  $D613,$01 #HTML(Print to the screen using RST <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0010.html">#N$10</a>.)
  $D614,$02 Jump to #R$D60E.

c $D616
  $D616,$03 #REGc=*#REGix+#N$00.
  $D619,$03 #REGb=*#REGix+#N$01.
  $D61C,$03 #REGe=*#REGix+#N$02.
  $D61F,$03 #REGd=*#REGix+#N$03.
  $D622,$03 #REGa=*#REGix+#N$04.
  $D625,$01 #REGa+=#REGe.
  $D626,$04 Jump to #R$D630 if #REGa is higher than #N$80.
  $D62A,$04 Jump to #R$D633 if #REGa is lower than #N$04.
  $D62E,$02 Increment #REGc by two.
  $D630,$01 Decrease #REGc by one.
  $D631,$02,b$01 Keep only bits 0-1.
  $D633,$01 #REGe=#REGa.
  $D634,$03 #REGa=*#REGix+#N$05.
  $D637,$01 #REGa+=#REGd.
  $D638,$04 Jump to #R$D642 if #REGa is higher than #N$80.
  $D63C,$04 Jump to #R$D645 if #REGa is lower than #N$04.
  $D640,$02 Increment #REGb by two.
  $D642,$01 Decrease #REGb by one.
  $D643,$02,b$01 Keep only bits 0-1.
  $D645,$01 #REGd=#REGa.
  $D646,$01 Return.

c $D647
  $D647,$03 #REGde=#R$A0EC.
  $D64A,$03 #REGhl=#R$A06C.
  $D64D,$03 #REGbc=#N($0080,$04,$04).
  $D650,$02 Copy #N($0080,$04,$04) bytes of data from #R$A06C to #R$A0EC.
  $D652,$07 Set INK: *#REGix+#N$09.
  $D659,$03 #HTML(#REGhl=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $D65C,$01 Stash #REGhl on the stack.
  $D65D,$02 Stash #REGiy on the stack.
  $D65F,$02 Stash #REGix on the stack.
  $D661,$03 #REGe=*#REGix+#N$06.
  $D664,$02 #REGd=#N$00.
  $D666,$02 Shift #REGe left (with carry).
  $D668,$02 Rotate #REGd left.
  $D66A,$02 Shift #REGe left (with carry).
  $D66C,$02 Rotate #REGd left.
  $D66E,$02 Shift #REGe left (with carry).
  $D670,$02 Rotate #REGd left.
M $D661,$11 #REGde=(*#REGix+#N$06)*#N$08.
  $D672,$01 #REGhl+=#REGde.
  $D673,$03 #REGb=*#REGix+#N$02.
  $D676,$01 Increment #REGb by one.
  $D677,$02 #REGc=#N$00.
  $D679,$04 Write #REGbc to *#R$DB38.
  $D67D,$03 #REGe=*#REGix+#N$07.
  $D680,$03 #REGd=*#REGix+#N$08.
  $D683,$01 #REGa=#REGd.
  $D684,$01 Increment #REGa by one.
  $D685,$06 Shift #REGa left three positions (with carry).
  $D68B,$01 #REGc=#REGa.
  $D68C,$02 #REGb=#N$00.
  $D68E,$04 #REGiy=#R$A0F4.
  $D692,$02 #REGiy+=#REGbc.
  $D694,$01 #REGc=#REGe.
  $D695,$06 Shift #REGc left three positions (with carry).
  $D69B,$02 #REGb=#N$00.
  $D69D,$04 Write #REGbc to *#R$DB36.
  $D6A1,$04 #REGix=#R$A0F4.
  $D6A5,$03 Stash #REGhl, #REGde and #REGhl on the stack.
  $D6A8,$02 #REGb=#N$08.
  $D6AA,$01 Stash #REGbc on the stack.
  $D6AB,$01 #REGa=*#REGhl.
  $D6AC,$04 #REGbc=*#R$DB38.
  $D6B0,$02 Shift #REGa left (with carry).
  $D6B2,$02 Rotate #REGc left.
  $D6B4,$02 Shift #REGa left (with carry).
  $D6B6,$02 Rotate #REGc left.
  $D6B8,$02 Decrease counter by one and loop back to #R$D6B0 until counter is zero.
  $D6BA,$03 Write #REGa to *#REGiy+#N$00.
  $D6BD,$01 #REGa=#REGc.
  $D6BE,$03 Merge the bits from *#REGix+#N$00.
  $D6C1,$03 Write #REGa to *#REGix+#N$00.
  $D6C4,$01 Increment #REGhl by one.
  $D6C5,$02 Increment #REGix by one.
  $D6C7,$02 Increment #REGiy by one.
  $D6C9,$01 Restore #REGbc from the stack.
  $D6CA,$02 Decrease counter by one and loop back to #R$D6AA until counter is zero.
  $D6CC,$01 Restore #REGhl from the stack.
  $D6CD,$04 #REGbc=*#R$DB36.
  $D6D1,$01 #REGhl+=#REGbc.
  $D6D2,$01 Decrease #REGd by one.
  $D6D3,$02 Jump to #R$D6A7 until #REGd is zero.
  $D6D5,$01 Restore #REGde from the stack.
  $D6D6,$03 #REGbc=#N($0008,$04,$04).
  $D6D9,$02 #REGix+=#REGbc.
  $D6DB,$02 #REGiy+=#REGbc.
  $D6DD,$01 Restore #REGhl from the stack.
  $D6DE,$01 #REGhl+=#REGbc.
  $D6DF,$01 Decrease #REGe by one.
  $D6E0,$02 Jump to #R$D6A5 until #REGe is zero.
  $D6E2,$03 #REGhl=#R$9FEC.
  $D6E5,$02 Restore #REGix from the stack.
  $D6E7,$03 #REGa=*#REGix+#N$03.
  $D6EA,$01 Increment #REGa by one.
  $D6EB,$02 Shift #REGa left (with carry).
  $D6ED,$01 #REGe=#REGa.
  $D6EE,$02 #REGd=#N$00.
  $D6F0,$01 #REGhl+=#REGde.
  $D6F1,$03 #HTML(Write #REGhl to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $D6F4,$03 #REGd=*#REGix+#N$08.
  $D6F7,$03 #REGe=*#REGix+#N$07.
  $D6FA,$07 Jump to #R$D702 if *#REGix+#N$02 is equal to #N$03.
  $D701,$01 Increment #REGe by one.
  $D702,$01 Increment #REGd by one.
  $D703,$01 #REGa=#REGd.
  $D704,$03 Write #REGa to *#R$DB38.
  $D707,$07 Jump to #R$D70F if #N$03 is not equal to *#REGix+#N$03.
  $D70E,$01 Decrease #REGd by one.
  $D70F,$03 #REGb=*#REGix+#N$01.
  $D712,$03 #REGc=*#REGix+#N$00.
  $D715,$01 #REGa=#REGd.
  $D716,$02 #REGa=#N$20.
  $D718,$02 Restore #REGiy from the stack.
  $D71A,$02 #REGa=#N$20.
  $D71C,$03 Stash #REGaf, #REGde and #REGbc on the stack.
  $D71F,$01 #REGd=#REGa.
  $D720,$05 Jump to #R$D759 if #REGc is higher than #N$22.
  $D725,$01 Stash #REGde on the stack.
  $D726,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $D729,$02 Restore #REGde and #REGbc from the stack.
  $D72B,$01 Stash #REGbc on the stack.
  $D72C,$01 #REGa=#REGd.
  $D72D,$03 Call #R$D353.
  $D730,$01 #REGa=#REGc.
  $D731,$02 Compare #REGa with #N$02.
  $D733,$03 Call #R$D74C zero.
  $D736,$01 Decrease #REGc by one.
  $D737,$05 #REGd+=*#R$DB38.
  $D73C,$01 Decrease #REGe by one.
  $D73D,$02 Jump to #R$D72D until #REGe is zero.
  $D73F,$03 Restore #REGbc, #REGde and #REGaf from the stack.
  $D742,$01 Decrease #REGb by one.
  $D743,$01 Increment #REGa by one.
  $D744,$01 Decrease #REGd by one.
  $D745,$02 Jump to #R$D71C until #REGd is zero.
  $D747,$01 Restore #REGhl from the stack.
  $D748,$03 #HTML(Write #REGhl to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $D74B,$01 Return.
  $D74C,$01 Decrease #REGe by one.
  $D74D,$01 Stash #REGaf on the stack.
  $D74E,$01 Increment #REGe by one.
  $D74F,$01 Restore #REGaf from the stack.
  $D750,$01 Return if #REGe is zero.
  $D751,$01 Decrease #REGe by one.
  $D752,$05 #REGd+=*#R$DB38.
  $D757,$02 Jump to #R$D74C.
  $D759,$05 #REGd+=*#R$DB38.
  $D75E,$01 Decrease #REGe by one.
  $D75F,$03 Jump to #R$D76B if #REGe is zero.
  $D762,$01 Decrease #REGc by one.
  $D763,$05 Jump to #R$D759 if #REGc is higher than #N$22.
  $D768,$03 Jump to #R$D725.
  $D76B,$03 Restore #REGbc, #REGbc and #REGbc from the stack.
  $D76E,$03 Jump to #R$D747.

c $D771
  $D771,$04 Write #N$00 to *#REGix+#N$0A.
  $D775,$03 Jump to #R$D7DE.

c $D778
  $D778,$06 Set PAPER: #N$01.
  $D77E,$04 #REGix=#R$DB46.
  $D782,$01 Stash #REGbc on the stack.
  $D783,$08 Jump to #R$D7E7 if *#REGix+#N$0A is equal to #N$00.
  $D78B,$03 #REGl=*#REGix+#N$10.
  $D78E,$03 #REGh=*#REGix+#N$11.
  $D791,$03 #HTML(Write #REGhl to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $D794,$07 Set INK: *#REGix+#N$09.
  $D79B,$03 #REGa=*#REGix+#N$06.
  $D79E,$03 #REGa+=*#REGix+#N$12.
  $D7A1,$05 Jump to #R$D7A8 if #REGa is not equal to *#REGix+#N$13.
  $D7A6,$05 Write #N$20 to *#REGix+#N$06.
  $D7AB,$03 Call #R$D616.
  $D7AE,$03 Write #REGc to *#REGix+#N$00.
  $D7B1,$03 Write #REGb to *#REGix+#N$01.
  $D7B4,$03 Write #REGe to *#REGix+#N$02.
  $D7B7,$03 Write #REGd to *#REGix+#N$03.
  $D7BA,$03 Call #R$D3AF.
  $D7BD,$06 Jump to #R$D771 if #REGc is equal to #N$01.
  $D7C3,$03 Call #R$D647.
  $D7C6,$06 Write *#REGix+#N$00 to *#REGix+#N$0D.
  $D7CC,$06 Write *#REGix+#N$01 to *#REGix+#N$0E.
  $D7D2,$06 Write *#REGix+#N$02 to *#REGix+#N$0B.
  $D7D8,$06 Write *#REGix+#N$03 to *#REGix+#N$0F.
  $D7DE,$03 #REGde=#N($0018,$04,$04).
  $D7E1,$02 #REGix+=#REGde.
  $D7E3,$01 Restore #REGbc from the stack.
  $D7E4,$02 Decrease counter by one and loop back to #R$D782 until counter is zero.
  $D7E6,$01 Return.

  $D7E7,$03 Call #R$D8D4.
  $D7EA,$02,b$01 Keep only bits 0-2.
  $D7EC,$02 #REGa-=#N$02.
  $D7EE,$04 Jump to #R$D7F4 if #REGa is lower than #N$05.
  $D7F2,$02 #REGa=#N$04.
  $D7F4,$01 #REGe=#REGa.
  $D7F5,$02 #REGd=#N$00.
  $D7F7,$06 Shift #REGe left three positions (with carry).
  $D7FD,$01 Stash #REGde on the stack.
  $D7FE,$01 Restore #REGhl from the stack.
  $D7FF,$02 Shift #REGe left (with carry).
  $D801,$02 Rotate #REGd left.
  $D803,$01 #REGhl+=#REGde.
  $D804,$03 #REGde=#R$D93E.
  $D807,$01 #REGhl+=#REGde.
  $D808,$02 Stash #REGix on the stack.
  $D80A,$01 Restore #REGde from the stack.
  $D80B,$03 #REGbc=#N($0018,$04,$04).
  $D80E,$02 LDIR.
  $D810,$03 Call #R$D8D4.
  $D813,$02,b$01 Keep only bits 0-3.
  $D815,$02 #REGa+=#N$06.
  $D817,$04 Jump to #R$D810 if #REGa is higher than #N$11.
  $D81B,$02 Reset bit 0 of #REGa.
  $D81D,$03 Write #REGa to *#REGix+#N$01.
  $D820,$03 Write #REGa to *#REGix+#N$0E.
  $D823,$02 Stash #REGiy on the stack.
  $D825,$04 #REGiy=#R$DB46.
  $D829,$01 #REGl=#REGa.
  $D82A,$04 #REGbc=*#R$DD98.
  $D82E,$07 Jump to #R$D843 if *#REGiy+#N$0A is equal to #N$00.
  $D835,$06 Jump to #R$D843 if *#REGiy+#N$01 is not equal to #REGl.
  $D83B,$08 Jump to #R$D867 if *#REGiy+#N$00 is higher than #N$0F.
  $D843,$03 #REGde=#N($0018,$04,$04).
  $D846,$02 #REGiy+=#REGde.
  $D848,$02 Decrease counter by one and loop back to #R$D82E until counter is zero.
  $D84A,$02 Restore #REGiy from the stack.
  $D84C,$05 Write #N$01 to *#REGix+#N$0A.
  $D851,$05 #REGa=#N$22+*#REGix+#N$07.
  $D856,$03 Write #REGa to *#REGix+#N$00.
  $D859,$03 Write #REGa to *#REGix+#N$0D.
  $D85C,$04 Write #N$01 to *#REGix+#N$02.
  $D860,$04 Write #N$01 to *#REGix+#N$0B.
  $D864,$03 Jump to #R$D7DE.
  $D867,$02 Restore #REGiy from the stack.
  $D869,$03 Jump to #R$D7DE.
  $D86C,$02 Restore #REGix from the stack.
  $D86E,$01 Return.

b $D86F
  $D86F,$01

c $D870 Goldfish Game: Print Boats
@ $D870 label=GoldfishGame_PrintBoats
N $D870 Set attributes.
  $D870,$05 Set INK: #N$00.
  $D875,$06 Set PAPER: #N$07.
N $D87B Graphics are created like fonts, they are 8x8 pixel UDG character blocks arranged sequentially into grids.
  $D87B,$06 #HTML(Write #R$99EC(#N$98EC) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
N $D881 Start fetching UDGs from #R$99EC.
  $D881,$02 #REGa=initial sprite ID: #N$20.
  $D883,$04 Print co-ordinates: #N$0F/ #N$18.
  $D887,$04 Width and height: #N$0C/ #N$08.
  $D88B,$03 Call #R$D460.
  $D88E,$06 #HTML(Write #R$9CEC(#N$9BEC) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
N $D894 Start fetching UDGs from #R$9CEC.
  $D894,$02 #REGa=initial sprite ID: #N$20.
  $D896,$04 Print co-ordinates: #N$21/ #N$18.
  $D89A,$04 Width and height: #N$0C/ #N$08.
  $D89E,$03 Call #R$D460.
  $D8A1,$01 Return.

c $D8A2 Goldfish Game: Animate Boats
@ $D8A2 label=GoldfishGame_AnimateBoats
N $D8A2 #PUSHS #UDGTABLE {
.   #SIM(start=$CD63,stop=$CD6C)#SIM(start=$CE61,stop=$CF0B)
.   #FOR$01,$50||x|#SIM(start=$CF47,stop=$CF4E)#SIM(start=$D8A8,stop=$D8D3)
.     #SCR$02,$00,$00,$20,$09(*boats-x)#PLOT(0,0,0)(boats-x)
.   ||
.   #UDGARRAY#(#ANIMATE$23(boats))
. } UDGTABLE# #POPS
  $D8A2,$03 #REGa=*#R$D93D.
  $D8A5,$02,b$01 Keep only bit 0.
  $D8A7,$01 Return if the result is zero.
  $D8A8,$03 #REGde=#R$4000(#N$4000) (screen buffer location).
  $D8AB,$02 #REGb=#N$08.
  $D8AD,$02 Stash #REGbc and #REGde on the stack.
  $D8AF,$02 #REGb=#N$08.
  $D8B1,$02 Stash #REGbc and #REGde on the stack.
  $D8B3,$01 #REGa=*#REGde.
  $D8B4,$02 Rotate #REGa left.
  $D8B6,$01 Stash #REGaf on the stack.
  $D8B7,$03 #REGhl=#N($001F,$04,$04).
  $D8BA,$01 #REGhl+=#REGde.
  $D8BB,$02 #REGb=#N$20.
  $D8BD,$01 Restore #REGaf from the stack.
  $D8BE,$02 Rotate *#REGhl left.
  $D8C0,$01 Stash #REGaf on the stack.
  $D8C1,$01 Decrease #REGhl by one.
  $D8C2,$02 Decrease counter by one and loop back to #R$D8BD until counter is zero.
  $D8C4,$02 Restore #REGaf and #REGde from the stack.
  $D8C6,$03 #REGhl=#N($0020,$04,$04).
  $D8C9,$01 #REGhl+=#REGde.
  $D8CA,$01 Exchange the #REGde and #REGhl registers.
  $D8CB,$01 Restore #REGbc from the stack.
  $D8CC,$02 Decrease counter by one and loop back to #R$D8B1 until counter is zero.
  $D8CE,$02 Restore #REGde and #REGbc from the stack.
  $D8D0,$01 Increment #REGd by one.
  $D8D1,$02 Decrease counter by one and loop back to #R$D8AD until counter is zero.
  $D8D3,$01 Return.

c $D8D4 Update Animation Counter
@ $D8D4 label=UpdateAnimationCounter
N $D8D4 This routine simply updates *#R$D86F with (*#R$D86F*#N$05)+#N$01.
  $D8D4,$03 #REGa=*#R$D86F.
  $D8D7,$01 #REGb=#REGa.
  $D8D8,$01 Increment #REGb by one.
  $D8D9,$04 Shift #REGa left two positions (with carry).
  $D8DD,$01 #REGa+=#REGb.
  $D8DE,$03 Write #REGa to *#R$D86F.
  $D8E1,$01 Return.

c $D8E2 Goldfish Game: Animate Sand
@ $D8E2 label=GoldfishGame_AnimateSand
N $D8E2 #PUSHS #UDGTABLE {
.   #SIM(start=$CD63,stop=$CD6C)#SIM(start=$CE61,stop=$CF08)
.   #FOR$01,$50||x|#SIM(start=$D8E2,stop=$D929)
.     #SCR$02,$00,$13,$20,$03(*sand-x)#PLOT(0,0,0)(sand-x)
.   ||
.   #UDGARRAY#(#ANIMATE$0F(sand))
. } UDGTABLE# #POPS
N $D8E2 Set the attributes.
  $D8E2,$06 Set PAPER: #N$01.
  $D8E8,$06 #HTML(Write #R$DC22(#N$DB22) (#R$DC22) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $D8EE,$06 Set INK: #N$06.
N $D8F4 Set the co-ordinates of where we're going to PRINT AT.
  $D8F4,$07 #HTML(Set up the screen buffer location #N$21/#N$04 using <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
N $D8FB Print the current sand UDGs to the screen buffer.
  $D8FB,$02 #REGa=#N$20 (base sprite ID).
@ $D8FD label=PrintSand_Loop
  $D8FD,$01 Stash the current sand sprite ID on the stack.
  $D8FE,$03 Call #R$D353.
  $D901,$01 Restore the current sand sprite ID from the stack.
  $D902,$01 Move onto the next sand sprite ID.
  $D903,$04 Keep looping back to #R$D8FD until the sand sprite ID is equal to #N$40.
N $D907 Now move all the UDGs one pixel to the right. The next time this
. routine is called, the sand will appear to have moved when it's printed to
. the screen.
  $D907,$03 #REGde=#R$DC22.
  $D90A,$02 #REGb=#N$08 (line counter; each sand UDG is #N$08 bytes).
@ $D90C label=AnimateSandLine_Loop
  $D90C,$02 Stash the line counter and the sand UDG buffer pointer on the stack.
  $D90E,$04 #REGhl=#REGde+#N($00F8,$04,$04).
  $D912,$01 #REGa=*#REGhl.
  $D913,$01 Rotate #REGa right one position.
  $D914,$01 Restore the sand buffer pointer from the stack.
  $D915,$01 But keep a copy of it (the sand buffer position) on the stack still.
  $D916,$03 #REGde=#N($0008,$04,$04).
  $D919,$02 #REGb=#N$20 (UDG counter; the total number of sand UDGs in the row).
  $D91B,$01 Stash #REGaf on the stack.
@ $D91C label=AnimateSandUDG_Loop
  $D91C,$01 Restore #REGaf from the stack.
  $D91D,$02 Rotate *#REGhl right.
  $D91F,$01 Stash #REGaf on the stack.
  $D920,$01 #REGhl+=#REGde.
  $D921,$02 Decrease counter by one and loop back to #R$D91C until counter is zero.
  $D923,$02 Restore #REGaf and #REGde from the stack.
  $D925,$01 Increment #REGde by one.
  $D926,$01 Restore the line counter from the stack.
  $D927,$02 Decrease the line counter by one and loop back to #R$D90C until all lines have been rotated.
  $D929,$01 Return.

c $D92A
  $D92A,$04 #REGix=#R$DC0E.
  $D92E,$03 #REGa=*#REGix+#N$06.
  $D931,$02 #REGa+=#N$02.
  $D933,$04 Jump to #R$D939 if #REGa is not equal to #N$30.
  $D937,$02 #REGa=#N$20.
  $D939,$03 Write #REGa to *#REGix+#N$06.
  $D93C,$01 Return.

g $D93D Goldfish Game: Buoyancy Counter
@ $D93D label=GoldfishGame_BuoyancyCounter
D $D93D This value is incremented every frame, and every 4th frame will cause the player to rise.
B $D93D,$01

w $D93E

t $D9B6 Messaging: Release Joystick
@ $D9B6 label=Messaging_ReleaseJoystick
B $D9B6,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
B $D9B9,$02 PAPER: #N(#PEEK(#PC+$01)).
B $D9BB,$02 INK: #N(#PEEK(#PC+$01)).
B $D9BD,$02 FLASH: #MAP(#PEEK(#PC+$01))(OFF,1:ON).
  $D9BF,$10 "#STR(#PC,$04,$10)".
B $D9CF,$02 FLASH: #MAP(#PEEK(#PC+$01))(OFF,1:ON).
  $D9D1,$01 Terminator.

t $D9D2 Messaging: Fish Game Status Bar
@ $D9D2 label=Messaging_FishGameStatusBar
B $D9D2,$02 PAPER: #N(#PEEK(#PC+$01)).
B $D9D4,$02 INK: #N(#PEEK(#PC+$01)).
  $D9D6,$26 "#STR(#PC,$04,$20)".
  $D9FC,$01 Terminator.

t $D9FD Messaging: Title Screen
@ $D9FD label=Messaging_TitleScreen
B $D9FD,$02 PAPER: #N(#PEEK(#PC+$01)).
B $D9FF,$02 INK: #N(#PEEK(#PC+$01)).
B $DA01,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
  $DA04,$07 "#STR(#PC,$04,$07)".
B $DA0B,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
  $DA0E,$12 "#STR(#PC,$04,$12)".
B $DA20,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
  $DA23,$16 "#STR(#PC,$04,$16)".
B $DA39,$01 Terminator.

t $DA3A Messaging: Menu Item - Keyboard
@ $DA3A label=Messaging_MenuKeyboard
B $DA3A,$02 INK: #N(#PEEK(#PC+$01)).
B $DA3C,$02 PAPER: #N(#PEEK(#PC+$01)).
B $DA3E,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
  $DA41,$0C "#STR(#PC,$04,$0C)".
B $DA4D,$02 INVERSE: #MAP(#PEEK(#PC+$01))(OFF,1:ON).
B $DA4F,$01 Terminator.

t $DA50 Messaging: Menu Item - Interface 2 Joystick
@ $DA50 label= Messaging_MenuInterface2Joystick
B $DA50,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
  $DA53,$18 "#STR(#PC,$04,$18)".
B $DA6B,$02 INVERSE: #MAP(#PEEK(#PC+$01))(OFF,1:ON).
B $DA6D,$01 Terminator.

t $DA6E Messaging: Menu Item - Cursor Joystick
@ $DA6E label=Messaging_MenuCursorJoystick
B $DA6E,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
  $DA71,$13 "#STR(#PC,$04,$13)".
B $DA84,$02 INVERSE: #MAP(#PEEK(#PC+$01))(OFF,1:ON).
B $DA86,$01 Terminator.

t $DA87 Messaging: Menu Item - Kempston Joystick
@ $DA87 label=Messaging_MenuKempstonJoystick
B $DA87,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
  $DA8A,$15 "#STR(#PC,$04,$15)".
B $DA9F,$02 INVERSE: #MAP(#PEEK(#PC+$01))(OFF,1:ON).
B $DAA1,$01 Terminator.

t $DAA2 Messaging: Menu Item - Define Keys
@ $DAA2 label=Messaging_MenuDefineKeys
B $DAA2,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
  $DAA5,$0F "#STR(#PC,$04,$0F)".
B $DAB4,$02 INVERSE: #MAP(#PEEK(#PC+$01))(OFF,1:ON).
B $DAB6,$01 Terminator.

t $DAB7 Messaging: Menu Item - Start Game
@ $DAB7 label=Messaging_MenuStartGame
B $DAB7,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
  $DABA,$0E "#STR(#PC,$04,$0E)".
B $DAC8,$02 INVERSE: #MAP(#PEEK(#PC+$01))(OFF,1:ON).
B $DACA,$01 Terminator.

t $DACB Messaging: Define Keys
@ $DACB label=Messaging_DefineKeys
B $DACB,$02 PAPER: #N(#PEEK(#PC+$01)).
B $DACD,$02 INK: #N(#PEEK(#PC+$01)).
B $DACF,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
  $DAD2,$0B "#STR(#PC,$04,$0B)".
B $DADD,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
B $DAE0,$01 Terminator.

t $DAE1 Messaging: Left
@ $DAE1 label=Messaging_Left
B $DAE1,$02 INVERSE: #MAP(#PEEK(#PC+$01))(OFF,1:ON).
  $DAE3,$07 "#STR(#PC,$04,$07)".
B $DAEA,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
B $DAED,$01 Terminator.

t $DAEE Messaging: Right
@ $DAEE label=Messaging_Right
B $DAEE,$02 INVERSE: #MAP(#PEEK(#PC+$01))(OFF,1:ON).
  $DAF0,$08 "#STR(#PC,$04,$08)".
B $DAF8,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
B $DAFB,$01 Terminator.

t $DAFC Messaging: Up
@ $DAFC label=Messaging_Up
B $DAFC,$02 INVERSE: #MAP(#PEEK(#PC+$01))(OFF,1:ON).
  $DAFE,$05 "#STR(#PC,$04,$05)".
B $DB03,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
B $DB06,$01 Terminator.

t $DB07 Messaging: Down
@ $DB07 label=Messaging_Down
B $DB07,$02 INVERSE: #MAP(#PEEK(#PC+$01))(OFF,1:ON).
  $DB09,$07 "#STR(#PC,$04,$07)".
B $DB10,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
B $DB13,$01 Terminator.

t $DB14 Messaging: Enter Room/ Space Exits
@ $DB14 label=Messaging_EnterRoomSpaceExits
B $DB14,$02 INVERSE: #MAP(#PEEK(#PC+$01))(OFF,1:ON).
  $DB16,$0D "#STR(#PC,$04,$0D)".
B $DB23,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
B $DB26,$02 FLASH: #MAP(#PEEK(#PC+$01))(OFF,1:ON).
  $DB28,$0B "#STR(#PC,$04,$0B)".
B $DB33,$02 FLASH: #MAP(#PEEK(#PC+$01))(OFF,1:ON).
B $DB35,$01 Terminator.

g $DB36

g $DB38

g $DB3B Goldfish Game: Temporary Sprite Width
@ $DB3B label=GoldfishGame_TempSpriteWidth
B $DB3B,$01

g $DB3C Goldfish Game: Temporary Sprite ID
@ $DB3C label=GoldfishGame_TempSpriteID
B $DB3C,$01

b $DB3D

g $DB42 Goldfish Game: Numer Of Fish Caught
@ $DB42 label=GoldfishGame_FishCaught

u $DB43

g $DB44 Goldfish Game: Numer Of Fish Needed
@ $DB44 label=GoldfishGame_FishToCollect
D $DB44 The number of fish needed to complete the game; see #R$CE57.
B $DB44,$01

u $DB45

b $DB46
  $DB46,$64,$18

g $DC0E Goldfish Game: Player Attributes
@ $DC0E label=GoldfishGame_PlayerAttributes
B $DC0E,$01
B $DC0F,$01
B $DC10,$01
B $DC11,$01
@ $DC12 label=Player_X
B $DC12,$01 X co-ordinate.
@ $DC13 label=Player_Y
B $DC13,$01 Y co-ordinate.
B $DC14,$01
B $DC15,$01
B $DC16,$01
B $DC17,$01
B $DC18,$01
B $DC19,$01
B $DC1A,$01
B $DC1B,$01
B $DC1C,$01

g $DC22 Buffer: Sand Animation (Goldfish Game)
@ $DC22 label=Buffer_SandAnimation
D $DC22 Populated by #R$CEE6.
B $DC22,$108,$08

g $DD2A Data: Bubbles (Goldfish Game)
@ $DD2A label=Data_Bubbles
B $DD2A,$01 X Position.
B $DD2B,$01 Y Position.
B $DD2F,$01 Horizontal velocity.
B $DD34,$01 State: #TABLE(default,centre,centre) { =h Byte | =h State } { #N$00 | Inactive } { #N$01 | Active } TABLE#
L $DD2A,$0B,$0A

b $DD98
  $DD98,$02

t $DD9A Messaging: Goldfish Game
@ $DD9A label=Messaging_GoldfishGame
B $DD9A,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
  $DD9D,$1A "#STR(#PC,$04,$1A)".
B $DDB7,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
  $DDBA,$11 "#STR(#PC,$04,$11)".
B $DDCB,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
  $DDCE,$17 "#STR(#PC,$04,$17)".
B $DDE5,$03 PRINT AT: #N(#PEEK(#PC+$01)), #N(#PEEK(#PC+$02)).
  $DDE8,$20 "#STR(#PC,$04,$20)".
B $DE08,$01 Terminator.

u $DE09

c $DEA8 Initialise Game
@ $DEA8 label=InitialiseGame
  $DEA8,$08 Jump to #R$DEBC if *#R$5BF0 is equal to #N$02.
  $DEB0,$05 Write #N$03 to *#R$5BF1.
  $DEB5,$07 Write #N($0000,$04,$04) to *#R$5BF4.
  $DEBC,$04 Write #N$00 to *#R$5BD3.
  $DEC0,$07 Write #N($007D,$04,$04) to *#R$5BF2.
  $DEC7,$02 Jump to #R$DECE.
  $DEC9,$05 Write #N$01 to *#R$5BD3.
  $DECE,$03 #REGde=#R$F231.
  $DED1,$03 #REGhl=#R$F245.
  $DED4,$03 #REGbc=#N($0014,$04,$04).
  $DED7,$02 LDIR.
  $DED9,$02 #REGa=#N$00.
  $DEDB,$03 Write #REGa to *#R$F33A.
  $DEDE,$03 Write #REGa to *#R$F33F.
  $DEE1,$03 Write #REGa to *#R$E479.
  $DEE4,$05 Write #N$00 to *#R$F2DB.
  $DEE9,$02 #REGa=#N$00.
  $DEEB,$03 Write #REGa to *#R$F31C.
  $DEEE,$03 #HTML(Write #REGa to *<a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/5C78.html">FRAMES</a>.)
  $DEF1,$03 #HTML(Write #REGa to *<a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/5C78.html">FRAMES+#N$01</a>.)
  $DEF4,$03 Write #REGa to *#R$F340.
  $DEF7,$03 Call #R$E0A9.
N $DEFA Restore the default ZX Spectrum font.
  $DEFA,$03 #HTML(#REGhl=<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/3D00.html">#N$3C00</a> (CHARSET-#N$100).)
  $DEFD,$03 #HTML(Write #REGhl to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $DF00,$06 Set INK: #N$06.
  $DF06,$07 Set PAPER: *#R$5BD0.
  $DF0D,$03 Call #R$E064.
  $DF10,$03 Call #R$E058.
  $DF13,$07 Set PAPER: *#R$5BD1.
  $DF1A,$03 Call #R$E22D.
  $DF1D,$03 Call #R$F1FC.
  $DF20,$03 Call #R$E47A.
  $DF23,$03 Call #R$E3E0.
  $DF26,$03 Call #R$F001.
  $DF29,$03 Call #R$E9D9.
  $DF2C,$03 Call #R$E821.
  $DF2F,$08 Call #R$EBD8 if *#R$5BF0 is not equal to #N$03.
  $DF37,$03 Call #R$E4F1.
  $DF3A,$07 Jump to #R$DF45 if *#R$E820 is equal to #N$00.
  $DF41,$01 Decrease #REGa by one.
  $DF42,$03 Write #REGa to *#R$E820.
  $DF45,$08 Call #R$E30B if *#R$5BEA is set to Kempston joystick (#N$0C).
  $DF4D,$08 Call #R$ED35 if *#R$5BEA is not set to Kempston joystick (#N$0C).
  $DF55,$03 Call #R$E5F4.
  $DF58,$03 Call #R$E581.
  $DF5B,$06 Set INK: #N$06.
  $DF61,$07 Set PAPER: *#R$5BD0.
  $DF68,$07 #HTML(Set up the screen buffer location #N$01/#N$1B using <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
N $DF6F Restore the default ZX Spectrum font.
  $DF6F,$03 #HTML(#REGhl=<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/3D00.html">#N$3C00</a> (CHARSET-#N$100).)
  $DF72,$03 #HTML(Write #REGhl to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $DF75,$04 #REGix=#R$F231.
  $DF79,$03 #REGa=*#REGix+#N$10.
  $DF7C,$02 #REGa+=#N$30.
  $DF7E,$03 Call #R$E6DC.
  $DF81,$04 #REGbc=*#R$5BF2.
  $DF85,$05 Call #R$DFD3 if #REGbc is zero.
  $DF8A,$08 Jump to #R$DF13 if *#R$5BF0 is not equal to #N$03.
  $DF92,$08 #HTML(Jump to #R$DF13 if *<a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/5C78.html">FRAMES+#N$01</a> is not equal to #N$03.)
  $DF9A,$07 Increment *#R$F340 by one.
  $DFA1,$05 Call #R$ED8F if #REGa is equal to #N$02.
  $DFA6,$03 Call #R$E349.
  $DFA9,$02,b$01 Keep only bits 0-3.
  $DFAB,$02 #REGa+=#N$02.
  $DFAD,$03 Call #R$EE84.
  $DFB0,$02 #REGa=#N$00.
  $DFB2,$03 #HTML(Write #REGa to *<a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/5C78.html">FRAMES</a>.)
  $DFB5,$03 #HTML(Write #REGa to *<a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/5C78.html">FRAMES+#N$01</a>.)
  $DFB8,$03 Jump to #R$DF13.

c $E058
  $E058,$03 #REGhl=#R$A06C.
  $E05B,$03 #REGde=#R$FFFB.
  $E05E,$03 #REGbc=#N($0064,$04,$04).
  $E061,$02 LDIR.
  $E063,$01 Return.

c $E064 Print Status Bar Icons
@ $E064 label=PrintStatusBarIcons
  $E064,$06 #HTML(Write #R$F25B(#N$F15B) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
N $E06A Set up the screen buffer position.
  $E06A,$07 #HTML(Set up the screen buffer location #N$01/#N$21 using <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $E071,$07 Jump to #R$E080 if *#R$5BF1 is equal to #N$00.
N $E078 Display a life icon for each life the player has.
N $E078 #HTML(<img alt="udg62051_56x4" src="../images/udgs/udg62051_56x4.png">)
  $E078,$01 #REGb=#R$5BF1 (number of lives counter).
@ $E079 label=PrintLifeIcon_Loop
  $E079,$02 #REGa=Player life icon (#N$21).
  $E07B,$03 Call #R$E6DC.
  $E07E,$02 Decrease lives counter by one and loop back to #R$E079 until all lives have been printed.
N $E080 Put a space between the lives and the key icon.
N $E080 Restore the default ZX Spectrum font.
@ $E080 label=PrintKeyIcon
  $E080,$03 #HTML(#REGhl=<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/3D00.html">#N$3C00</a> (CHARSET-#N$100).)
  $E083,$03 #HTML(Write #REGhl to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $E086,$02 #REGa=ASCII "space" (#N$20).
  $E088,$03 Call #R$E6DC.
N $E08B Set up the screen buffer position.
  $E08B,$07 #HTML(Set up the screen buffer location #N$01/#N$1D using <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $E092,$06 #HTML(Write #R$F25B(#N$F15B) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
N $E098 Display the key icon.
N $E098 #HTML(<img alt="udg62051_56x4" src="../images/udgs/udg62059_56x4.png"><img alt="udg62051_56x4" src="../images/udgs/udg62067_56x4.png">)
  $E098,$02 #REGa=Key icon left (#N$22).
  $E09A,$03 Call #R$E6DC.
  $E09D,$02 #REGa=Key icon right (#N$23).
  $E09F,$03 Call #R$E6DC.
N $E0A2 Restore the default ZX Spectrum font.
  $E0A2,$03 #HTML(#REGhl=<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/3D00.html">#N$3C00</a> (CHARSET-#N$100).)
  $E0A5,$03 #HTML(Write #REGhl to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $E0A8,$01 Return.

c $E0A9 Print Status Bar
@ $E0A9 label=PrintStatusBar
  $E0A9,$03 Call #R$A804.
N $E0AC Restore the default ZX Spectrum font.
  $E0AC,$06 #HTML(Write <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/3D00.html">#N$3C00</a> (CHARSET-#N$100) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
N $E0B2 Set up the attributes.
  $E0B2,$06 Set INK: YELLOW (#N$06).
  $E0B8,$07 Set PAPER: *#R$5BD0.
N $E0BF Set up the screen buffer position.
  $E0BF,$07 #HTML(Set up the screen buffer location #N$01/#N$21 using <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
N $E0C6 Print the status bar text at the bottom of the screen.
  $E0C6,$02 #REGb=#N$20 (length of status bar string).
  $E0C8,$03 #REGde=#R$F2BB.
@ $E0CB label=PrintStatusBar_Loop
  $E0CB,$01 Fetch a character from *#REGde and store it in the accumulator.
  $E0CC,$01 Increment the string pointer by one.
  $E0CD,$03 Call #R$E6DC.
  $E0D0,$02 Decrease the string length counter by one and loop back to #R$E0CB until the string is printed.
N $E0D2 Prints the "Booty" count.
  $E0D2,$07 #HTML(Set up the screen buffer location #N$01/#N$13 using <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $E0D9,$04 #REGbc=*#R$5BF4.
  $E0DD,$03 #HTML(Call <a href="https://skoolkid.github.io/rom/asm/1A1B.html">OUT_NUM_1</a>.)
N $E0E0 Prints the "Treasure" count.
  $E0E0,$07 #HTML(Set up the screen buffer location #N$01/#N$05 using <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $E0E7,$04 #REGbc=*#R$5BF2.
  $E0EB,$03 #HTML(Call <a href="https://skoolkid.github.io/rom/asm/1A1B.html">OUT_NUM_1</a>.)
  $E0EE,$03 Call #R$E064.
  $E0F1,$06 Return if *#R$5BF2 is not equal to #N$00.
@ $E0F7 label=PrintFindTheGoldKey
  $E0F7,$06 Set INK: #N$07.
  $E0FD,$07 Set PAPER: *#R$5BD1.
  $E104,$07 #HTML(Set up the screen buffer location #N$02/#N$21 using <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $E10B,$02 #HTML(#REGb=#N$20 (length of "find the gold key in <em>xx</em> seconds" string).)
  $E10D,$03 #REGde=#R$E6BC.
@ $E110 label=PrintFindTheGoldKey_Loop
  $E110,$01 Fetch a character from *#REGde and store it in the accumulator.
  $E111,$03 Call #R$E6DC.
  $E114,$01 Increment the string pointer by one.
  $E115,$02 Decrease the string length counter by one and loop back to #R$E110 until the string is printed.
  $E117,$01 Return.

c $E118
  $E118,$01 Restore #REGhl from the stack.
  $E119,$05 Write #N$00 to *#R$F31C.
  $E11E,$01 Return.

c $E11F
  $E11F,$03 #HTML(#REGa=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C78.html">FRAMES</a>.)
  $E122,$03 #REGde=#N$0352.
  $E125,$02 #REGhl-=#REGde (with carry).
  $E127,$02 Jump to #R$E13C if {} is higher.
  $E129,$01 Return.

c $E12A
  $E12A,$04 #REGbc=*#R$5BF4.
  $E12E,$05 Jump to #R$E11F if #REGc is higher than #N$64.
  $E133,$03 #HTML(#REGhl=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C78.html">FRAMES</a>.)
  $E136,$03 #REGde=#N$0578.
  $E139,$02 #REGhl-=#REGde (with carry).
  $E13B,$01 Return if {} is lower.
N $E13C #HTML(Use <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/5C78.html">FRAMES</a> as a counter.)
  $E13C,$06 #HTML(Reset *<a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/5C78.html">FRAMES</a> to #N($0000,$04,$04).)
  $E142,$03 Call #R$E349.
  $E145,$02,b$01 Keep only bits 0-1.
  $E147,$03 #REGhl=#R$F317.
  $E14A,$01 #REGe=#REGa.
  $E14B,$02 #REGd=#N$00.
  $E14D,$01 #REGhl+=#REGde.
  $E14E,$01 Stash #REGhl on the stack.
  $E14F,$01 Increment #REGhl by one.
  $E150,$01 #REGa=*#REGhl.
  $E151,$04 #REGix=#R$5BDA.
  $E155,$01 #REGb=#REGa.
  $E156,$07 Jump to #R$E172 if *#REGix+#N$00 is equal to #N$FF.
  $E15D,$06 Jump to #R$E16B if *#REGix+#N$01 is not equal to #REGb.
  $E163,$08 Jump to #R$E118 if *#REGix+#N$05 is not equal to #N$00.
  $E16B,$03 #REGde=#N($0006,$04,$04).
  $E16E,$02 #REGix+=#REGde.
  $E170,$02 Jump to #R$E156.
  $E172,$04 #REGix=#R$F31C.
  $E176,$03 Call #R$E349.
  $E179,$02 Test bit 3 of #REGa.
  $E17B,$02 Jump to #R$E197 if {} is zero.
  $E17D,$04 Write #N$02 to *#REGix+#N$00.
  $E181,$04 Write #N$01 to *#REGix+#N$02.
  $E185,$04 Write #N$01 to *#REGix+#N$04.
  $E189,$04 Write #N$00 to *#REGix+#N$05.
  $E18D,$04 Write #N$01 to *#REGix+#N$0B.
  $E191,$04 Write #N$02 to *#REGix+#N$0D.
  $E195,$02 Jump to #R$E1AF.

  $E197,$04 Write #N$25 to *#REGix+#N$00.
  $E19B,$04 Write #N$00 to *#REGix+#N$02.
  $E19F,$04 Write #N$FF to *#REGix+#N$04.
  $E1A3,$04 Write #N$00 to *#REGix+#N$05.
  $E1A7,$04 Write #N$00 to *#REGix+#N$0B.
  $E1AB,$04 Write #N$24 to *#REGix+#N$0D.
  $E1AF,$03 Call #R$E349.
  $E1B2,$02 Test bit 5 of #REGa.
  $E1B4,$02 Jump to #R$E1FE if {} is zero.
  $E1B6,$01 Restore #REGhl from the stack.
  $E1B7,$01 Stash #REGhl on the stack.
  $E1B8,$07 #HTML(Set up the screen buffer location #N$21/*#REGhl using <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $E1BF,$03 #HTML(#REGhl=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C84.html">DF_CC</a>.)
  $E1C2,$02 #REGb=#N$20.
  $E1C4,$01 #REGa=*#REGhl.
  $E1C5,$01 Increment #REGhl by one.
  $E1C6,$05 Jump to #R$E118 if #REGa is not equal to #N$FF.
  $E1CB,$02 Decrease counter by one and loop back to #R$E1C4 until counter is zero.
  $E1CD,$01 Restore #REGhl from the stack.
  $E1CE,$01 #REGa=*#REGhl.
  $E1CF,$01 Increment #REGa by one.
  $E1D0,$03 Write #REGa to *#REGix+#N$01.
  $E1D3,$03 Write #REGa to *#REGix+#N$0E.
  $E1D6,$04 Write #N$03 to *#REGix+#N$03.
  $E1DA,$04 Write #N$03 to *#REGix+#N$0F.
  $E1DE,$04 Write #N$20 to *#REGix+#N$06.
  $E1E2,$04 Write #N$03 to *#REGix+#N$09.
  $E1E6,$04 Write #N$04 to *#REGix+#N$07.
  $E1EA,$04 Write #N$01 to *#REGix+#N$08.
  $E1EE,$05 Write #N$01 to *#R$FFFF.
  $E1F3,$06 Return if *#REGix+#N$04 is equal to #N$01.
  $E1F9,$04 Write #N$24 to *#REGix+#N$06.
  $E1FD,$01 Return.

  $E1FE,$01 Restore #REGhl from the stack.
  $E1FF,$01 #REGa=*#REGhl.
  $E200,$03 Increment #REGa by three.
  $E203,$03 Write #REGa to *#REGix+#N$01.
  $E206,$03 Write #REGa to *#REGix+#N$0E.
  $E209,$04 Write #N$03 to *#REGix+#N$03.
  $E20D,$04 Write #N$28 to *#REGix+#N$06.
  $E211,$04 Write #N$06 to *#REGix+#N$09.
  $E215,$04 Write #N$02 to *#REGix+#N$07.
  $E219,$04 Write #N$02 to *#REGix+#N$08.
  $E21D,$05 Write #N$02 to *#R$FFFF.
  $E222,$06 Return if *#REGix+#N$04 is equal to #N$FF.
  $E228,$04 Write #N$2C to *#REGix+#N$06.
  $E22C,$01 Return.

  $E22D,$04 #REGix=#R$F31C.
  $E231,$08 Jump to #R$E12A if *#REGix+#N$00 is equal to #N$00.
  $E239,$06 #HTML(Write #R$944C(#N$934C) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $E23F,$03 Call #R$EEA6.
  $E242,$03 Write #REGc to *#REGix+#N$00.
  $E245,$03 Write #REGb to *#REGix+#N$01.
  $E248,$03 Write #REGe to *#REGix+#N$02.
  $E24B,$03 Write #REGd to *#REGix+#N$03.
  $E24E,$05 Jump to #R$E283 if #REGe is not equal to #N$03.
  $E253,$07 Jump to #R$E271 if *#REGix+#N$04 is equal to #N$FF.
  $E25A,$01 #REGa=#REGc.
  $E25B,$03 #REGa-=*#REGix+#N$07.
  $E25E,$04 Jump to #R$E283 if #REGa is lower than #N$02.
  $E262,$04 Jump to #R$E283 if #REGa is higher than #N$22.
  $E266,$01 #REGc=#REGa.
  $E267,$02 #REGe=#N$01.
  $E269,$03 #REGd=*#REGix+#N$08.
  $E26C,$03 Call #R$E787.
  $E26F,$02 Jump to #R$E283.
  $E271,$01 Increment #REGc by one.
  $E272,$05 Jump to #R$E283 if #REGc is higher than #N$22.
  $E277,$04 Jump to #R$E283 if #REGc is lower than #N$02.
  $E27B,$02 #REGe=#N$01.
  $E27D,$03 #REGd=*#REGix+#N$08.
  $E280,$03 Call #R$E787.
  $E283,$08 Jump to #R$E301 if *#REGix+#N$00 is equal to #N$26.
  $E28B,$05 Jump to #R$E301 if *#REGix+#N$00 is equal to #N$01.
  $E290,$07 Jump to #R$E29F if *#REGix+#N$06 is lower than #N$25.
  $E297,$02 #REGa+=#N$08.
  $E299,$04 Jump to #R$E29F if #REGa is lower than #N$47.
  $E29D,$02 #REGa-=#N$20.
  $E29F,$03 Write #REGa to *#REGix+#N$06.
  $E2A2,$03 Call #R$EED7.
  $E2A5,$06 Write *#REGix+#N$00 to *#REGix+#N$0D.
  $E2AB,$06 Write *#REGix+#N$01 to *#REGix+#N$0E.
  $E2B1,$06 Write *#REGix+#N$02 to *#REGix+#N$0B.
  $E2B7,$06 Write *#REGix+#N$03 to *#REGix+#N$0F.
  $E2BD,$03 #REGa=*#REGix+#N$08.
  $E2C0,$02 #REGa+=#N$03.
  $E2C2,$01 #REGc=#REGa.
  $E2C3,$03 #REGb=*#REGix+#N$01.
  $E2C6,$03 #REGa=*#R$F232.
  $E2C9,$01 Decrease #REGa by one.
  $E2CA,$03 #REGa+=*#REGix+#N$08.
  $E2CD,$01 #REGa-=#REGb.
  $E2CE,$02 Return if #REGa is higher than #REGc.
  $E2D0,$03 #REGa=*#REGix+#N$07.
  $E2D3,$02 #REGa+=#N$02.
  $E2D5,$02 Shift #REGa left (with carry).
  $E2D7,$02 Shift #REGa left (with carry).
  $E2D9,$01 #REGb=#REGa.
  $E2DA,$03 #REGc=*#REGix+#N$00.
  $E2DD,$03 #REGa=*#R$F233.
  $E2E0,$01 #REGd=#REGa.
  $E2E1,$01 #REGa=#REGc.
  $E2E2,$02 Shift #REGa left (with carry).
  $E2E4,$02 Shift #REGa left (with carry).
  $E2E6,$03 #REGa+=*#REGix+#N$02.
  $E2E9,$01 #REGc=#REGa.
  $E2EA,$03 #REGa=*#R$F231.
  $E2ED,$03 #REGa+=*#REGix+#N$07.
  $E2F0,$02 Shift #REGa left (with carry).
  $E2F2,$02 Shift #REGa left (with carry).
  $E2F4,$01 #REGa+=#REGd.
  $E2F5,$01 Decrease #REGa by one.
  $E2F6,$01 #REGa-=#REGc.
  $E2F7,$02 Return if #REGa is higher than #REGb.
  $E2F9,$05 Write #N$01 to *#R$FFFE.
  $E2FE,$03 Jump to #R$E3A4.
  $E301,$04 Write #N$00 to *#REGix+#N$00.
  $E305,$05 Write ##N$00 to *#R$FFFF.
  $E30A,$01 Return.
  $E30B,$04 #REGix=#R$F231.
  $E30F,$07 Jump to #R$E31E if *#R$5BF0 is not equal to #N$03.
  $E316,$02 Read from the Kempston joystick port.
  $E318,$02,b$01 Keep only bits 0-4.
  $E31A,$03 Jump to #R$ED8F if the result is not zero.
  $E31D,$01 Return.
  $E31E,$02 Read from the Kempston joystick port.
  $E320,$03 Write #REGa to *#R$F342.
  $E323,$02,b$01 Keep only bit 4.
  $E325,$03 Jump to #R$EE5B if the result is not zero.
  $E328,$03 #REGa=*#R$F342.
  $E32B,$02,b$01 Keep only bit 0.
  $E32D,$03 Jump to #R$EB05 if the result is not zero.
  $E330,$03 #REGa=*#R$F342.
  $E333,$02,b$01 Keep only bit 1.
  $E335,$03 Jump to #R$EB49 if the result is not zero.
  $E338,$03 #REGa=*#R$F342.
  $E33B,$02,b$01 Keep only bit 2.
  $E33D,$03 Jump to #R$ED9A if the result is not zero.
  $E340,$03 #REGa=*#R$F342.
  $E343,$02,b$01 Keep only bit 3.
  $E345,$03 Jump to #R$EE08 if the result is not zero.
  $E348,$01 Return.
  $E349,$01 Stash #REGbc on the stack.
  $E34A,$04 #REGbc=*#R$F343.
  $E34E,$01 #REGa=#N$00.
  $E34F,$01 #REGa=#REGc.
  $E350,$01 #REGa+=#REGb.
  $E351,$01 #REGb=#REGa.
  $E352,$01 #REGa=#N$00.
  $E353,$02 #REGa=#N$CD.
  $E355,$01 #REGa+=#REGc.
  $E356,$01 #REGc=#REGa.
  $E357,$02 #REGa=#N$AB.
  $E359,$01 #REGa+=#REGb.
  $E35A,$01 #REGb=#REGa.
  $E35B,$04 Write #REGbc to *#R$F343.
  $E35F,$01 Restore #REGbc from the stack.
  $E360,$01 Return.

c $E361
  $E361,$05 Write #N$07 to *#R$FFFE.
  $E366,$03 #REGhl=#N$5AA0 (attribute buffer location).
  $E369,$02 #REGb=#N$15.
  $E36B,$02 Stash #REGhl and #REGbc on the stack.
  $E36D,$02 #REGb=#N$20.
  $E36F,$02 #REGa=#COLOUR$29 (#N$29).
  $E371,$01 Write #REGa to *#REGhl.
  $E372,$01 Increment #REGhl by one.
  $E373,$02 Decrease counter by one and loop back to #R$E36F until counter is zero.
  $E375,$02 #REGb=#N$C8.
  $E377,$01 Stash #REGbc on the stack.
  $E378,$03 #REGbc=#R$FFFE.
  $E37B,$03 #REGa=*#R$5BD0.
  $E37E,$02 #REGa+=#N$10.
  $E380,$02
  $E382,$03 Call #R$E349.
  $E385,$01 #REGb=#REGa.
  $E386,$02 Decrease counter by one and loop back to #R$E386 until counter is zero.
  $E388,$03 #REGbc=#R$FFFE.
  $E38B,$03 #REGa=*#R$5BD0.
  $E38E,$02
  $E390,$03 Call #R$E349.
  $E393,$01 #REGb=#REGa.
  $E394,$02 Decrease counter by one and loop back to #R$E394 until counter is zero.
  $E396,$01 Restore #REGbc from the stack.
  $E397,$02 Decrease counter by one and loop back to #R$E377 until counter is zero.
  $E399,$02 Restore #REGbc and #REGhl from the stack.
  $E39B,$03 #REGde=#N($0020,$04,$04).
  $E39E,$01 #REGa=#N$00.
  $E39F,$02 #REGhl-=#REGde (with carry).
  $E3A1,$02 Decrease counter by one and loop back to #R$E36B until counter is zero.
  $E3A3,$01 Restore #REGbc from the stack.
  $E3A4,$05 Write #N$01 to *#R$FFFB.
  $E3A9,$01 Restore #REGbc from the stack.
  $E3AA,$03 #REGhl=#N($0064,$04,$04).
  $E3AD,$03 #REGde=#N($00C8,$04,$04).
  $E3B0,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/03B5.html">BEEPER</a>.)
  $E3B3,$07 Decrease *#R$5BF1 by one.
  $E3BA,$05 Call #R$ED8F is *#R$5BF1 is equal to #N$FF.
  $E3BF,$03 Jump to #R$DEC9.
  $E3C2,$03 Call #R$E349.
  $E3C5,$03 Return if #REGa is higher than #N$40.
  $E3C8,$06 Return if *#R$E479 is not equal to #N$00.
  $E3CE,$05 Write #N$20 to *#R$E475.
  $E3D3,$04 Write #REGbc to *#R$E46F.
  $E3D7,$08 Write #N$01 to: #LIST { *#R$E479 } { *#R$FFFD } LIST#
  $E3DF,$01 Return.

c $E3E0

W $E46F,$02
B $E471,$01
B $E472,$01
B $E473,$01
B $E474,$01
B $E475,$01
B $E476,$01
B $E477,$01
B $E478,$01
B $E479,$01

t $E6BC Messaging: Find The Gold Key
@ $E6BC label=Messaging_FindTheGoldKey
  $E6BC,$20 "#STR(#PC,$04,$20)".

c $E6DC Print Colour Character
@ $E6DC label=PrintColourCharacter
R $E6DC A Character to print
  $E6DC,$01 Switch to the shadow registers.
  $E6DD,$03 Creates an offset in #REGde' using #REGa.
  $E6E0,$02 Shift #REGe' left (with carry).
  $E6E2,$02 Rotate #REGd' left.
  $E6E4,$02 Shift #REGe' left (with carry).
  $E6E6,$02 Rotate #REGd' left.
  $E6E8,$02 Shift #REGe' left (with carry).
  $E6EA,$02 Rotate #REGd' left.
M $E6DD,$0F #REGde'=#REGa*#N$08.
  $E6EC,$04 #HTML(#REGhl'=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>+#REGde'.)
  $E6F0,$09 #HTML(Increment *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C84.html">DF_CC</a> by one.)
  $E6F9,$01 Decrease #REGde' by one.
N $E6FA All character blocks are 1 x 8 bytes.
N $E6FA Copy the data from the current character set to the screen buffer.
  $E6FA,$02 #REGb'=#N$08 (byte counter).
@ $E6FC label=PrintColourCharacter_Loop
  $E6FC,$01 Fetch the byte from the character set.
  $E6FD,$01 Write the byte to the screen buffer.
  $E6FE,$01 Increment the character set data pointer in #REGhl' by one.
  $E6FF,$01 Move down one line in the screen buffer.
  $E700,$02 Decrease the byte counter by one and loop back to #R$E6FC until all lines of the letter have been written to the screen buffer.
N $E702 Calculate the attribute buffer position.
  $E702,$04 #HTML(#REGbc'=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C88.html">S_POSN</a>.)
  $E706,$03 #REGhl'=#N$5800 (attribute buffer location).
  $E709,$01 Decrease #REGc' by one.
  $E70A,$04 #HTML(Write #REGbc' to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C88.html">S_POSN</a>.)
  $E70E,$01 Increment #REGc' by one.
  $E70F,$04 #REGe'=#N$21-#REGc'.
  $E713,$02 #REGd'=#N$00.
  $E715,$01 #REGhl'+=#REGde'.
  $E716,$04 #REGe'=#N$18-#REGb'.
  $E71A,$08 Shift #REGe' left four positions (with carry).
  $E722,$02 Rotate #REGd' left.
  $E724,$02 Shift #REGe' left (with carry).
  $E726,$02 Rotate #REGd' left.
  $E728,$01 #REGhl'+=#REGde'.
  $E729,$03 #HTML(#REGa=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C8F.html">ATTR_T</a>.)
  $E72C,$01 Write #REGa to *#REGhl'.
  $E72D,$01 Switch back to the normal registers.
  $E72E,$01 Return.

c $E72F
  $E72F,$04 Stash #REGaf, #REGbc, #REGde and #REGhl on the stack.
  $E733,$01 Decrease #REGa by one.
  $E734,$03 Write #REGa to *#R$F336.
  $E737,$01 #REGa=#REGe.
  $E738,$03 Write #REGa to *#R$F335.
  $E73B,$03 #REGa=*#R$F335.
  $E73E,$01 #REGe=#REGa.
  $E73F,$02 Stash #REGbc and #REGde on the stack.
  $E741,$03 Call #R$E762.
  $E744,$02 Restore #REGde and #REGbc from the stack.
  $E746,$03 #REGa=*#R$F336.
  $E749,$01 Increment #REGa by one.
  $E74A,$02 Compare #REGa with #N$00.
  $E74C,$02 Jump to #R$E751 if {} is zero.
  $E74E,$03 Write #REGa to *#R$F336.
  $E751,$03 Call #R$E804.
  $E754,$01 Decrease #REGe by one.
  $E755,$02 Jump to #R$E746 if {} is not zero.
  $E757,$01 Decrease #REGd by one.
  $E758,$02 Jump to #R$E75D if {} is zero.
  $E75A,$01 Decrease #REGb by one.
  $E75B,$02 Jump to #R$E73B.
  $E75D,$04 Restore #REGhl, #REGde, #REGbc and #REGaf from the stack.
  $E761,$01 Return.

c $E762
  $E762,$04 #REGe=#N$18-#REGb.
  $E766,$02 #REGd=#N$00.
  $E768,$02 Shift #REGe left (with carry).
  $E76A,$02 Rotate #REGd left.
  $E76C,$02 Shift #REGe left (with carry).
  $E76E,$02 Rotate #REGd left.
  $E770,$02 Shift #REGe left (with carry).
  $E772,$02 Rotate #REGd left.
  $E774,$02 Shift #REGe left (with carry).
  $E776,$02 Rotate #REGd left.
  $E778,$02 Shift #REGe left (with carry).
  $E77A,$02 Rotate #REGd left.
  $E77C,$02 #REGa=#N$21.
  $E77E,$01 #REGa-=#REGc.
  $E77F,$01 #REGl=#REGa.
  $E780,$02 #REGh=#N$00.
  $E782,$01 #REGhl+=#REGde.
  $E783,$03 Write #REGhl to *#R$F330.
  $E786,$01 Return.

  $E787,$03 #HTML(#REGhl=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $E78A,$01 Stash #REGhl on the stack.
  $E78B,$06 #HTML(Write #R$8478(#N$8378) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $E791,$04 Write #REGe to *#R$F335.
  $E795,$04 #REGe=*#R$F335.
  $E799,$02 Stash #REGbc and #REGde on the stack.
  $E79B,$03 Call #R$E762.
  $E79E,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $E7A1,$02 Restore #REGde and #REGbc from the stack.
  $E7A3,$01 Stash #REGde on the stack.
  $E7A4,$03 #REGhl=*#R$F330.
  $E7A7,$01 Increment #REGhl by one.
  $E7A8,$03 Write #REGhl to *#R$F330.
  $E7AB,$01 Decrease #REGhl by one.
  $E7AC,$03 #REGde=#R$A1C4.
  $E7AF,$01 #REGhl+=#REGde.
  $E7B0,$01 #REGa=*#REGhl.
  $E7B1,$01 Restore #REGde from the stack.
  $E7B2,$02 Compare #REGa with #N$00.
  $E7B4,$02 Jump to #R$E7BD if {} is not zero.
  $E7B6,$02 #REGa=#N$20.
  $E7B8,$03 Call #R$E6DC.
  $E7BB,$02 Jump to #R$E7D3.
  $E7BD,$02 Stash #REGaf and #REGaf on the stack.
  $E7BF,$02,b$01 Keep only bits 7.
  $E7C1,$03 Call #R$E7FB not zero.
  $E7C4,$01 Restore #REGaf from the stack.
  $E7C5,$02,b$01 Keep only bits 0-6.
  $E7C8,$01 Restore #REGaf from the stack.
  $E7C9,$02 Jump to #R$E7D3 if {} is zero.
  $E7CB,$01 Stash #REGhl on the stack.
  $E7CC,$06 #HTML(Write #R$8478(#N$8378) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $E7D2,$01 Restore #REGhl from the stack.
  $E7D3,$02 Stash #REGde and #REGhl on the stack.
  $E7D5,$03 #REGhl=*#R$F330.
  $E7D8,$01 Decrease #REGhl by one.
  $E7D9,$03 #REGde=#R$A4E4.
  $E7DC,$01 #REGhl+=#REGde.
  $E7DD,$01 #REGa=*#REGhl.
  $E7DE,$02 Compare #REGa with #N$00.
  $E7E0,$02 Jump to #R$E7EB if {} is zero.
  $E7E2,$03 #REGde=#N$5800 (screen buffer location).
  $E7E5,$03 #REGhl=*#R$F330.
  $E7E8,$01 Decrease #REGhl by one.
  $E7E9,$01 #REGhl+=#REGde.
  $E7EA,$01 Write #REGa to *#REGhl.
  $E7EB,$02 Restore #REGhl and #REGde from the stack.
  $E7ED,$01 Decrease #REGe by one.
  $E7EE,$02 Jump to #R$E7A3 if {} is not zero.
  $E7F0,$01 Decrease #REGd by one.
  $E7F1,$02 Jump to #R$E7F6 if {} is zero.
  $E7F3,$01 Decrease #REGb by one.
  $E7F4,$02 Jump to #R$E795.
  $E7F6,$01 Restore #REGhl from the stack.
  $E7F7,$03 #HTML(Write #REGhl to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $E7FA,$01 Return.
  $E7FB,$01 Stash #REGhl on the stack.
  $E7FC,$06 #HTML(Write #R$8778(#N$8678) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $E802,$01 Restore #REGhl from the stack.
  $E803,$01 Return.

  $E804,$03 Stash #REGaf, #REGde and #REGhl on the stack.
  $E807,$03 #REGhl=*#R$F330.
  $E80A,$01 Increment #REGhl by one.
  $E80B,$03 Write #REGhl to *#R$F330.
  $E80E,$01 Decrease #REGhl by one.
  $E80F,$03 #REGde=#R$A1C4.
  $E812,$01 #REGhl+=#REGde.
  $E813,$01 Write #REGa to *#REGhl.
  $E814,$03 #REGde=#N$0320.
  $E817,$01 #REGhl+=#REGde.
  $E818,$03 #HTML(#REGa=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C8F.html">ATTR_T</a>.)
  $E81B,$01 Write #REGa to *#REGhl.
  $E81C,$03 Restore #REGhl, #REGde and #REGaf from the stack.
  $E81F,$01 Return.

b $E820

c $E821

c $E9D9
  $E9D9,$03 #REGbc=#N$07D0.
  $E9DC,$01 Decrease #REGbc by one.
  $E9DD,$04 Jump to #R$E9DC until #REGbc is zero.
  $E9E1,$01 Return.

c $E9E2
  $E9E2,$01 #REGa=#REGc.
  $E9E3,$03 #REGa-=*#REGix+#N$0D.
  $E9E6,$02 Jump to #R$E9F4 if the result is zero.
  $E9E8,$02 Compare #REGa with #N$FF.
  $E9EA,$01 Stash #REGaf on the stack.
  $E9EB,$03 Call #R$EA1D was equal to #N$FF (on line #R$E9E8).
  $E9EE,$01 Restore #REGaf from the stack.
  $E9EF,$03 Call #R$EA38 was not equal to #N$FF (on line #R$E9E8).
  $E9F2,$02 Jump to #R$E9FF.

  $E9F4,$06 Jump to #R$E9FF if #REGe is equal to *#REGix+#N$0B.
  $E9FA,$05 Call #R$EA38 if #REGe is equal to #N$03.
  $E9FF,$01 #REGa=#REGb.
  $EA00,$03 #REGa-=*#REGix+#N$0E.
  $EA03,$02 Jump to #R$EA11 if the result is zero.
  $EA05,$02 Compare #REGa with #N$FF.
  $EA07,$01 Stash #REGaf on the stack.
  $EA08,$03 Call #R$EA78 if #REGa was equal to #N$FF (on line #R$EA05).
  $EA0B,$01 Restore #REGaf from the stack.
  $EA0C,$03 Call #R$EA58 if #REGa was not equal to #N$FF (on line #R$EA05).
  $EA0F,$02 Jump to #R$EA1C.
  $EA11,$06 Jump to #R$EA1C if #REGd is equal to *#REGix+#N$0F.
  $EA17,$05 Call #R$EA58 if #REGd is equal to #N$03.
  $EA1C,$01 Return.

  $EA1D,$02 Stash #REGbc and #REGde on the stack.
  $EA1F,$03 #REGc=*#REGix+#N$0D.
  $EA22,$03 #REGb=*#REGix+#N$0E.
  $EA25,$03 #REGd=*#REGix+#N$08.
  $EA28,$02 #REGe=#N$01.
  $EA2A,$07 Jump to #R$EA32 if *#REGix+#N$0F is equal to #N$03.
  $EA31,$01 Increment #REGd by one.
  $EA32,$03 Call #R$E787.
  $EA35,$02 Restore #REGde and #REGbc from the stack.
  $EA37,$01 Return.

  $EA38,$02 Stash #REGbc and #REGde on the stack.
  $EA3A,$03 #REGa=*#REGix+#N$0D.
  $EA3D,$03 #REGc=*#REGix+#N$07.
  $EA40,$01 #REGa-=#REGc.
  $EA41,$01 #REGc=#REGa.
  $EA42,$03 #REGb=*#REGix+#N$0E.
  $EA45,$03 #REGd=*#REGix+#N$08.
  $EA48,$02 #REGe=#N$01.
  $EA4A,$07 Jump to #R$EA52 if *#REGix+#N$03 is equal to #N$03.
  $EA51,$01 Increment #REGd by one.
  $EA52,$03 Call #R$E787.
  $EA55,$02 Restore #REGde and #REGbc from the stack.
  $EA57,$01 Return.

  $EA58,$02 Stash #REGbc and #REGde on the stack.
  $EA5A,$03 #REGa=*#REGix+#N$0E.
  $EA5D,$03 #REGd=*#REGix+#N$08.
  $EA60,$01 #REGa-=#REGd.
  $EA61,$01 #REGb=#REGa.
  $EA62,$03 #REGe=*#REGix+#N$07.
  $EA65,$03 #REGc=*#REGix+#N$0D.
  $EA68,$02 #REGd=#N$01.
  $EA6A,$07 Jump to #R$EA72 if *#REGix+#N$02 is equal to #N$03.
  $EA71,$01 Increment #REGe by one.
  $EA72,$03 Call #R$E787.
  $EA75,$02 Restore #REGde and #REGbc from the stack.
  $EA77,$01 Return.

  $EA78,$02 Stash #REGbc and #REGde on the stack.
  $EA7A,$03 #REGc=*#REGix+#N$0D.
  $EA7D,$03 #REGb=*#REGix+#N$0E.
  $EA80,$02 #REGd=#N$01.
  $EA82,$03 #REGe=*#REGix+#N$07.
  $EA85,$07 Jump to #R$EA8D if *#REGix+#N$0B is equal to #N$03.
  $EA8C,$01 Increment #REGe by one.
  $EA8D,$03 Call #R$E787.
  $EA90,$02 Restore #REGde and #REGbc from the stack.
  $EA92,$01 Return.

c $EA93
  $EA93,$01 Stash #REGhl on the stack.
  $EA94,$01 Decrease #REGa by one.
  $EA95,$03 Write #REGa to *#R$F336.
  $EA98,$04 Write #REGe to *#R$F335.
  $EA9C,$06 Jump to #R$EACD if #REGc is lower than #N$02.
  $EAA2,$03 #REGa=*#R$F335.
  $EAA5,$01 #REGe=#REGa.
  $EAA6,$06 Jump to #R$EADE if #REGc is higher than #N$22.
  $EAAC,$02 Stash #REGbc and #REGde on the stack.
  $EAAE,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $EAB1,$01 Restore #REGde from the stack.
  $EAB2,$07 Increment *#R$F336 by one.
  $EAB9,$03 Call #R$E6DC.
  $EABC,$06 Call #R$EACF if #REGc is equal to #N$02.
  $EAC2,$01 Decrease #REGc by one.
  $EAC3,$01 Decrease #REGe by one.
  $EAC4,$02 Jump to #R$EAB2 until #REGe is zero.
  $EAC6,$01 Restore #REGbc from the stack.
  $EAC7,$01 Decrease #REGd by one.
  $EAC8,$02 Jump to #R$EACD if #REGd is zero.
  $EACA,$01 Decrease #REGb by one.
  $EACB,$02 Jump to #R$EA9C.
  $EACD,$01 Restore #REGhl from the stack.
  $EACE,$01 Return.
  $EACF,$01 Decrease #REGe by one.
  $EAD0,$01 Stash #REGaf on the stack.
  $EAD1,$01 Increment #REGe by one.
  $EAD2,$07 Increment *#R$F336 by one.
  $EAD9,$01 Restore #REGaf from the stack.
  $EADA,$01 Return if *#R$F336 is zero.
  $EADB,$01 Decrease #REGe by one.
  $EADC,$02 Jump to #R$EACF.
  $EADE,$07 Increment *#R$F336 by one.
  $EAE5,$01 Decrease #REGe by one.
  $EAE6,$03 Jump to #R$EACD if #REGe is zero.
  $EAE9,$01 Decrease #REGc by one.
  $EAEA,$05 Jump to #R$EAAC if #REGc is higher than #N$22.
  $EAEF,$02 Jump to #R$EADE.
  $EAF1,$05 #HTML(Clear the bottom #N$18 lines using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0E44.html">CL_LINE</a>.)
  $EAF6,$03 #REGbc=#N$0640.
  $EAF9,$03 #REGhl=#R$A1C4.
  $EAFC,$02 Write #N$00 to *#REGhl.
  $EAFE,$01 Increment #REGhl by one.
  $EAFF,$01 Decrease #REGbc by one.
  $EB00,$04 Jump to #R$EAFC until #REGbc is zero.
  $EB04,$01 Return.

c $EB05
  $EB05,$06 Return if *#REGix+#N$11 is equal to #N$02.
  $EB0B,$04 Jump to #R$EB26 if *#REGix+#N$11 is not equal to #N$03.
  $EB0F,$06 Return if *#REGix+#N$03 is not equal to #N$03.
  $EB15,$05 Write #N$FF to *#R$F32D.
  $EB1A,$08 Jump to #R$EB26 if *#REGix+#N$01 is equal to *#REGix+#N$12.
  $EB22,$04 Return if *#REGix+#N$01 is not equal to *#REGix+#N$13.
  $EB26,$07 Jump to #R$EB35 if *#REGix+#N$11 is equal to #N$13.
  $EB2D,$04 Write #N$13 to *#REGix+#N$11.
  $EB31,$04 Write #N$1A to *#REGix+#N$06.
  $EB35,$03 #REGa=*#REGix+#N$06.
  $EB38,$02 #REGa+=#N$06.
  $EB3A,$03 Write #REGa to *#REGix+#N$06.
  $EB3D,$04 Jump to #R$EB45 if #REGa is not equal to #N$50.
  $EB41,$04 Write #N$20 to *#REGix+#N$06.
  $EB45,$03 Decrease *#REGix+#N$04 by one.
  $EB48,$01 Return.

c $EB49
  $EB49,$06 Return if *#REGix+#N$11 is equal to #N$02.
  $EB4F,$04 Jump to #R$EB6A if *#REGix+#N$11 is not equal to #N$03.
  $EB53,$06 Return if *#REGix+#N$03 is not equal to #N$03.
  $EB59,$05 Write #N$FF to *#R$F32D.
  $EB5E,$08 Jump to #R$EB6A if *#REGix+#N$01 is equal to *#REGix+#N$12.
  $EB66,$04 Return if *#REGix+#N$01 is not equal to *#REGix+#N$13.
  $EB6A,$07 Jump to #R$EB79 if *#REGix+#N$11 is equal to #N$04.
  $EB71,$04 Write #N$04 to *#REGix+#N$11.
  $EB75,$04 Write #N$4A to *#REGix+#N$06.
  $EB79,$03 #REGa=*#REGix+#N$06.
  $EB7C,$02 #REGa+=#N$06.
  $EB7E,$03 Write #REGa to *#REGix+#N$06.
  $EB81,$04 Jump to #R$EB89 if #REGa is not equal to #N$80.
  $EB85,$04 Write #N$50 to *#REGix+#N$06.
  $EB89,$03 Increment *#REGix+#N$04 by one.
  $EB8C,$01 Return.

c $EB8D
  $EB8D,$05 Write #N$05 to *#R$FFFE.
  $EB92,$02 Stash #REGix on the stack.
  $EB94,$03 #REGix=#REGhl (using the stack).
  $EB97,$02 Stash #REGbc and #REGde on the stack.
  $EB99,$03 #REGc=*#REGix+#N$00.
  $EB9C,$03 #REGb=*#REGix+#N$01.
  $EB9F,$01 Decrease #REGb by one.
  $EBA0,$04 Write #N$00 to *#REGix+#N$05.
  $EBA4,$01 Stash #REGbc on the stack.
  $EBA5,$02 Stash #REGix on the stack.
  $EBA7,$03 #REGde=#N($0032,$04,$04).
  $EBAA,$03 #REGhl=#N($00C8,$04,$04).
  $EBAD,$03 #HTML(Call <a href="https://skoolkit.ca/disassemblies/rom/hex/asm/03B5.html">BEEPER</a>.)
  $EBB0,$02 Restore #REGix from the stack.
  $EBB2,$01 Restore #REGbc from the stack.
  $EBB3,$03 #HTML(#REGhl=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $EBB6,$01 Stash #REGhl on the stack.
  $EBB7,$06 #HTML(Write #R$A06C(#N$9F6C) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $EBBD,$02 #REGd=#N$04.
  $EBBF,$02 #REGe=#N$01.
  $EBC1,$02 #REGa=#N$00.
  $EBC3,$03 Call #R$E72F.
  $EBC6,$02 #REGa=#N$20.
  $EBC8,$03 Call #R$EA93.
  $EBCB,$01 Restore #REGhl from the stack.
  $EBCC,$03 #HTML(Write #REGhl to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $EBCF,$02 Restore #REGde and #REGbc from the stack.
  $EBD1,$02 Restore #REGix from the stack.
  $EBD3,$04 Write #N$00 to *#REGix+#N$10.
  $EBD7,$01 Return.

c $EBD8
  $EBD8,$04 #REGix=#R$F231.
  $EBDC,$06 Set INK: #N$05.
  $EBE2,$04 Write #N$00 to *#R$F32F.
  $EBE6,$07 Jump to #R$EC49 if *#R$E820 is not equal to #N$00.
  $EBED,$07 Jump to #R$EC49 if *#REGix+#N$11 is equal to #N$03.
  $EBF4,$07 Jump to #R$EC49 if *#REGix+#N$05 is not equal to #N$00.
  $EBFB,$08 Jump to #R$EC3D if *#REGix+#N$03 is not equal to #N$03.
  $EC03,$07 Jump to #R$EC1A if *#REGix+#N$01 is equal to #N$1A.
  $EC0A,$04 Jump to #R$EC1A if *#REGix+#N$01 is equal to #N$15.
  $EC0E,$04 Jump to #R$EC1A if *#REGix+#N$01 is equal to #N$10.
  $EC12,$04 Jump to #R$EC1A if *#REGix+#N$01 is equal to #N$0B.
  $EC16,$04 Jump to #R$EC3D if *#REGix+#N$01 is not equal to #N$06.
  $EC1A,$03 #REGc=*#REGix+#N$00.
  $EC1D,$03 #REGb=*#REGix+#N$01.
  $EC20,$03 Decrease #REGb by three.
  $EC23,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $EC26,$03 #HTML(#REGhl=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C84.html">DF_CC</a>.)
  $EC29,$03 #REGa=*#R$F32C.
  $EC2C,$01 Merge the bits from *#REGhl.
  $EC2D,$02 Jump to #R$EC49 if {} is not zero.
  $EC2F,$01 Increment #REGhl by one.
  $EC30,$03 #REGa=*#R$F32D.
  $EC33,$01 Merge the bits from *#REGhl.
  $EC34,$02 Jump to #R$EC49 if {} is not zero.
  $EC36,$01 Increment #REGhl by one.
  $EC37,$03 #REGa=*#R$F32E.
  $EC3A,$01 Merge the bits from *#REGhl.
  $EC3B,$02 Jump to #R$EC49 if {} is not zero.
  $EC3D,$03 Decrease *#REGix+#N$05 by one.
  $EC40,$07 Increment *#R$F33A by one.
  $EC47,$02 Jump to #R$EC59.
  $EC49,$03 #REGa=*#R$F33F.
  $EC4C,$03 Write #REGa to *#R$FFFC.
  $EC4F,$05 Jump to #R$E3A4 if #REGa is not equal to #N$00.
  $EC54,$05 Write #N$00 to *#R$F33A.
  $EC59,$03 Call #R$EEA6.
  $EC5C,$06 Jump to #R$ED10 if #REGc is equal to #N$22.
  $EC62,$05 Jump to #R$ED10 if #REGc is equal to #N$03.
  $EC67,$06 Jump to #R$ED10 if #REGb is equal to #N$18.
  $EC6D,$05 Jump to #R$E3A4 if #REGb is equal to #N$04.
  $EC72,$06 Jump to #R$EC84 if #REGc is not equal to *#REGix+#N$00.
  $EC78,$06 Jump to #R$EC84 if #REGb is not equal to *#REGix+#N$01.
  $EC7E,$06 Jump to #R$ECA5 if *#REGix+#N$03 is equal to #REGd.
  $EC84,$05 Write #N$01 to *#R$F32F.
  $EC89,$02 Stash #REGde and #REGbc on the stack.
  $EC8B,$07 Jump to #R$EC94 if *#REGix+#N$11 is not equal to #N$13.
  $EC92,$02 Decrease #REGc by two.
  $EC94,$03 Call #R$F1AF.
  $EC97,$02 Restore #REGbc and #REGde from the stack.
  $EC99,$04 Jump to #R$ECA5 if #REGa is equal to #N$FF.
  $EC9D,$05 Jump to #R$ED10 if #REGa is not equal to *#REGix+#N$10.
  $ECA2,$03 Call #R$EB8D.
  $ECA5,$03 Write #REGc to *#REGix+#N$00.
  $ECA8,$03 Write #REGb to *#REGix+#N$01.
  $ECAB,$03 Write #REGe to *#REGix+#N$02.
  $ECAE,$03 Write #REGd to *#REGix+#N$03.
  $ECB1,$01 Stash #REGde on the stack.
  $ECB2,$03 Call #R$E9E2.
  $ECB5,$01 Restore #REGde from the stack.
  $ECB6,$03 Write #REGe to *#REGix+#N$02.
  $ECB9,$03 Write #REGd to *#REGix+#N$03.
  $ECBC,$08 Call #R$ED19 if *#R$F33A is higher than #N$08.
  $ECC4,$06 #HTML(Write #R$8A78(#N$8978) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $ECCA,$03 Call #R$EED7.
  $ECCD,$06 Write *#R$A10B to *#R$F32C.
  $ECD3,$06 Write *#R$A12B to *#R$F32D.
  $ECD9,$06 Write *#R$A14B to *#R$F32E.
  $ECDF,$06 Write *#REGix+#N$00 to *#REGix+#N$0D.
  $ECE5,$06 Write *#REGix+#N$01 to *#REGix+#N$0E.
  $ECEB,$06 Write *#REGix+#N$03 to *#REGix+#N$0F.
  $ECF1,$06 Write *#REGix+#N$02 to *#REGix+#N$0B.
  $ECF7,$07 Jump to #R$ED10 if *#R$F32F is equal to #N$00.
  $ECFE,$03 #REGc=*#REGix+#N$00.
  $ED01,$03 #REGb=*#REGix+#N$01.
  $ED04,$07 Jump to #R$ED0D if *#REGix+#N$11 is not equal to #N$13.
  $ED0B,$02 Decrease #REGc by two.
  $ED0D,$03 Call #R$F107.
  $ED10,$04 Write #N$00 to *#REGix+#N$04.
  $ED14,$04 Write #N$00 to *#REGix+#N$05.
  $ED18,$01 Return.
  $ED19,$05 Write #N$01 to *#R$F33F.
  $ED1E,$04 Write #N$02 to *#REGix+#N$11.
  $ED22,$07 Jump to #R$ED2F if *#REGix+#N$06 is lower than #N$9E.
  $ED29,$02 #REGa+=#N$06.
  $ED2B,$04 Jump to #R$ED31 if #REGa is not equal to #N$B0.
  $ED2F,$05 Write #N$9E to *#REGix+#N$06.
  $ED34,$01 Return.

c $ED35

c $EEA6
  $EEA6,$03 #REGc=*#REGix+#N$00.
  $EEA9,$03 #REGb=*#REGix+#N$01.
  $EEAC,$03 #REGe=*#REGix+#N$02.
  $EEAF,$03 #REGd=*#REGix+#N$03.
  $EEB2,$03 #REGa=*#REGix+#N$04.
  $EEB5,$01 #REGa+=#REGe.
  $EEB6,$04 Jump to #R$EEC0 if #REGa is higher than #N$80.
  $EEBA,$04 Jump to #R$EEC3 if #REGa is lower than #N$04.
  $EEBE,$02 Increment #REGc by two.
  $EEC0,$01 Decrease #REGc by one.
  $EEC1,$02,b$01 Keep only bits 0-1.
  $EEC3,$01 #REGe=#REGa.
  $EEC4,$03 #REGa=*#REGix+#N$05.
  $EEC7,$01 #REGa+=#REGd.
  $EEC8,$04 Jump to #R$EED2 if #REGa is higher than #N$80.
  $EECC,$04 Jump to #R$EED5 if #REGa is lower than #N$04.
  $EED0,$02 Increment #REGb by two.
  $EED2,$01 Decrease #REGb by one.
  $EED3,$02,b$01 Keep only bits 0-1.
  $EED5,$01 #REGd=#REGa.
  $EED6,$01 Return.

c $EED7
  $EED7,$03 #REGde=#R$A0EC.
  $EEDA,$03 #REGhl=#R$A06C.
  $EEDD,$03 #REGbc=#N($0080,$04,$04).
  $EEE0,$02 Copy #N($0080,$04,$04) bytes of data from *#REGhl to *#REGde.
  $EEE2,$07 Set INK: *#REGix+#N$09.
  $EEE9,$03 #HTML(#REGhl=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $EEEC,$01 Stash #REGhl on the stack.
  $EEED,$02 Stash #REGiy on the stack.
  $EEEF,$02 Stash #REGix on the stack.
  $EEF1,$03 #REGe=*#REGix+#N$06.
  $EEF4,$02 #REGd=#N$00.
  $EEF6,$02 Shift #REGe left (with carry).
  $EEF8,$02 Rotate #REGd left.
  $EEFA,$02 Shift #REGe left (with carry).
  $EEFC,$02 Rotate #REGd left.
  $EEFE,$02 Shift #REGe left (with carry).
  $EF00,$02 Rotate #REGd left.
  $EF02,$01 #REGhl+=#REGde.
  $EF03,$03 #REGb=*#REGix+#N$02.
  $EF06,$01 Increment #REGb by one.
  $EF07,$02 #REGc=#N$00.
  $EF09,$04 Write #REGbc to *#R$F332.
  $EF0D,$03 #REGe=*#REGix+#N$07.
  $EF10,$03 #REGd=*#REGix+#N$08.
  $EF13,$01 #REGa=#REGd.
  $EF14,$01 Increment #REGa by one.
  $EF15,$06 Shift #REGa left three positions (with carry).
  $EF1B,$01 #REGc=#REGa.
  $EF1C,$02 #REGb=#N$00.
  $EF1E,$04 #REGiy=#R$A0F4.
  $EF22,$02 #REGiy+=#REGbc.
  $EF24,$01 #REGc=#REGe.
  $EF25,$02 Shift #REGc left (with carry).
  $EF27,$02 Shift #REGc left (with carry).
  $EF29,$02 Shift #REGc left (with carry).
  $EF2B,$02 #REGb=#N$00.
  $EF2D,$04 Write #REGbc to *#R$F33C.
  $EF31,$04 #REGix=#R$A0F4.
  $EF35,$03 Stash #REGhl, #REGde and #REGhl on the stack.
  $EF38,$02 #REGb=#N$08.
  $EF3A,$01 Stash #REGbc on the stack.
  $EF3B,$01 #REGa=*#REGhl.
  $EF3C,$04 #REGbc=*#R$F332.
  $EF40,$02 Shift #REGa left (with carry).
  $EF42,$02 Rotate #REGc left.
  $EF44,$02 Shift #REGa left (with carry).
  $EF46,$02 Rotate #REGc left.
  $EF48,$02 Decrease counter by one and loop back to #R$EF40 until counter is zero.
  $EF4A,$03 Write #REGa to *#REGiy+#N$00.
  $EF4D,$01 #REGa=#REGc.
  $EF4E,$03 Set the bits of #REGa with *#REGix+#N$00.
  $EF51,$03 Write #REGa to *#REGix+#N$00.
  $EF54,$01 Increment #REGhl by one.
  $EF55,$02 Increment #REGix by one.
  $EF57,$02 Increment #REGiy by one.
  $EF59,$01 Restore #REGbc from the stack.
  $EF5A,$02 Decrease counter by one and loop back to #R$EF3A until counter is zero.
  $EF5C,$01 Restore #REGhl from the stack.
  $EF5D,$04 #REGbc=*#R$F33C.
  $EF61,$01 #REGhl+=#REGbc.
  $EF62,$01 Decrease #REGd by one.
  $EF63,$02 Jump to #R$EF37 until #REGd is zero.
  $EF65,$01 Restore #REGde from the stack.
  $EF66,$03 #REGbc=#N($0008,$04,$04).
  $EF69,$02 #REGix+=#REGbc.
  $EF6B,$02 #REGiy+=#REGbc.
  $EF6D,$01 Restore #REGhl from the stack.
  $EF6E,$01 #REGhl+=#REGbc.
  $EF6F,$01 Decrease #REGe by one.
  $EF70,$02 Jump to #R$EF35 until #REGe is zero.
  $EF72,$03 #REGhl=#R$9FEC.
  $EF75,$02 Restore #REGix from the stack.
  $EF77,$03 #REGa=*#REGix+#N$03.
  $EF7A,$01 Increment #REGa by one.
  $EF7B,$02 Shift #REGa left (with carry).
  $EF7D,$01 #REGe=#REGa.
  $EF7E,$02 #REGd=#N$00.
  $EF80,$01 #REGhl+=#REGde.
  $EF81,$03 #HTML(Write #REGhl to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $EF84,$03 #REGd=*#REGix+#N$08.
  $EF87,$03 #REGe=*#REGix+#N$07.
  $EF8A,$07 Jump to #R$EF92 if *#REGix+#N$02 is equal to #N$03.
  $EF91,$01 Increment #REGe by one.
  $EF92,$01 Increment #REGd by one.
  $EF93,$01 #REGa=#REGd.
  $EF94,$03 Write #REGa to *#R$F33E.
  $EF97,$07 Jump to #R$EF9F if #N$03 is not equal to *#REGix+#N$03.
  $EF9E,$01 Decrease #REGd by one.
  $EF9F,$03 #REGb=*#REGix+#N$01.
  $EFA2,$03 #REGc=*#REGix+#N$00.
  $EFA5,$01 #REGa=#REGd.
  $EFA6,$02 #REGa=#N$20.
  $EFA8,$02 Restore #REGiy from the stack.
  $EFAA,$02 #REGa=#N$20.
  $EFAC,$03 Stash #REGaf, #REGde and #REGbc on the stack.
  $EFAF,$01 #REGd=#REGa.
  $EFB0,$05 Jump to #R$EFE9 if #REGc is higher than #N$22.
  $EFB5,$01 Stash #REGde on the stack.
  $EFB6,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $EFB9,$02 Restore #REGde and #REGbc from the stack.
  $EFBB,$01 Stash #REGbc on the stack.
  $EFBC,$01 #REGa=#REGd.
  $EFBD,$03 Call #R$E6DC.
  $EFC0,$06 Call #R$EFDC if #REGc is equal to #N$02.
  $EFC6,$01 Decrease #REGc by one.
  $EFC7,$03 #REGa=*#R$F33E.
  $EFCA,$01 #REGa+=#REGd.
  $EFCB,$01 #REGd=#REGa.
  $EFCC,$01 Decrease #REGe by one.
  $EFCD,$02 Jump to #R$EFBD until #REGe is zero.
  $EFCF,$03 Restore #REGbc, #REGde and #REGaf from the stack.
  $EFD2,$01 Decrease #REGb by one.
  $EFD3,$01 Increment #REGa by one.
  $EFD4,$01 Decrease #REGd by one.
  $EFD5,$02 Jump to #R$EFAC until #REGd is zero.
  $EFD7,$01 Restore #REGhl from the stack.
  $EFD8,$03 #HTML(Write #REGhl to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $EFDB,$01 Return.
  $EFDC,$01 Decrease #REGe by one.
  $EFDD,$01 Stash #REGaf on the stack.
  $EFDE,$01 Increment #REGe by one.
  $EFDF,$01 Restore #REGaf from the stack.
  $EFE0,$01 Return if #REGe is zero.
  $EFE1,$01 Decrease #REGe by one.
  $EFE2,$03 #REGa=*#R$F33E.
  $EFE5,$01 #REGa+=#REGd.
  $EFE6,$01 #REGd=#REGa.
  $EFE7,$02 Jump to #R$EFDC.
  $EFE9,$03 #REGa=*#R$F33E.
  $EFEC,$01 #REGa+=#REGd.
  $EFED,$01 #REGd=#REGa.
  $EFEE,$01 Decrease #REGe by one.
  $EFEF,$03 Jump to #R$EFFB if #REGe is zero.
  $EFF2,$01 Decrease #REGc by one.
  $EFF3,$05 Jump to #R$EFE9 if #REGc is higher than #N$22.
  $EFF8,$03 Jump to #R$EFB5.
  $EFFB,$03 Restore #REGbc, #REGbc and #REGbc from the stack.
  $EFFE,$03 Jump to #R$EFD7.

c $F001 Handler: Pirates
@ $F001 label=HandlerPirates
  $F001,$06 Return if *#R$F334 is equal to #N$00.
  $F007,$06 #HTML(Write #R$8F28(#N$8E28) (#R$8F28) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $F00D,$04 #REGix=*#R$5BDE.
@ $F011 label=HandlerPirates_Loop
  $F011,$06 Return if Pirate state (*#REGix+#N$00) is equal to OFF (#N$FF).
  $F017,$07 Set INK: Pirate attribute (*#REGix+#N$09).
N $F01E Update the sprite frame.
  $F01E,$03 Fetch the current Pirate sprite reference (*#REGix+#N$06).
  $F021,$02 Add #N$06.
  $F023,$03 Write it back to the current Pirate sprite reference (*#REGix+#N$06).
N $F026
  $F026,$04 Jump to #R$F02E if #REGa is not equal to #N$4A.
  $F02A,$04 Write #N$20 (facing right) to Pirate sprite reference (*#REGix+#N$06).
@ $F02E label=HandlerPirates_CheckSpriteFrames
  $F02E,$04 Jump to #R$F036 if #REGa is not equal to #N$80.
  $F032,$04 Write #N$50 (facing left) to Pirate sprite reference (*#REGix+#N$06).
@ $F036 label=HandlerPirates_SkipSpriteFrames
  $F036,$03 Call #R$EEA6.
  $F039,$06 Jump to #R$F0EE if #REGc is equal to #N$22.
  $F03F,$05 Jump to #R$F0E3 if #REGc is equal to #N$03.
  $F044,$02 Stash #REGde and #REGbc on the stack.
  $F046,$07 Jump to #R$F04F if the direction the Pirate is moving (*#REGix+#N$04) is not right (#N$FF).
  $F04D,$02 Decrease #REGc by two.
  $F04F,$03 Call #R$F1AF.
  $F052,$02 Restore #REGbc and #REGde from the stack.
  $F054,$05 Jump to #R$F0F9 if #REGa is not equal to #N$FF.
  $F059,$02 Stash #REGbc and #REGde on the stack.
  $F05B,$03 Decrease #REGb by three.
  $F05E,$07 Jump to #R$F067 if the direction the Pirate is moving (*#REGix+#N$04) is not right (#N$FF).
  $F065,$02 Decrease #REGc by two.
  $F067,$03 Call #R$E762.
  $F06A,$03 #REGhl=#R$A1C4.
  $F06D,$04 #REGde=*#R$F330.
  $F071,$01 #REGhl+=#REGde.
  $F072,$02 Restore #REGde and #REGbc from the stack.
  $F074,$06 Jump to #R$F0F9 if *#REGhl is lower than #N$21.
  $F07A,$03 Write #REGc to *#REGix+#N$00.
  $F07D,$03 Write #REGb to *#REGix+#N$01.
  $F080,$03 Write #REGe to *#REGix+#N$02.
  $F083,$03 Write #REGd to *#REGix+#N$03.
  $F086,$03 Call #R$E9E2.
  $F089,$03 Call #R$EED7.
  $F08C,$06 Write *#REGix+#N$00 to *#REGix+#N$0D.
  $F092,$06 Write *#REGix+#N$01 to *#REGix+#N$0E.
  $F098,$06 Write *#REGix+#N$02 to *#REGix+#N$0B.
  $F09E,$06 Write *#REGix+#N$03 to *#REGix+#N$0F.
  $F0A4,$03 #REGc=*#REGix+#N$00.
  $F0A7,$01 Decrease #REGc by one.
  $F0A8,$04 Shift #REGc left two positions (with carry).
  $F0AC,$03 #REGa=*#REGix+#N$02.
  $F0AF,$01 #REGa+=#REGc.
  $F0B0,$01 #REGc=#REGa.
  $F0B1,$04 #REGb=*#R$F233.
  $F0B5,$03 #REGa=*#R$F231.
  $F0B8,$01 Decrease #REGa by one.
  $F0B9,$04 Shift #REGa left two positions (with carry).
  $F0BD,$01 #REGa+=#REGb.
  $F0BE,$02 #REGa+=#N$07.
  $F0C0,$01 #REGa-=#REGc.
  $F0C1,$04 Jump to #R$F0DB if #REGa is higher than #N$10.
  $F0C5,$03 #REGb=*#REGix+#N$01.
  $F0C8,$03 #REGa=*#R$F232.
  $F0CB,$02 #REGa+=#N$02.
  $F0CD,$01 #REGa-=#REGb.
  $F0CE,$05 Jump to #R$F0DB if #REGa is higher than #N$06.
  $F0D3,$05 Write #N$02 to *#R$FFFE.
  $F0D8,$03 Jump to #R$E3A4.
N $F0DB Move onto the next Pirate.
@ $F0DB label=HandlerPirate_Next
  $F0DB,$05 #REGix+=#N($0010,$04,$04).
  $F0E0,$03 Jump to #R$F011.
N $F0E3 Alters the direction of the Pirate to now face and move left.
@ $F0E3 label=HandlerPirate_TurnLeft
  $F0E3,$04 Write #N$01 (move left) to Pirate direction (*#REGix+#N$04).
  $F0E7,$04 Write #N$50 (facing left) to Pirate sprite reference (*#REGix+#N$06).
  $F0EB,$03 Jump to #R$F089.
N $F0EE Alters the direction of the Pirate to now face and move right.
@ $F0EE label=HandlerPirate_TurnRight
  $F0EE,$04 Write #N$FF (move right) to Pirate direction (*#REGix+#N$04).
  $F0F2,$04 Write #N$20 (facing right) to Pirate sprite reference (*#REGix+#N$06).
  $F0F6,$03 Jump to #R$F089.
N $F0F9 Handle making the Pirate about-turn.
@ $F0F9 label=Pirate_TurnController
  $F0F9,$08 Jump to #R$F0E3 if the direction the Pirate is moving (*#REGix+#N$04) is right (#N$FF).
  $F101,$03 Jump to #R$F0EE.
N $F104 Clear the pirate data reference from the stack before returning.
@ $F104 label=HandlerPirate_Housekeeping
  $F104,$02 Restore the current pirate data reference from the stack.
  $F106,$01 Return.

c $F107
  $F107,$02 Stash #REGix on the stack.
  $F109,$04 #REGix=*#R$5BDA.
  $F10D,$07 Jump to #R$F104 if *#REGix+#N$00 is equal to #N$FF.
  $F114,$03 #REGa=*#REGix+#N$05.
  $F117,$02,b$01 Keep only bits 1.
  $F119,$02 Jump to #R$F127 if the result is zero.
  $F11B,$06 Jump to #R$F127 if *#REGix+#N$02 is not equal to #REGc.
  $F121,$06 Jump to #R$F12E if *#REGix+#N$03 is equal to #REGb.
  $F127,$03 #REGde=#N($0006,$04,$04).
  $F12A,$02 #REGix+=#REGde.
  $F12C,$02 Jump to #R$F10D.

  $F12E,$05 Write #N$06 to *#R$FFFE.
  $F133,$04 Write #N$01 to *#REGix+#N$05.
  $F137,$03 #REGc=*#REGix+#N$02.
  $F13A,$03 #REGb=*#REGix+#N$03.
  $F13D,$02 #REGe=#N$01.
  $F13F,$02 #REGd=#N$02.
  $F141,$02 #REGa=#N$00.
  $F143,$03 Call #R$E72F.
  $F146,$03 #HTML(#REGhl=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $F149,$01 Stash #REGhl on the stack.
  $F14A,$06 #HTML(Write #R$A06C(#N$9F6C) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $F150,$02 #REGa=#N$20.
  $F152,$03 Call #R$EA93.
  $F155,$01 Restore #REGhl from the stack.
  $F156,$03 #HTML(Write #REGhl to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $F159,$03 #REGa=*#REGix+#N$04.
  $F15C,$02 Restore #REGix from the stack.
  $F15E,$01 Stash #REGaf on the stack.
  $F15F,$07 Jump to #R$F1AA if *#REGix+#N$10 is equal to #N$00.
  $F166,$02 Stash #REGix on the stack.
  $F168,$03 Call #R$F1E5.
  $F16B,$03 #HTML(#REGhl=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $F16E,$01 Stash #REGhl on the stack.
  $F16F,$06 #HTML(Write #R$8478(#N$8378) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $F175,$07 Set INK: *#R$5BCC.
  $F17C,$04 Write #N$03 to *#REGix+#N$05.
  $F180,$03 #REGc=*#REGix+#N$02.
  $F183,$03 #REGb=*#REGix+#N$03.
  $F186,$01 Stash #REGbc on the stack.
  $F187,$03 Call #R$E762.
  $F18A,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $F18D,$03 #REGa=*#REGix+#N$04.
  $F190,$02 #REGa+=#N$41.
  $F192,$03 Call #R$E804.
  $F195,$01 #HTML(Print to the screen using RST <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0010.html">#N$10</a>.)
  $F196,$01 Restore #REGbc from the stack.
  $F197,$01 Decrease #REGb by one.
  $F198,$03 Call #R$E762.
  $F19B,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $F19E,$02 #REGa=#N$4B.
  $F1A0,$03 Call #R$E804.
  $F1A3,$01 #HTML(Print to the screen using RST <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0010.html">#N$10</a>.)
  $F1A4,$01 Restore #REGhl from the stack.
  $F1A5,$03 #HTML(Write #REGhl to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $F1A8,$02 Restore #REGix from the stack.
  $F1AA,$01 Restore #REGaf from the stack.
  $F1AB,$03 Write #REGa to *#REGix+#N$10.
  $F1AE,$01 Return.

c $F1AF
  $F1AF,$02 Stash #REGix on the stack.
  $F1B1,$04 #REGix=*#R$5BDA.
  $F1B5,$03 #REGde=#N($0006,$04,$04).
  $F1B8,$08 Jump to #R$F104 if *#REGix+#N$00 is equal to #N$FF.
  $F1C0,$06 Jump to #R$F1E1 if #REGc is not equal to *#REGix+#N$00.
  $F1C6,$03 #REGa=*#REGix+#N$01.
  $F1C9,$02 Decrease #REGa by two.
  $F1CB,$03 Jump to #R$F1E1 if #REGa is not equal to #REGb.
  $F1CE,$05 Compare *#REGix+#N$05 with #N$00.
  $F1D3,$02 #REGa=#N$FF.
  $F1D5,$03 Jump to #R$F104 if *#REGix+#N$05 was equal to #N$00 on line #R$F1CE.
  $F1D8,$03 #REGa=*#REGix+#N$04.
  $F1DB,$03 #REGhl=#REGix (using the stack).
  $F1DE,$02 Restore #REGix from the stack.
  $F1E0,$01 Return.
  $F1E1,$02 #REGix+=#REGde.
  $F1E3,$02 Jump to #R$F1B8.

c $F1E5
  $F1E5,$03 #REGde=#N($0006,$04,$04).
  $F1E8,$01 #REGc=#REGa.
  $F1E9,$04 #REGix=#R$5BDA.
  $F1ED,$06 Return if *#REGix+#N$00 is equal to #N$FF.
  $F1F3,$05 Return if #REGc is equal to *#REGix+#N$04.
  $F1F8,$02 #REGix+=#REGde.
  $F1FA,$02 Jump to #R$F1ED.

c $F1FC
  $F1FC,$06 #HTML(Write #R$924C(#N$914C) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $F202,$06 Set INK: #N$05.
  $F208,$03 #REGa=*#R$F259.
  $F20B,$01 Increment #REGa by one.
  $F20C,$02,b$01 Keep only bits 0-1.
  $F20E,$03 Write #REGa to *#R$F259.
  $F211,$01 Return if #REGa is not zero.
  $F212,$03 #REGhl=*#R$5BDC.
  $F215,$01 #REGc=*#REGhl.
  $F216,$01 Increment #REGhl by one.
  $F217,$01 #REGb=*#REGhl.
  $F218,$01 Increment #REGhl by one.
  $F219,$04 Return if #REGc is equal to #N$FF.
  $F21D,$01 #REGa=*#REGhl.
  $F21E,$02 #REGa+=#N$04.
  $F220,$04 Jump to #R$F226 if #REGa is not equal to #N$40.
  $F224,$03 Write #N$20 to *#REGhl.
  $F227,$01 Increment #REGhl by one.
  $F228,$02 #REGd=#N$02.
  $F22A,$02 #REGe=#N$02.
  $F22C,$03 Call #R$EA93.
  $F22F,$02 Jump to #R$F215.

b $F231
  $F232
  $F233
  $F245,$14
  $F259

b $F25B
  $F25B,$08 #UDGTABLE { #UDG(#PC) } UDGTABLE#
L $F25B,$08,$0C

t $F2BB Messaging: Game Status Bar
@ $F2BB label=Messaging_GameStatusBar
  $F2BB,$20 "#STR(#PC,$04,$20)".

b $F2DB
  $F317
  $F31C
  $F32D
  $F32E
  $F32F
  $F330
  $F332
  $F334
  $F335
  $F336
  $F33A
  $F33C
  $F33E
  $F33F
  $F340
  $F342
  $F343

c $F618
  $F618,$02 Stash #REGbc and #REGbc on the stack.
  $F61A,$03 Call #R$F63A.
  $F61D,$03 #REGbc=#N$FFFE.
  $F620,$03 #REGa=*#R$5BD0.
  $F623,$02
  $F625,$01 Restore #REGbc from the stack.
  $F626,$03 Call #R$F63A.
  $F629,$03 #REGbc=#N$FFFE.
  $F62C,$03 #REGa=*#R$5BD0.
  $F62F,$02,b$01 Set bit 4.
  $F631,$02
  $F633,$01 Restore #REGbc from the stack.
  $F634,$01 Decrease #REGde by one.
  $F635,$04 Jump to #R$F618 until #REGde is zero.
  $F639,$01 Return.
  $F63A,$01 Stash #REGbc on the stack.
  $F63B,$03 Call #R$F8AF.
  $F63E,$01 Merge the bits from #REGb.
  $F63F,$01 #REGb=#REGa.
  $F640,$04 Jump to #R$F646 if #REGa is zero.
  $F644,$02 Decrease counter by one and loop back to #R$F644 until counter is zero.
  $F646,$01 Restore #REGbc from the stack.
  $F647,$01 Return.

c $F648
  $F648,$01 Stash #REGbc on the stack.
  $F649,$03 #REGa=*#R$5BD0.
  $F64C,$03 #REGbc=#R$FFFE.
  $F64F,$02 Send #REGa to port *#REGc.
  $F651,$01 Restore #REGbc from the stack.
  $F652,$01 Stash #REGbc on the stack.
  $F653,$03 Call #R$F8C0.
  $F656,$03 #REGa=*#R$5BD0.
  $F659,$03 #REGbc=#R$FFFE.
  $F65C,$02,b$01 Set bit 4.
  $F65E,$02 Send #REGa to port *#REGc.
  $F660,$01 Restore #REGbc from the stack.
  $F661,$01 Stash #REGbc on the stack.
  $F662,$03 Call #R$F8C0.
  $F665,$01 Restore #REGbc from the stack.
  $F666,$01 Decrease #REGde by one.
  $F667,$04 Jump to #R$F648 until #REGde is zero.
  $F66B,$01 Return.

c $F66C

c $F6B5

c $F6DB

c $F723
  $F723,$02 Stash #REGbc and #REGde on the stack.
  $F725,$03 #REGde=#N($0019,$04,$04).
  $F728,$03 #REGbc=#N($0032,$04,$04).
  $F72B,$03 Call #R$F66C.
  $F72E,$03 Restore #REGde, #REGbc and #REGaf from the stack.
  $F731,$02 #REGa=#N$00.
  $F733,$03 Write #REGa to *#N$FFFE.
  $F736,$01 Restore #REGaf from the stack.
  $F737,$02 Restore #REGiy from the stack.
  $F739,$01 Enable interrupts.
  $F73A,$01 Return.

c $F73B
  $F73B,$02 Stash #REGde and #REGbc on the stack.
  $F73D,$03 #REGde=#N($0032,$04,$04).
  $F740,$03 #REGbc=#N($0064,$04,$04).
  $F743,$03 Call #R$F6B5.
  $F746,$03 Restore #REGbc, #REGde and #REGaf from the stack.
  $F749,$02 #REGa=#N$00.
  $F74B,$03 Write #REGa to *#N$FFFE.
  $F74E,$01 Restore #REGaf from the stack.
  $F74F,$02 Restore #REGiy from the stack.
  $F751,$01 Enable interrupts.
  $F752,$01 Return.

c $F753
  $F753,$02 Stash #REGbc and #REGde on the stack.
  $F755,$03 #REGbc=#N($0096,$04,$04).
  $F758,$03 #REGde=#N($0064,$04,$04).
  $F75B,$03 Call #R$F6B5.
  $F75E,$03 #REGde=#N($0064,$04,$04).
  $F761,$03 #REGbc=#N($0001,$04,$04).
  $F764,$03 Call #R$F66C.
  $F767,$03 Restore #REGde, #REGbc and #REGaf from the stack.
  $F76A,$05 Write #N$00 to *#N$FFFE.
  $F76F,$01 Restore #REGaf from the stack.
  $F770,$01 Enable interrupts.
  $F771,$02 Restore #REGiy from the stack.
  $F773,$01 Return.

c $F774
  $F774,$02 Stash #REGbc and #REGde on the stack.
  $F776,$03 #REGde=#N($00C8,$04,$04).
  $F779,$03 #REGbc=#N($0014,$04,$04).
  $F77C,$03 Call #R$F66C.
  $F77F,$03 Restore #REGde, #REGbc and #REGaf from the stack.
  $F782,$05 Write #N$00 to *#N$FFFE.
  $F787,$01 Restore #REGaf from the stack.
  $F788,$01 Enable interrupts.
  $F789,$02 Restore #REGiy from the stack.
  $F78B,$01 Return.

c $F78C
  $F78C,$02 Stash #REGde and #REGbc on the stack.
  $F78E,$03 #REGbc=#N($0032,$04,$04).
  $F791,$03 #REGde=#N($0019,$04,$04).
  $F794,$03 Call #R$F6B5.
  $F797,$03 Restore #REGbc, #REGde and #REGaf from the stack.
  $F79A,$05 Write #N$00 to *#N$FFFE.
  $F79F,$01 Restore #REGaf from the stack.
  $F7A0,$02 Restore #REGiy from the stack.
  $F7A2,$01 Enable interrupts.
  $F7A3,$01 Return.

c $F7A4
  $F7A4,$02 Stash #REGbc and #REGde on the stack.
  $F7A6,$02 #REGb=#N$0A.
  $F7A8,$01 Stash #REGbc on the stack.
  $F7A9,$03 #REGbc=#N($0064,$04,$04).
  $F7AC,$03 #REGde=#N($0032,$04,$04).
  $F7AF,$03 Call #R$F66C.
  $F7B2,$01 Restore #REGbc from the stack.
  $F7B3,$02 Decrease counter by one and loop back to #R$F7A8 until counter is zero.
  $F7B5,$03 Restore #REGde, #REGbc and #REGaf from the stack.
  $F7B8,$05 Write #N$00 to *#N$FFFE.
  $F7BD,$01 Restore #REGaf from the stack.
  $F7BE,$02 Restore #REGiy from the stack.
  $F7C0,$01 Enable interrupts.
  $F7C1,$01 Return.

c $F7C2
  $F7C2,$03 #REGbc=#N($0005,$04,$04).
  $F7C5,$03 #REGde=#N($0032,$04,$04).
  $F7C8,$03 Call #R$F648.
  $F7CB,$04 Restore #REGde, #REGbc, #REGaf and #REGaf from the stack.
  $F7CF,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0038.html">MASK_INT</a>.)
  $F7D2,$02 Restore #REGiy from the stack.
  $F7D4,$01 Return.
  $F7D5,$02 Restore #REGde and #REGbc from the stack.
  $F7D7,$01 Return.

c $F7D8
  $F7D8,$02 Stash #REGbc and #REGde on the stack.
  $F7DA,$03 #REGa=*#R$FE88.
  $F7DD,$02,b$01 Keep only bits 0-2.
  $F7DF,$03 Jump to #R$F7C2 if the result is zero.
  $F7E2,$01 Stash #REGhl on the stack.
  $F7E3,$03 #REGde=#N($000A,$04,$04).
  $F7E6,$02 #REGb=#N$1F.
  $F7E8,$03 Call #R$F618.
  $F7EB,$05 Restore #REGhl, #REGde, #REGbc, #REGaf and #REGaf from the stack.
  $F7F0,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0038.html">MASK_INT</a>.)
  $F7F3,$02 Restore #REGiy from the stack.
  $F7F5,$01 Return.

c $F7F6
  $F7F6,$03 Stash #REGbc, #REGde and #REGhl on the stack.
  $F7F9,$02 #REGb=#N$FF.
  $F7FB,$03 #REGde=#N($0014,$04,$04).
  $F7FE,$03 Call #R$F618.
  $F801,$05 Restore #REGhl, #REGde, #REGbc, #REGaf and #REGaf from the stack.
  $F806,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0038.html">MASK_INT</a>.)
  $F809,$02 Restore #REGiy from the stack.
  $F80B,$01 Enable interrupts.
  $F80C,$01 Return.

c $F80D

c $F855

c $F863

c $F888

c $F8AF
  $F8BF,$01 Return.

c $F8C0
  $F8C5,$01 Return.

u $F8C6

b $FA00

c $FE69

g $FFF8 Sound: On/ Off
@ $FFF8 label=SoundOnOff
B $FFF8,$01

b $FFF9
  $FFFA
  $FFFB
  $FFFC
  $FFFD
  $FFFE
  $FFFF
