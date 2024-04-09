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

u $5B00
B $5B00,$01

b $5B01 Game Entry Commands
@ $5B01 label=GameEntryCommands
D $5B01 See #R$6957. This data is copied to #R$CD14 after the game is loaded
. and then becomes the game entry point executable code.

g $5B3F Pointer: Game Entry Point
@ $5B3F label=Pointer_GameEntryPoint
W $5B3F,$02

b $5B41

g $5BCC Active Room: Key Colour
@ $5BCC label=ActiveRoom_KeyColour
D $5BCC See #R$A900, #R$AB44 and #R$F107.
B $5BCC,$01

g $5BCD Active Room: Closed Door Colour
@ $5BCD label=ActiveRoom_ClosedDoorColour
D $5BCD See #R$A9D1.
B $5BCD,$01

u $5BCE
B $5BCE,$01

g $5BCF Active Room: Room Scaffolding Colour
@ $5BCF label=ActiveRoom_ScaffoldingColour
D $5BCF See #R$A921, #R$A997 and #R$A9BF.
B $5BCF,$01

g $5BD0 Active Border Colour
@ $5BD0 label=Active_BorderColour
B $5BD0,$01

g $5BD1 Active Room: Paper Colour
@ $5BD1 label=ActiveRoom_PaperColour
D $5BD1 See.
B $5BD1,$01

g $5BD2 Active Room: Ladder Colour
@ $5BD2 label=ActiveRoom_LadderColour
D $5BD2 See #R$A952.
B $5BD2,$01

g $5BD3 Current Room: Room ID
@ $5BD3 label=CurrentRoom
B $5BD3,$01

g $5BD4 Temporary: Current Room ID
@ $5BD4 label=TempCurrentRoomID
B $5BD4,$01

u $5BD5
B $5BD5,$01

g $5BD6 Reference: Doors
@ $5BD6 label=ReferenceDoors
D $5BD6 See #R$A973, #R$AB44 and #R$EE5B.
W $5BD6,$02

g $5BD8 Reference: Ladders
@ $5BD8 label=ReferenceLadders
D $5BD8 See #R$A959, #R$AB7B, #R$EDA7 and #R$EE15.
W $5BD8,$02

g $5BDA Reference: Keys And Locked Doors
@ $5BDA label=ReferenceKeysAndLockedDoors
D $5BDA See #R$A99E, #R$AB84, #R$E151, #R$F109, #R$F1B1 and #R$F1E9.
W $5BDA,$02

g $5BDC Reference: Port Hole Reference
@ $5BDC label=ReferencePortHole
D $5BDC Populated by #R$AB44(#N$AB8D), see #R$F1FC for usage.
W $5BDC,$02

g $5BDE Reference: Pirate
@ $5BDE label=ReferencePirate
D $5BDE #TABLE(default,centre)
. { =h Pirate Reference }
. { #R$BB2D }
. { #R$BB4E }
. { #R$BB80 }
. TABLE#
W $5BDE,$02 Reference to Pirate data.

g $5BE0 Reference: Items
@ $5BE0 label=ReferenceItems
D $5BE0 See #R$AA1C, #R$AB9F and #R$E5F4.
W $5BE0,$02

g $5BE2 Reference: Furniture
@ $5BE2 label=ReferenceFurniture
D $5BE2 See #R$AA55 and #R$ABA8.
W $5BE2,$02

g $5BE4 Reference: Lifts
@ $5BE4 label=ReferenceLifts
D $5BE4 See #R$ABB1, #R$E4F1 and #R$E833.
W $5BE4,$02

g $5BE6 Reference: Disappearing Floors
@ $5BE6 label=ReferenceDisappearingFloors
D $5BE6 Used by the routines at #R$AB44 and #R$E581.
W $5BE6,$02

g $5BE8 Pointer: Current Room Buffer
@ $5BE8 label=PointerCurrentRoomBuffer
D $5BE8 Initialised at #R$AB44. Used by the routine at #R$A900.
W $5BE8,$02 Will always be #R$BAD7 when set.

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

g $5BF0 Game State
@ $5BF0 label=GameState
D $5BF0 #TABLE(default,centre,centre)
. { =h Byte | =h Meaning }
. { #N$01 | Normal Game }
. { #N$02 | Mystery Game Mode }
. { #N$03 | Demo Mode }
. TABLE#
B $5BF0,$01

g $5BF1 Player Lives
@ $5BF1 label=PlayerLives
B $5BF1,$01

g $5BF2 Player Treasure
@ $5BF2 label=PlayerTreasure
B $5BF2,$02

g $5BF4 Player Booty
@ $5BF4 label=PlayerBooty
D $5BF4 The count of how much booty the player has collected in the current
. game.
.
. Initialised to #N($0000,$04,$04) in #R$DEA8 at the start of a new game, unless
. #R$5BF0 is set to "Mystery Game Mode" (#N$02) in which case the game begins
. with the previous games value continued (but all the booty is respawned).
.
. Used by the routines at #R$DEA8, #R$E0A9, #R$E12A and #R$E5F4.
B $5BF4,$02

u $5BF6
B $5BF6,$04

g $5BFA Golden Key Timer Frame Skip
@ $5BFA label=TimerGoldenKey_FrameSkip
D $5BFA Probably could name this better - this represents the number of frames to skip before counting down the actual
. Golden Key Timer at #R$5BFF(#N$5BFF).
W $5BFA,$02

g $5BFC Golden Key Room ID
@ $5BFC label=GoldenKeyRoom
B $5BFC,$01

g $5BFD Golden Key Position
@ $5BFD label=PositionGoldenKey
B $5BFD,$01 Horizontal position.
B $5BFE,$01 Vertical position.

g $5BFF Golden Key Timer
@ $5BFF label=TimerGoldenKey
B $5BFF,$01

u $5C00

t $5DDF Messaging: Booty
@ $5DDF label=Messaging_Booty
  $5DDF,$0A "#STR(#PC,$04,$0A)".

b $5DE9

> $6940 @org
c $6940 On-Load Entry Point #1
@ $6940 label=FinishedLoadingEntryPoint
  $6940,$01 Disable interrupts.
  $6941,$04 #REGde=*#R$5B3F.
  $6945,$02 Jump to #R$6957.

b $6947

c $6957 On-Load Entry Point #2
@ $6957 label=LoadingEntryPointContinued
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

b $8478 Graphics: Room Furniture #1
@ $8478 label=Graphics_RoomScaffolding_Empty
@ $8480 label=Graphics_RoomScaffolding_Top1
@ $8488 label=Graphics_RoomScaffolding_Top2
  $8478,$08 #UDGTABLE(default,centre) { #N($20+((#PC-$8478)/$08)) } { #UDG(#PC) } UDGTABLE#
L $8478,$08,$03
@ $8490 label=Graphics_Door
  $8490,$60,$08 #UDGTABLE(default,centre) { #N($20+((#PC-$8478)/$08)) } { #UDGS$03,$04,$04(door)(#UDG(#PC+$08*($03*$y+$x),attr=$0C)(*door)door) } UDGTABLE#
@ $84F0 label=Graphics_Ladder
  $84F0,$50,$08 #UDGTABLE(default,centre) { #N($20+((#PC-$8478)/$08)) } { #UDGS$02,$05,$04(ladder)(#UDG(#PC+$08*($02*$y+$x),attr=$0D)(*ladder)ladder) } UDGTABLE#
@ $8540 label=Graphics_DoorLabels
  $8540,$08 #LET(filename=#EVAL($01+(#PC-$8540)/$08)) #UDGTABLE(default,centre) { #N($20+((#PC-$8478)/$08)) } { #UDG(#PC,attr=$0E)(#FORMAT(door-label-{filename})) } UDGTABLE#
L $8540,$08,$09
@ $8588 label=Graphics_KeyLabels
  $8588,$08 #LET(filename=#EVAL($01+(#PC-$8588)/$08)) #UDGTABLE(default,centre) { #N($20+((#PC-$8478)/$08)) } { #UDG(#PC,attr=$0C)(#FORMAT(key-label-{filename})) } UDGTABLE#
L $8588,$08,$09
@ $85D0 label=Graphics_KeyBottom
  $85D0,$08 #UDGTABLE(default,centre) { #N($20+((#PC-$8478)/$08)) } { #UDG(#PC,attr=$0C)(key-bottom) } UDGTABLE#
@ $85D8 label=Graphics_DoorClosed
  $85D8,$20,$08 #UDGTABLE(default,centre) { #N($20+((#PC-$8478)/$08)) } { #UDGS$01,$04,$04(door-closed)(#UDG(#PC+$08*$y,attr=$0E)(*door-closed)door-closed) } UDGTABLE#
@ $85F8 label=Graphics_CandleStick
  $85F8,$20,$08 #UDGTABLE(default,centre) { #N($20+((#PC-$8478)/$08)) } { #UDGS$02,$02,$04(candlestick)(#UDG(#PC+$08*($02*$y+$x),attr=$0F)(*candlestick)candlestick) } UDGTABLE#
@ $8618 label=Graphics_Sword
  $8618,$20,$08 #UDGTABLE(default,centre) { #N($20+((#PC-$8478)/$08)) } { #UDGS$02,$02,$04(sword)(#UDG(#PC+$08*($02*$y+$x),attr=$0E)(*sword)sword) } UDGTABLE#
@ $8638 label=Graphics_Swag
  $8638,$20,$08 #UDGTABLE(default,centre) { #N($20+((#PC-$8478)/$08)) } { #UDGS$02,$02,$04(swag)(#UDG(#PC+$08*($02*$y+$x),attr=$0B)(*swag)swag) } UDGTABLE#
@ $8658 label=Graphics_Vase
  $8658,$20,$08 #UDGTABLE(default,centre) { #N($20+((#PC-$8478)/$08)) } { #UDGS$02,$02,$04(vase)(#UDG(#PC+$08*($02*$y+$x),attr=$0E)(*vase)vase) } UDGTABLE#
@ $8678 label=Graphics_Pistol
  $8678,$20,$08 #UDGTABLE(default,centre) { #N($20+((#PC-$8478)/$08)) } { #UDGS$02,$02,$04(pistol)(#UDG(#PC+$08*($02*$y+$x),attr=$0B)(*pistol)pistol) } UDGTABLE#
@ $8698 label=Graphics_Chest
  $8698,$20,$08 #UDGTABLE(default,centre) { #N($20+((#PC-$8478)/$08)) } { #UDGS$02,$02,$04(chest)(#UDG(#PC+$08*($02*$y+$x),attr=$0A)(*chest)chest) } UDGTABLE#
@ $86B8 label=Graphics_Map
  $86B8,$20,$08 #UDGTABLE(default,centre) { #N($20+((#PC-$8478)/$08)) } { #UDGS$02,$02,$04(map)(#UDG(#PC+$08*($02*$y+$x),attr=$0F)(*map)map) } UDGTABLE#
@ $86D8 label=Graphics_SpyGlass
  $86D8,$20,$08 #UDGTABLE(default,centre) { #N($20+((#PC-$8478)/$08)) } { #UDGS$02,$02,$04(spyglass)(#UDG(#PC+$08*($02*$y+$x),attr=$0F)(*spyglass)spyglass) } UDGTABLE#
@ $86F8 label=Graphics_LogBook
  $86F8,$20,$08 #UDGTABLE(default,centre) { #N($20+((#PC-$8478)/$08)) } { #UDGS$02,$02,$04(logbook)(#UDG(#PC+$08*($02*$y+$x),attr=$0F)(*logbook)logbook) } UDGTABLE#
@ $8718 label=Graphics_Sextant
  $8718,$20,$08 #UDGTABLE(default,centre) { #N($20+((#PC-$8478)/$08)) } { #UDGS$02,$02,$04(sextant)(#UDG(#PC+$08*($02*$y+$x),attr=$0D)(*sextant)sextant) } UDGTABLE#
@ $8738 label=Graphics_Bell
  $8738,$20,$08 #UDGTABLE(default,centre) { #N($20+((#PC-$8478)/$08)) } { #UDGS$02,$02,$04(bell)(#UDG(#PC+$08*($02*$y+$x),attr=$0C)(*bell)bell) } UDGTABLE#
@ $8758 label=Graphics_Lantern
  $8758,$20,$08 #UDGTABLE(default,centre) { #N($20+((#PC-$8478)/$08)) } { #UDGS$02,$02,$04(lantern)(#UDG(#PC+$08*($02*$y+$x),attr=$0E)(*lantern)lantern) } UDGTABLE#

b $8778 Graphics: Room Furniture #2 (Non-Interactive)
@ $8778 label=Graphics_Barrels
  $8778,$C0,$08 #UDGTABLE(default,centre) { #N($20+((#PC-$8778)/$08)) } { #UDGS$06,$04,$04(barrels)(#UDG(#PC+$08*($06*$y+$x),attr=$0A)(*barrels)barrels) } UDGTABLE#
@ $8838 label=Graphics_Stack1
  $8838,$C0,$08 #UDGTABLE(default,centre) { #N($20+((#PC-$8778)/$08)) } { #UDGS$06,$04,$04(stack-1)(#UDG(#PC+$08*($06*$y+$x),attr=$0B)(*stack-1)stack-1) } UDGTABLE#
@ $88F8 label=Graphics_Stack2
  $88F8,$C0,$08 #UDGTABLE(default,centre) { #N($20+((#PC-$8778)/$08)) } { #UDGS$06,$04,$04(stack-2)(#UDG(#PC+$08*($06*$y+$x),attr=$0B)(*stack-2)stack-2) } UDGTABLE#
@ $89B8 label=Graphics_Stack3
  $89B8,$C0,$08 #UDGTABLE(default,centre) { #N($20+((#PC-$8778)/$08)) } { #UDGS$06,$04,$04(stack-3)(#UDG(#PC+$08*($06*$y+$x),attr=$0C)(*stack-3)stack-3) } UDGTABLE#

b $8A78 Graphics: Player Sprite
@ $8A78 label=Graphics_Player
  $8A78,$30,$08 #LET(filename=#EVAL($01+(#PC-$8A78)/$30)) #UDGTABLE(default,centre) { #N($20+((#PC-$8A78)/$08)) } { #UDGS$02,$03,$04(#FORMAT(player-{filename}))(#UDG(#PC+$08*($02*$y+$x),attr=$0D)(*player)player) } UDGTABLE#
L $8A78,$30,$19

b $8F28 Graphics: Pirate
@ $8F28 label=Graphics_Pirate
E $8F28 #UDGTABLE { #UDGARRAY#(#ANIMATE$0F,$10(pirate)) } UDGTABLE#
  $8F28,$30,$08 #LET(filename=#EVAL($01+(#PC-$8F28)/$30)) #UDGTABLE(default,centre) { #N($20+((#PC-$8F28)/$08)) } { #UDGS$02,$03,$04(#FORMAT(pirate-{filename}*))(#UDG(#PC+$08*($02*$y+$x),attr=$0E)(*pirate)pirate) } UDGTABLE#
L $8F28,$30,$10

u $9228
D $9228 Appears to be a clone of #R$924C (frame 1).
  $9228,$20,$08 #UDGTABLE { #UDGS$02,$02,$04(#FORMAT(porthole))(#UDG(#PC+$08*($02*$y+$x),attr=$0D)(*porthole)porthole) } UDGTABLE#
N $9248 These four bytes also clone the first four bytes of frame 1/ above.
N $9248 It's unclear yet what they're used for (if anything).

b $924C Graphics: Porthole
@ $924C label=Graphics_Porthole
D $924C See #R$F1FC.
E $924C #UDGTABLE { #UDGARRAY#(#ANIMATE$0F,$08(porthole)) } UDGTABLE#
  $924C,$20,$08 #LET(filename=#EVAL($01+(#PC-$924C)/$20)) #UDGTABLE(default,centre) { #N($20+((#PC-$924C)/$08)) } { #UDGS$02,$02,$04(#FORMAT(porthole-{filename}*))(#UDG(#PC+$08*($02*$y+$x),attr=$0D)(*porthole)porthole) } UDGTABLE#
L $924C,$20,$08

b $934C Graphics: Bomb
@ $934C label=Graphics_Bomb
D $934C See #R$E47A.
E $934C #UDGTABLE { #UDGARRAY#(#ANIMATE$0F,$08(bomb)) } UDGTABLE#
  $934C,$20,$08 #LET(filename=#EVAL($01+(#PC-$934C)/$20)) #UDGTABLE { #UDGS$02,$02,$04(#FORMAT(bomb-{filename}*))(#UDG(#PC+$08*($02*$y+$x),attr=$0E)(*bomb)bomb) } UDGTABLE#
L $934C,$20,$08

b $944C Graphics: Animals
@ $944C label=Graphics_Rat
  $944C,$20,$08 #LET(filename=#EVAL($01+(#PC-$944C)/$20)) #UDGTABLE { #UDGS$04,$01,$04(#FORMAT(rat-{filename}))(#UDG(#PC+$08*($04*$y+$x),attr=$0E)(*rat)rat) } UDGTABLE#
L $944C,$20,$02
@ $948C label=Graphics_Bird
  $948C,$20,$08 #LET(filename=#EVAL($01+(#PC-$948C)/$20)) #UDGTABLE { #UDGS$02,$02,$04(#FORMAT(bird-{filename}*))(#UDG(#PC+$08*($02*$y+$x),attr=$0E)(*bird)bird) } UDGTABLE#
L $948C,$20,$08

b $958C Graphics: Player Swimming Sprite
E $958C #UDGTABLE { #UDGARRAY#(#ANIMATE$12,$03(player-swimming)) } UDGTABLE#
  $958C,$40,$08 #LET(filename=#EVAL($01+(#PC-$958C)/$40)) #UDGTABLE { #UDGS$04,$02,$04(#FORMAT(player-swimming-{filename}*))(#UDG(#PC+$08*($04*$y+$x),attr=$0E)(*player-swimming)player-swimming) } UDGTABLE#
L $958C,$40,$03

b $964C Graphics: Sand (Goldfish Game)
@ $964C label=Graphics_GoldfishGameSand
D $964C See #R$CEE6.
. #UDGTABLE { #UDGS$20,$01,$04(sand)(#UDG($964C+($08*($x%$10)),attr=$0E)(*sand)sand) } UDGTABLE#
. It's actually chosen randomly in the game (the image here is simply sequential for an example).
  $964C,$08 #UDGTABLE { #UDG(#PC,attr=$0E) } UDGTABLE#
L $964C,$08,$10

b $96CC Graphics: Dolphin (Goldfish Game)
@ $96CC label=Graphics_GoldfishGameDolphin
E $96CC #UDGTABLE { #UDGARRAY#(#ANIMATE$0F,$04(dolphin)) } UDGTABLE#
  $96CC,$40,$08 #LET(filename=#EVAL($01+(#PC-$96CC)/$40)) #UDGTABLE { #UDGS$04,$02,$04(#FORMAT(dolphin-{filename}*))(#UDG(#PC+$08*($04*$y+$x),attr=$0D)(*dolphin)dolphin) } UDGTABLE#
L $96CC,$40,$04

b $97CC Graphics: Sea Snake (Goldfish Game)
@ $97CC label=Graphics_GoldfishGameSeaSnake
E $97CC #UDGTABLE { #UDGARRAY#(#ANIMATE$0F,$04(sea-snake)) } UDGTABLE#
  $97CC,$30,$08 #LET(filename=#EVAL($01+(#PC-$97CC)/$30)) #UDGTABLE { #UDGS$03,$02,$04(#FORMAT(sea-snake-{filename}*))(#UDG(#PC+$08*($03*$y+$x),attr=$0A)(*sea-snake)sea-snake) } UDGTABLE#
L $97CC,$30,$04,$02

b $988C Graphics: Marlin (Goldfish Game)
@ $988C label=Graphics_GoldfishGameMarlin
E $988C #UDGTABLE { #UDGARRAY#(#ANIMATE$0F,$04(marlin)) } UDGTABLE#
  $988C,$30,$08 #LET(filename=#EVAL($01+(#PC-$988C)/$30)) #UDGTABLE { #UDGS$03,$02,$04(#FORMAT(marlin-{filename}*))(#UDG(#PC+$08*($03*$y+$x),attr=$0B)(*marlin)marlin) } UDGTABLE#
L $988C,$30,$04,$02

b $994C Graphics: Squid (Goldfish Game)
@ $994C label=Graphics_GoldfishGameSquid
E $994C #UDGTABLE { #UDGARRAY#(#ANIMATE$0F,$04(squid)) } UDGTABLE#
  $994C,$20,$08 #LET(filename=#EVAL($01+(#PC-$994C)/$20)) #UDGTABLE { #UDGS$02,$02,$04(#FORMAT(squid-{filename}*))(#UDG(#PC+$08*($02*$y+$x),attr=$0C)(*squid)squid) } UDGTABLE#
L $994C,$20,$04,$02

b $99CC Graphics: Goldfish (Goldfish Game)
@ $99CC label=Graphics_GoldfishGameFish
E $99CC #UDGTABLE { #UDGARRAY#(#ANIMATE$0F,$04(goldfish)) } UDGTABLE#
  $99CC,$08 #LET(filename=#EVAL($01+(#PC-$99CC)/$08)) #UDGTABLE { #UDG(#PC,attr=$0E)(#FORMAT(goldfish-{filename}*)) } UDGTABLE#
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
E $9FEC #UDGTABLE { #UDGARRAY#(#ANIMATE$0F,$08(swimmer)) } UDGTABLE#
  $9FEC,$10 #LET(filename=#EVAL($01+(#PC-$9FEC)/$10)) #UDGTABLE { #UDGS$02,$01,$04(#FORMAT(swimmer-{filename}*))(#UDG(#PC+$08*$x,attr=$0F)(*swimmer)swimmer) } UDGTABLE#
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

g $A1C4 Buffer: Room
@ $A1C4 label=BufferRoom
B $A1C4,$0320,$20

g $A4E4 Buffer: Room Attributes
@ $A4E4 label=BufferRoomAttributes
B $A4E4,$0320,$20

c $A804 Controller: Draw Room
@ $A804 label=ControllerDrawRoom
N $A804 On a new game, the game starts with the room ID being #N$00 (which isn't a valid room ID; #R$DEBC).
. The reason is because it chooses between these two routines here (and corrects the starting room ID in #R$AA97).
  $A804,$09 Call #R$AA97 if *#R$5BD3 is #N$00.
N $A80D Handle all other room IDs.
  $A80D,$04 Call #R$AAF4 if *#R$5BD3 was not equal to #N$00.
  $A811,$03 Call #R$AB44.
  $A814,$03 Jump to #R$A900.

c $A817 Print UDG
@ $A817 label=PrintUDG
R $A817 A Sprite ID
N $A817 Compare against the colour version #R$E6DC and the clone of it at #R$D353.
  $A817,$01 Switch to the shadow registers.
  $A818,$0F #REGde'=#REGa*#N$08.
  $A827,$04 #HTML(#REGhl'=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>+#REGde'.)
  $A82B,$09 #HTML(Increment *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C84.html">DF_CC</a> by one.)
  $A834,$01 Decrease #REGde' by one.
N $A835 All character blocks are 1 x 8 bytes.
N $A835 Copy the data from the current character set to the screen buffer.
  $A835,$02 #REGb'=#N$08 (byte counter).
@ $A837 label=PrintUDG_Loop
  $A837,$01 #REGa=*#REGhl'.
  $A838,$01 Write #REGa to *#REGde'.
  $A839,$01 Increment #REGhl' by one.
  $A83A,$01 Increment #REGd' by one.
  $A83B,$02 Decrease counter by one and loop back to #R$A837 until counter is zero.
  $A83D,$01 Switch back to the normal registers.
  $A83E,$01 Return.

c $A83F
  $A83F,$04 Stash #REGaf, #REGbc, #REGde and #REGhl on the stack.
  $A843,$01 Decrease #REGa by one.
  $A844,$03 Write #REGa to *#R$BAA2.
  $A847,$04 Write #REGe to *#R$BAA3.
  $A84B,$04 #REGe=*#R$BAA3.
  $A84F,$02 Stash #REGbc and #REGde on the stack.
  $A851,$03 Call #R$A86E.
  $A854,$02 Restore #REGde and #REGbc from the stack.
  $A856,$07 Increment *#R$BAA2 by one.
  $A85D,$03 Call #R$A893.
  $A860,$01 Decrease #REGe by one.
  $A861,$02 Jump to #R$A856 until #REGe is zero.
  $A863,$01 Decrease #REGd by one.
  $A864,$02 Jump to #R$A869 if #REGd is zero.
  $A866,$01 Decrease #REGb by one.
  $A867,$02 Jump to #R$A84B.

  $A869,$04 Restore #REGhl, #REGde, #REGbc and #REGaf from the stack.
  $A86D,$01 Return.

c $A86E
  $A86E,$1A #REGde=(#N$18-#REGb)*#N$20.
  $A888,$06 #REGhl=#N$21-#REGc.
  $A88E,$01 #REGhl+=#REGde.
  $A88F,$03 Write #REGhl to *#R$BAD5.
  $A892,$01 Return.

c $A893 Populate Room Buffer
@ $A893 label=PopulateRoomBuffer
R $A893 A The value to send to the room buffer.
  $A893,$03 Stash #REGaf, #REGde and #REGhl on the stack.
N $A896 Update *#R$BAD5 by one.
  $A896,$03 #REGhl=*#R$BAD5.
  $A899,$01 Increment #REGhl by one.
  $A89A,$03 Write #REGhl to *#R$BAD5.
N $A89D ...but using the initial value of *#R$BAD5...
  $A89D,$01 Decrease #REGhl by one.
  $A89E,$04 #REGhl+=#R$A1C4.
  $A8A2,$01 Write #REGa to *#REGhl.
N $A8A3 Move to the room attribute buffer.
  $A8A3,$04 #REGhl+=#N$0320 (the length of the room buffer).
  $A8A7,$04 #HTML(Write *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C8F.html">ATTR_T</a> to *#REGhl.)
N $A8AB Housekeeping; restore all registers and return.
  $A8AB,$03 Restore #REGhl, #REGde and #REGaf from the stack.
  $A8AE,$01 Return.

c $A8AF
  $A8AF,$01 Stash #REGhl on the stack.
  $A8B0,$01 Decrease #REGa by one.
  $A8B1,$03 Write #REGa to *#R$BAA2.
  $A8B4,$04 Write #REGe to *#R$BAA3.
  $A8B8,$04 #REGe=*#R$BAA3.
  $A8BC,$02 Stash #REGbc and #REGde on the stack.
  $A8BE,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $A8C1,$02 Restore #REGde and #REGbc from the stack.
  $A8C3,$07 Increment *#R$BAA2 by one.
  $A8CA,$03 Call #R$A817.
  $A8CD,$01 Decrease #REGe by one.
  $A8CE,$02 Jump to #R$A8C3 until #REGe is zero.
  $A8D0,$01 Decrease #REGd by one.
  $A8D1,$02 Jump to #R$A8D6 if #REGd is zero.
  $A8D3,$01 Decrease #REGb by one.
  $A8D4,$02 Jump to #R$A8B8.
  $A8D6,$01 Restore #REGhl from the stack.
  $A8D7,$01 Return.

c $A8D8 Clear Room Buffer
@ $A8D8 label=ClearRoomBuffer
N $A8D8 First off, blank the screen.
  $A8D8,$05 #HTML(Clear the bottom #N$18 lines using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0E44.html">CL_LINE</a>.)
N $A8DD Clear the room buffer.
  $A8DD,$03 Set a counter in #REGbc with the length of the room buffer (#N$0320 bytes).
  $A8E0,$03 #REGhl=#R$A1C4.
@ $A8E3 label=ClearRoomBuffer_Loop
  $A8E3,$03 Write #N$00 to *#REGhl.
  $A8E6,$01 Increment the room buffer pointer by one.
  $A8E7,$01 Decrease the room buffer counter by one.
  $A8E8,$04 Jump to #R$A8E3 until the room buffer counter is zero.
N $A8EC Clear the room attribute buffer. Setting each value to the INK value of the PAPER colour (?)
  $A8EC,$03 #REGbc=Counter; the length of the room attribute buffer (#N$0320).
@ $A8EF label=ClearRoomAttributeBuffer_Loop
  $A8EF,$03 #REGa=*#R$5BD1.
  $A8F2,$06 Convert a PAPER value (using bits 3, 4 and 5) to an INK value (shifted left to bits 0, 1 and 2).
  $A8F8,$01 Write #REGa to *#REGhl.
  $A8F9,$01 Increment the room attribute buffer pointer by one.
  $A8FA,$01 Decrease the room attribute buffer counter by one.
  $A8FB,$04 Jump to #R$A8EF until the room attribute buffer counter is zero.
  $A8FF,$01 Return.

c $A900 Draw Room
@ $A900 label=DrawRoom
N $A900 Clear the screen to BLACK.
  $A900,$05 #HTML(Write #INK$00 to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C8D.html">ATTR_P</a>.)
  $A905,$03 Call #R$A8D8.
  $A908,$03 #REGa=*#R$5BD1.
  $A90B,$06 Convert a PAPER value (using bits 3, 4 and 5) to an "INK" value
. (shifted left to bits 0, 1 and 2).
  $A911,$03 #HTML(Write #REGa to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C8D.html">ATTR_P</a>.)
  $A914,$07 Set PAPER: *#R$5BD1.
N $A91B Set the UDG graphics pointer.
  $A91B,$06 #HTML(Write #R$8478(#N$8378) (#R$8478) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
N $A921 Set the attributes for drawing the room scaffolding (i.e. ceilings and floors).
  $A921,$07 Set INK: *#R$5BCF.
N $A928 Fetch the address of the current room data buffer.
  $A928,$03 #REGhl=*#R$5BE8.
N $A92B Draw the ceilings/ floors.
@ $A92B label=DrawRoomScaffolding
  $A92B,$03 Get the screen co-ordinates where the scaffolding will begin
. printing from the current room data buffer and store them in #REGbc.
  $A92E,$01 Increment the current room data buffer by one.
  $A92F,$05 Jump to #R$A952 if the terminator character has been received (#N$FF).
  $A934,$01 Stash the current room data buffer on the stack.
  $A935,$03 Call #R$A86E.
N $A938 Set the co-ordinates of where we're going to PRINT AT.
  $A938,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $A93B,$01 Restore the current room data buffer from the stack.
  $A93C,$01 Fetch the length counter and store it in #REGb.
  $A93D,$01 Increment the current room data buffer by one.
N $A93E All scaffolding is two bytes wide, alternating between #R$8480 and #R$8488.
@ $A93E label=DrawRoomScaffolding_Loop
  $A93E,$02 #REGa=#R$8480 (#N$21).
  $A940,$03 Call #R$A893.
  $A943,$03 Call #R$A817.
  $A946,$02 #REGa=#R$8488 (#N$22).
  $A948,$03 Call #R$A893.
  $A94B,$03 Call #R$A817.
  $A94E,$02 Decrease counter by one and loop back to #R$A93E until counter is zero.
  $A950,$02 Jump to #R$A92B.
N $A952 Draw the ladders.
@ $A952 label=DrawRoomLadders
  $A952,$07 Set INK: *#R$5BD2.
  $A959,$03 #REGhl=*#R$5BD8.
@ $A95C label=DrawRoomLadders_Loop
  $A95C,$01 #REGa=*#REGhl.
  $A95D,$04 Jump to #R$A973 if the room data is the termination byte (#N$FF).
  $A961,$01 #REGc=#REGa.
  $A962,$01 Increment #REGhl by one.
  $A963,$01 #REGb=*#REGhl.
  $A964,$01 Increment #REGhl by one.
  $A965,$02 #REGa=#R$84F0 (#N$2F).
  $A967,$02 #REGe=Sprite width (#N$02).
  $A969,$02 #REGd=Sprite height (#N$05).
  $A96B,$03 Call #R$A83F.
  $A96E,$03 Call #R$A8AF.
  $A971,$02 Jump to #R$A95C.
N $A973 Draws the front facing doors which lead to other rooms.
@ $A973 label=DrawRoomDoors
  $A973,$03 #REGhl=*#R$5BD6.
@ $A976 label=DrawRoomDoors_Loop
  $A976,$01 #REGc=*#REGhl.
  $A977,$01 Increment #REGhl by one.
  $A978,$01 #REGb=*#REGhl.
  $A979,$01 Increment #REGhl by one.
  $A97A,$01 #REGa=*#REGhl.
  $A97B,$02 Increment #REGhl by two.
  $A97D,$01 Stash #REGaf on the stack.
  $A97E,$05 Jump to #R$A996 if #N$FF is equal to #REGc.
  $A983,$03 Set INK to ...
  $A986,$01 Restore #REGaf from the stack.
  $A987,$01 ... the value held in #REGa (from the stack).
  $A988,$02 #REGa=#R$8490 (#N$23).
  $A98A,$02 #REGe=Sprite width (#N$03).
  $A98C,$02 #REGd=Sprite height (#N$04).
  $A98E,$03 Call #R$A83F.
  $A991,$03 Call #R$A8AF.
  $A994,$02 Jump to #R$A976.
N $A996 Draws the numbered keys and locked doors which correlate to them.
@ $A996 label=DrawRoomKeysAndLockedDoors
  $A996,$01 Restore #REGaf from the stack.
  $A997,$07 Set INK: *#R$5BCF.
  $A99E,$04 #REGix=*#R$5BDA.
@ $A9A2 label=DrawRoomKeysAndLockedDoors_Loop
  $A9A2,$03 #REGc=*#REGix+#N$00.
  $A9A5,$05 Jump to #R$AA1C if #N$FF is equal to #REGc.
  $A9AA,$07 Jump to #R$AA15 if *#REGix+#N$05 is equal to #N$00.
  $A9B1,$04 Write #N$03 to *#REGix+#N$05.
  $A9B5,$03 #REGb=*#REGix+#N$01.
  $A9B8,$01 Stash #REGbc on the stack.
  $A9B9,$03 Call #R$A86E.
  $A9BC,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $A9BF,$07 Set INK: *#R$5BCF.
  $A9C6,$03 #REGa=*#REGix+#N$04.
  $A9C9,$02 #REGa+=#N$38.
  $A9CB,$03 Call #R$A893.
  $A9CE,$03 Call #R$A817.
  $A9D1,$07 Set INK: *#R$5BCD.
  $A9D8,$01 Restore #REGbc from the stack.
  $A9D9,$01 Decrease #REGb by one.
  $A9DA,$02 #REGa=#R$85D8 (#N$4C).
  $A9DC,$02 #REGe=Sprite width (#N$01).
  $A9DE,$02 #REGd=Sprite height (#N$04).
  $A9E0,$03 Call #R$A83F.
  $A9E3,$03 Call #R$A8AF.
  $A9E6,$03 #REGc=*#REGix+#N$02.
  $A9E9,$03 #REGb=*#REGix+#N$03.
  $A9EC,$01 Stash #REGbc on the stack.
  $A9ED,$03 Call #R$A86E.
  $A9F0,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $A9F3,$07 Set INK: *#R$5BCC.
  $A9FA,$03 #REGa=*#REGix+#N$04.
  $A9FD,$02 #REGa+=#N$41.
  $A9FF,$03 Call #R$A893.
  $AA02,$03 Call #R$A817.
  $AA05,$01 Restore #REGbc from the stack.
  $AA06,$01 Decrease #REGb by one.
  $AA07,$03 Call #R$A86E.
  $AA0A,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
N $AA0D All the keys share the same bottom half.
  $AA0D,$02 #REGa=#R$85D0 (#N$4B).
  $AA0F,$03 Call #R$A893.
  $AA12,$03 Call #R$A817.
@ $AA15 label=DrawRoomKeysAndLockedDoors_Next
  $AA15,$05 #REGix+=#N($0006,$04,$04).
  $AA1A,$02 Jump to #R$A9A2.
N $AA1C Draw room items.
@ $AA1C label=DrawRoomItems
  $AA1C,$04 #REGix=*#R$5BE0.
@ $AA20 label=DrawRoomItems_Loop
  $AA20,$07 Jump to #R$AA4F if *#REGix+#N$00 is equal to #N$FF.
  $AA27,$07 Jump to #R$AA48 if *#REGix+#N$05 is equal to #N$00.
  $AA2E,$07 Set INK: *#REGix+#N$04.
  $AA35,$03 #REGc=*#REGix+#N$00.
  $AA38,$03 #REGb=*#REGix+#N$01.
  $AA3B,$02 #REGd=Sprite height (#N$02).
  $AA3D,$02 #REGe=Sprite width (#N$02).
  $AA3F,$03 #REGa=*#REGix+#N$06.
  $AA42,$03 Call #R$A83F.
  $AA45,$03 Call #R$A8AF.
@ $AA48 label=DrawRoomItems_Next
  $AA48,$05 #REGix+=#N($0007,$04,$04).
  $AA4D,$02 Jump to #R$AA20.
N $AA4F Draw all the room "furniture", like the barrels and stacks of crates.
@ $AA4F label=DrawRoomFurniture
  $AA4F,$06 #HTML(Write #R$8778(#N$8678) (#R$8778) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $AA55,$04 #REGix=*#R$5BE2.
@ $AA59 label=DrawRoomFurniture_Loop
  $AA59,$07 Jump to #R$AA85 if *#REGix+#N$00 is equal to #N$FF.
  $AA60,$07 Set INK: *#REGix+#N$03.
  $AA67,$03 #REGc=*#REGix+#N$00.
  $AA6A,$03 #REGb=*#REGix+#N$01.
  $AA6D,$02 #REGd=Sprite height (#N$04).
  $AA6F,$02 #REGe=Sprite width (#N$06).
  $AA71,$03 #REGa=*#REGix+#N$02.
  $AA74,$02,b$01 Set bit 7.
  $AA76,$03 Call #R$A83F.
  $AA79,$02,b$01 Keep only bits 0-6.
  $AA7B,$03 Call #R$A8AF.
  $AA7E,$05 #REGix+=#N($0004,$04,$04).
  $AA83,$02 Jump to #R$AA59.
N $AA85 Copy the room attributes buffer to the screen.
@ $AA85 label=WriteRoomAttributes
  $AA85,$03 #REGde=#N$5800 (attribute buffer location).
  $AA88,$03 #REGhl=#R$A4E4.
  $AA8B,$03 #REGbc=#N$0300.
  $AA8E,$02 Copy #N$0300 bytes of data from #R$A4E4 to the attribute buffer.
M $AA85,$0B Copy #N$0300 bytes of data from #R$A4E4 to the attribute buffer.
  $AA90,$06 #HTML(Set the border to *#R$5BD0 using <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/2294.html#229b">BORDER</a>.)
  $AA96,$01 Return.

c $AA97 Unpack All Rooms
@ $AA97 label=UnpackAllRooms
D $AA97 This is similar to #R$AAF4 except that instead of copying a single rooms
. data from the room data buffers, this routine loops through ALL the rooms -
. copying the #R$ABD6(default room data) into the room data buffers. Also, at the start
. of every loop - it writes the room data buffer address which is about to be
. processed to the #R$BAA9(room data table) as both the table and the room data
. buffers are completely blank after the game first loads.
.
. Note; this always occurs at the start of every game regardless, the game
. opens with the default positions for everything held by the defaults but as
. the player moves around the game and interacts with doors/ keys/ items/ etc,
. the buffers keep track of what's been collected, and where the pirates were
. when the player left the room.
N $AA97 When a new game begins, all the rooms are reset to their default states.
  $AA97,$06 Store the starting room table data reference (starting at #R$BAAB(#N$21)) to *#R$BAA5.
N $AA9D The idea here is to point to the room data, store this in the table.
. Then populate this current room, and then we know what the next address
. value will be for the following rooms starting point.
  $AA9D,$03 Initialise the starting point of the room data for populating the room table data (#R$BCCB(#N$21)).
  $AAA0,$03 Initialise the default room data (#R$ABD6) starting pointer in #REGhl.
N $AAA3 This part of the loop specifically deals with populating #R$BAA9.
@ $AAA3 label=UnpackAllRooms_Loop
  $AAA3,$01 Stash the default room data pointer on the stack.
  $AAA4,$06 Write the address of where the currently in-focus room table data begins to the room table.
  $AAAA,$04 Store the position of the next table entry to *#R$BAA5.
  $AAAE,$01 Restore the default room data pointer from the stack.
N $AAAF Have we finished with everything?
  $AAAF,$06 If the terminator character (#N$FF) has been reached jump to #R$AAEE.
N $AAB5 Now move onto actually copying the room data.
.
. Set up counters for copying data from the default state to the room buffer.
. The counter length relates to the length of the data for each instance of the
. "thing" being copied (NOT the length of the data being copied). For an example;
. portholes are #N($0003,$04,$04) bytes of data each, so #REGb is #N$03 when
. calling #R$ABC2. How many portholes being copied just depends on when the loop
. reads a termination character (#N$FF).
  $AAB5,$05 Handle copying the colours (#N$01 loop; this is just one list of bytes).
  $AABA,$05 Handle copying the scaffolding data.
  $AABF,$05 Handle copying the doors data.
  $AAC4,$05 Handle copying the ladders data.
  $AAC9,$05 Handle copying the keys and locked doors data.
  $AACE,$05 Handle copying the porthole data.
  $AAD3,$05 Handle copying the pirate data.
  $AAD8,$05 Handle copying the items data.
  $AADD,$05 Handle copying the furniture data.
  $AAE2,$05 Handle copying the lifts data.
  $AAE7,$05 Handle copying the disappearing floors data.
  $AAEC,$02 Loop back around to #R$AAA3, the unpacking is only finished when
. the terminator character is read at the start.
N $AAEE The room ID of #N$00 just routed the code here, there is no room #N$00 - so set the "real" starting room ID.
@ $AAEE label=SetRealStartingRoomID
  $AAEE,$05 Write #N$01 to *#R$5BD3.
  $AAF3,$01 Return.

c $AAF4 Unpack Room
@ $AAF4 label=UnpackRoom
D $AAF4 This is similar to #R$AA97, however instead of copying ALL the room
. data from the default room data into the room data buffers, this routine
. copies a single room from the room data buffers into the active room buffer.
. The reason for this is because the game opens with the default positions for
. everything held by the defaults but as the player moves around the game and
. interacts with doors/ keys/ items/ etc, the buffers keep track of what's been
. collected, and where the pirates were when the player left the room so when
. they're revisited, they retain those changes.
N $AAF4 In #R$BAA9 the pointers to the room data are stored backwards from #N$16-#N$01.
  $AAF4,$10 Take #N$16-*#R$5BD4 then multiply by #N$02 (as it's an address we fetch,
. so 16bit) finally add #R$BAA9 to point to the correct room buffer data address in
. the room data table for the current room and store the pointer in #REGhl.
  $AB04,$03 Fetch the room buffer data address for the requested room and store it in #REGde.
  $AB07,$01 Does nothing, #REGhl is overwritten immediately below.
N $AB08 Move the room buffer data address pointer to the room data itself (the
. first #N$08 bytes are colour data). There's no need to copy the colours here,
. as they don't vary between each game.
  $AB08,$06 #REGde+=#N($0008,$04,$04) (using the stack).
N $AB0E Now move onto actually copying the room data.
  $AB0E,$03 #REGhl=#R$BAD7.
N $AB11 Set up counters for copying data from the default state to the room buffer.
.
. The counter length relates to the length of the data for each instance of the
. "thing" being copied (NOT the length of the data being copied). For an example;
. portholes are #N($0003,$04,$04) bytes of data each, so #REGb is #N$03 when
. calling #R$ABC2. How many portholes being copied just depends on when the loop
. reads a termination character (#N$FF).
  $AB11,$05 Handle copying the scaffolding data.
  $AB16,$05 Handle copying the doors data.
  $AB1B,$05 Handle copying the ladders data.
  $AB20,$05 Handle copying the keys and locked doors data.
  $AB25,$05 Handle copying the porthole data.
  $AB2A,$05 Handle copying the pirate data.
  $AB2F,$05 Handle copying the items data.
  $AB34,$05 Handle copying the furniture data.
  $AB39,$05 Handle copying the lifts data.
  $AB3E,$05 Handle copying the disappearing floors data.
  $AB43,$01 Return.

c $AB44 Populate Current Room Buffers And References
@ $AB44 label=PopulateCurrentRoomBuffersAndReferences
  $AB44,$03 #REGa=*#R$5BD3.
  $AB47,$03 Write #REGa to *#R$5BD4.
N $AB4A Fetch the room data pointer from the room reference table.
  $AB4A,$0D #REGhl=#R$BAA9+((#N$16-#REGa)*#N$02).
  $AB57,$04 Store the room data address for the requested room in #REGhl.
N $AB5B Set the colours for the active room.
  $AB5B,$08 Copy #N($0007,$04,$04) bytes of room data from the buffer to *#R$5BCC.
  $AB63,$01 Skip the terminator character in the room data.
N $AB64 Handle populating the scaffolding data.
  $AB64,$07 Write #R$BAD7 to *#R$5BE8.
  $AB6B,$02 #REGb=#N$03 (length counter).
  $AB6D,$03 Call #R$ABC2.
N $AB70 Handle populating the doors data.
  $AB70,$02 #REGb=#N$04 (length counter).
  $AB72,$04 Write #REGde to *#R$5BD6.
  $AB76,$03 Call #R$ABC2.
N $AB79 Handle populating the ladders data.
  $AB79,$02 #REGb=#N$02 (length counter).
  $AB7B,$04 Write #REGde to *#R$5BD8.
  $AB7F,$03 Call #R$ABC2.
N $AB82 Handle populating the keys and locked doors data.
  $AB82,$02 #REGb=#N$06 (length counter).
  $AB84,$04 Write #REGde to *#R$5BDA.
  $AB88,$03 Call #R$ABC2.
N $AB8B Handle populating the porthole data.
  $AB8B,$02 #REGb=#N$03 (length counter).
  $AB8D,$04 Write #REGde to *#R$5BDC.
  $AB91,$03 Call #R$ABC2.
N $AB94 Handle populating the pirate data.
  $AB94,$02 #REGb=#N$10 (length counter).
  $AB96,$04 Write #REGde to *#R$5BDE.
  $AB9A,$03 Call #R$ABC2.
N $AB9D Handle populating the items data.
  $AB9D,$02 #REGb=#N$07 (length counter).
  $AB9F,$04 Write #REGde to *#R$5BE0.
  $ABA3,$03 Call #R$ABC2.
N $ABA6 Handle populating the furniture data.
  $ABA6,$02 #REGb=#N$04 (length counter).
  $ABA8,$04 Write #REGde to *#R$5BE2.
  $ABAC,$03 Call #R$ABC2.
N $ABAF Handle populating the lifts data.
  $ABAF,$02 #REGb=#N$10 (length counter).
  $ABB1,$04 Write #REGde to *#R$5BE4.
  $ABB5,$03 Call #R$ABC2.
N $ABB8 Handle populating the disappearing floors data.
  $ABB8,$02 #REGb=#N$06 (length counter).
  $ABBA,$04 Write #REGde to *#R$5BE6.
  $ABBE,$03 Call #R$ABC2.
  $ABC1,$01 Return.

c $ABC2 Copy Room Data
@ $ABC2 label=CopyRoomData
R $ABC2 B Length of data to be copied
R $ABC2 DE The room buffer target destination
R $ABC2 HL Pointer to the room data we want to copy
N $ABC2 This routine copies the number of bytes given by #REGb, from *#REGhl to
. *#REGde, and keeps on looping until a termination character is returned.
  $ABC2,$01 Stash the length counter on the stack.
  $ABC3,$01 Fetch a byte from the source room data pointer and store it in #REGa.
N $ABC4 Have we finished with everything?
  $ABC4,$04 If the terminator character (#N$FF) has been reached jump to #R$ABD1.
N $ABC8 Handle copying the data from the source room data to the target room buffer.
@ $ABC8 label=CopyRoomData_Loop
  $ABC8,$01 Write the room data byte to the room buffer target destination.
  $ABC9,$01 Increment the source room data pointer by one.
  $ABCA,$01 Increment the room buffer target destination by one.
  $ABCB,$01 Fetch a byte from the source room data pointer and store it in #REGa.
  $ABCC,$02 Decrease counter by one and loop back to #R$ABC8 until counter is zero.
N $ABCE Using the same counter as on entry to the routine, start the process again.
  $ABCE,$01 Restore the original length counter from the stack.
  $ABCF,$02 Jump to #R$ABC2.
N $ABD1 This cycle is now over, so store the terminator in the room buffer,
. increment both pointers ready for the next call to this routine and finally, tidy up the stack.
@ $ABD1 label=CopyRoomData_Next
  $ABD1,$01 Write the termination character to the room buffer target destination.
  $ABD2,$01 Increment the room buffer target destination by one.
  $ABD3,$01 Increment the source room data pointer by one.
  $ABD4,$01 Housekeeping; discard the length counter from the stack.
  $ABD5,$01 Return.

g $ABD6 Default Room Data
@ $ABD6 label=DefaultRoomData

b $BAA2

b $BAA3

g $BAA5 Temporary Table Room Data Pointer
@ $BAA5 label=TempTableRoomDataPointer
D $BAA5 Used to assist with populating #R$BAA9, as this table is blank when the game is first loaded.
W $BAA5,$02

u $BAA7
W $BAA7,$02

g $BAA9 Table: Room Data
@ $BAA9 label=TableRoomData
D $BAA9 Note that room ID #N$22 is never used, and hence is #N($0000,$04,$04).
. Room ID #N$21 is a valid reference (and does have data), but also is not used in the game.
W $BAA9,$02 Room #EVAL($16-(#PC-$BAA9)/$02,$0A,$02).
L $BAA9,$02,$16,$02

g $BAD5 Buffer Pointer
@ $BAD5 label=BufferPointer
D $BAD5 See #R$A893 for usage.
W $BAD5,$02

g $BAD7 Buffer: Room Data
@ $BAD7 label=BufferCurrentRoomData

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

b $BCCB

b $BF10

g $BCCB Data: Room #21
@ $BCCB label=DataRoom21
D $BCCB See #LINK:Rooms#room_21(Room #21).
N $BCCB #HTML(<img alt="room-bare-21" src="../images/scr/room-bare-21.png">)
N $BCCB The first seven bytes relate to the colours the room uses. See #R$AB44.
B $BCCB,$01 Key Colour: #INK(#PEEK(#PC)).
B $BCCC,$01 Closed Door Colour: #INK(#PEEK(#PC)).
B $BCCD,$01 Unused?: #INK(#PEEK(#PC)).
B $BCCE,$01 Scaffolding Colour: #INK(#PEEK(#PC)).
B $BCCF,$01 Border Colour: #INK(#PEEK(#PC)).
B $BCD0,$01 Paper Colour: #INK(#PEEK(#PC)).
B $BCD1,$01 Ladder Colour: #INK(#PEEK(#PC)).
B $BCD2,$01 Terminator.
N $BCD3 Room scaffolding:
N $BCD3 Scaffold #01.
B $BCD3,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BCD5,$01 Length: #N(#PEEK(#PC)).
N $BCD6 Scaffold #02.
B $BCD6,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BCD8,$01 Length: #N(#PEEK(#PC)).
N $BCD9 Scaffold #03.
B $BCD9,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BCDB,$01 Length: #N(#PEEK(#PC)).
B $BCDC,$01 Terminator.
N $BCDD Doors:
N $BCDD Door #01.
B $BCDD,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BCDF,$01 Colour: #INK(#PEEK(#PC)).
B $BCE0,$01 Leads to room: #N(#PEEK(#PC)).
B $BCE1,$01 Terminator.
N $BCE2 Ladders:
N $BCE2 Ladder #01.
B $BCE2,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $BCE4 Ladder #02.
B $BCE4,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BCE6,$01 Terminator.
N $BCE7 Keys and locked doors.
B $BCE7,$01 Terminator.
N $BCE8 Portholes:
B $BCE8,$01 Terminator.
N $BCE9 Pirates:
N $BCE9 Pirate #01.
B $BCE9,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BCF9,$01 Terminator.
N $BCFA Items:
B $BCFA,$01 Terminator.
N $BCFB Furniture:
B $BCFB,$01 Terminator.
N $BCFC Lifts:
B $BCFC,$01 Terminator.
N $BCFD Disappearing floors:
B $BCFD,$01 Terminator.

g $BCFE Data: Room #20
@ $BCFE label=DataRoom20
D $BCFE See #LINK:Rooms#room_20(Room #20).
N $BCFE #HTML(<img alt="room-bare-20" src="../images/scr/room-bare-20.png">)
N $BCFE The first seven bytes relate to the colours the room uses. See #R$AB44.
B $BCFE,$01 Key Colour: #INK(#PEEK(#PC)).
B $BCFF,$01 Closed Door Colour: #INK(#PEEK(#PC)).
B $BD00,$01 Unused?: #INK(#PEEK(#PC)).
B $BD01,$01 Scaffolding Colour: #INK(#PEEK(#PC)).
B $BD02,$01 Border Colour: #INK(#PEEK(#PC)).
B $BD03,$01 Paper Colour: #INK(#PEEK(#PC)).
B $BD04,$01 Ladder Colour: #INK(#PEEK(#PC)).
B $BD05,$01 Terminator.
N $BD06 Room scaffolding:
N $BD06 Scaffold #01.
B $BD06,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BD08,$01 Length: #N(#PEEK(#PC)).
N $BD09 Scaffold #02.
B $BD09,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BD0B,$01 Length: #N(#PEEK(#PC)).
N $BD0C Scaffold #03.
B $BD0C,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BD0E,$01 Length: #N(#PEEK(#PC)).
N $BD0F Scaffold #04.
B $BD0F,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BD11,$01 Length: #N(#PEEK(#PC)).
N $BD12 Scaffold #05.
B $BD12,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BD14,$01 Length: #N(#PEEK(#PC)).
N $BD15 Scaffold #06.
B $BD15,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BD17,$01 Length: #N(#PEEK(#PC)).
N $BD18 Scaffold #07.
B $BD18,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BD1A,$01 Length: #N(#PEEK(#PC)).
N $BD1B Scaffold #08.
B $BD1B,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BD1D,$01 Length: #N(#PEEK(#PC)).
N $BD1E Scaffold #09.
B $BD1E,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BD20,$01 Length: #N(#PEEK(#PC)).
N $BD21 Scaffold #10.
B $BD21,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BD23,$01 Length: #N(#PEEK(#PC)).
N $BD24 Scaffold #11.
B $BD24,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BD26,$01 Length: #N(#PEEK(#PC)).
N $BD27 Scaffold #12.
B $BD27,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BD29,$01 Length: #N(#PEEK(#PC)).
B $BD2A,$01 Terminator.
N $BD2B Doors:
N $BD2B Door #01.
B $BD2B,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BD2D,$01 Colour: #INK(#PEEK(#PC)).
B $BD2E,$01 Leads to room: #N(#PEEK(#PC)).
N $BD2F Door #02.
B $BD2F,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BD31,$01 Colour: #INK(#PEEK(#PC)).
B $BD32,$01 Leads to room: #N(#PEEK(#PC)).
N $BD33 Door #03.
B $BD33,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BD35,$01 Colour: #INK(#PEEK(#PC)).
B $BD36,$01 Leads to room: #N(#PEEK(#PC)).
B $BD37,$01 Terminator.
N $BD38 Ladders:
B $BD38,$01 Terminator.
N $BD39 Keys and locked doors.
N $BD39 Key/ Door #01.
B $BD39,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BD3C,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $BD3F Key/ Door #02.
B $BD3F,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BD42,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $BD45 Key/ Door #03.
B $BD45,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BD48,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $BD4B Key/ Door #04.
B $BD4B,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BD4E,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $BD51 Key/ Door #05.
B $BD51,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BD54,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BD57,$01 Terminator.
N $BD58 Portholes:
B $BD58,$01 Terminator.
N $BD59 Pirates:
N $BD59 Pirate #01.
B $BD59,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BD69,$01 Terminator.
N $BD6A Items:
N $BD6A Item #01.
B $BD6A,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BD6E,$01 Colour: #INK(#PEEK(#PC)).
B $BD70,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $BD71 Item #02.
B $BD71,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BD75,$01 Colour: #INK(#PEEK(#PC)).
B $BD77,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $BD78 Item #03.
B $BD78,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BD7C,$01 Colour: #INK(#PEEK(#PC)).
B $BD7E,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $BD7F Item #04.
B $BD7F,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BD83,$01 Colour: #INK(#PEEK(#PC)).
B $BD85,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $BD86,$01 Terminator.
N $BD87 Furniture:
N $BD87 Item #01.
B $BD87,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BD89,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $BD8A,$01 Colour: #INK(#PEEK(#PC)).
B $BD8B,$01 Terminator.
N $BD8C Lifts:
N $BD8C Lift #01.
B $BD8C,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BD95,$01 Colour: #INK(#PEEK(#PC)).
N $BD9C Lift #02.
B $BD9C,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BDA5,$01 Colour: #INK(#PEEK(#PC)).
N $BDAC Lift #03.
B $BDAC,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BDB5,$01 Colour: #INK(#PEEK(#PC)).
B $BDBC,$01 Terminator.
N $BDBD Disappearing floors:
B $BDBD,$01 Terminator.

g $BDBE Data: Room #19
@ $BDBE label=DataRoom19
D $BDBE See #LINK:Rooms#room_19(Room #19).
N $BDBE #HTML(<img alt="room-bare-19" src="../images/scr/room-bare-19.png">)
N $BDBE The first seven bytes relate to the colours the room uses. See #R$AB44.
B $BDBE,$01 Key Colour: #INK(#PEEK(#PC)).
B $BDBF,$01 Closed Door Colour: #INK(#PEEK(#PC)).
B $BDC0,$01 Unused?: #INK(#PEEK(#PC)).
B $BDC1,$01 Scaffolding Colour: #INK(#PEEK(#PC)).
B $BDC2,$01 Border Colour: #INK(#PEEK(#PC)).
B $BDC3,$01 Paper Colour: #INK(#PEEK(#PC)).
B $BDC4,$01 Ladder Colour: #INK(#PEEK(#PC)).
B $BDC5,$01 Terminator.
N $BDC6 Room scaffolding:
N $BDC6 Scaffold #01.
B $BDC6,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BDC8,$01 Length: #N(#PEEK(#PC)).
N $BDC9 Scaffold #02.
B $BDC9,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BDCB,$01 Length: #N(#PEEK(#PC)).
N $BDCC Scaffold #03.
B $BDCC,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BDCE,$01 Length: #N(#PEEK(#PC)).
N $BDCF Scaffold #04.
B $BDCF,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BDD1,$01 Length: #N(#PEEK(#PC)).
N $BDD2 Scaffold #05.
B $BDD2,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BDD4,$01 Length: #N(#PEEK(#PC)).
N $BDD5 Scaffold #06.
B $BDD5,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BDD7,$01 Length: #N(#PEEK(#PC)).
N $BDD8 Scaffold #07.
B $BDD8,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BDDA,$01 Length: #N(#PEEK(#PC)).
N $BDDB Scaffold #08.
B $BDDB,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BDDD,$01 Length: #N(#PEEK(#PC)).
N $BDDE Scaffold #09.
B $BDDE,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BDE0,$01 Length: #N(#PEEK(#PC)).
B $BDE1,$01 Terminator.
N $BDE2 Doors:
N $BDE2 Door #01.
B $BDE2,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BDE4,$01 Colour: #INK(#PEEK(#PC)).
B $BDE5,$01 Leads to room: #N(#PEEK(#PC)).
N $BDE6 Door #02.
B $BDE6,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BDE8,$01 Colour: #INK(#PEEK(#PC)).
B $BDE9,$01 Leads to room: #N(#PEEK(#PC)).
N $BDEA Door #03.
B $BDEA,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BDEC,$01 Colour: #INK(#PEEK(#PC)).
B $BDED,$01 Leads to room: #N(#PEEK(#PC)).
B $BDEE,$01 Terminator.
N $BDEF Ladders:
B $BDEF,$01 Terminator.
N $BDF0 Keys and locked doors.
N $BDF0 Key/ Door #01.
B $BDF0,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BDF3,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $BDF6 Key/ Door #02.
B $BDF6,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BDF9,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $BDFC Key/ Door #03.
B $BDFC,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BDFF,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $BE02 Key/ Door #04.
B $BE02,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BE05,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $BE08 Key/ Door #05.
B $BE08,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BE0B,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $BE0E Key/ Door #06.
B $BE0E,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BE11,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $BE14 Key/ Door #07.
B $BE14,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BE17,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $BE1A Key/ Door #08.
B $BE1A,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BE1D,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $BE20 Key/ Door #09.
B $BE20,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BE23,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BE26,$01 Terminator.
N $BE27 Portholes:
B $BE27,$01 Terminator.
N $BE28 Pirates:
N $BE28 Pirate #01.
B $BE28,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BE38,$01 Terminator.
N $BE39 Items:
N $BE39 Item #01.
B $BE39,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BE3D,$01 Colour: #INK(#PEEK(#PC)).
B $BE3F,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $BE40 Item #02.
B $BE40,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BE44,$01 Colour: #INK(#PEEK(#PC)).
B $BE46,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $BE47 Item #03.
B $BE47,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BE4B,$01 Colour: #INK(#PEEK(#PC)).
B $BE4D,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $BE4E,$01 Terminator.
N $BE4F Furniture:
B $BE4F,$01 Terminator.
N $BE50 Lifts:
N $BE50 Lift #01.
B $BE50,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BE59,$01 Colour: #INK(#PEEK(#PC)).
N $BE60 Lift #02.
B $BE60,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BE69,$01 Colour: #INK(#PEEK(#PC)).
N $BE70 Lift #03.
B $BE70,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BE79,$01 Colour: #INK(#PEEK(#PC)).
N $BE80 Lift #04.
B $BE80,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BE89,$01 Colour: #INK(#PEEK(#PC)).
B $BE90,$01 Terminator.
N $BE91 Disappearing floors:
B $BE91,$01 Terminator.

g $BE92 Data: Room #18
@ $BE92 label=DataRoom18
D $BE92 See #LINK:Rooms#room_18(Room #18).
N $BE92 #HTML(<img alt="room-bare-18" src="../images/scr/room-bare-18.png">)
N $BE92 The first seven bytes relate to the colours the room uses. See #R$AB44.
B $BE92,$01 Key Colour: #INK(#PEEK(#PC)).
B $BE93,$01 Closed Door Colour: #INK(#PEEK(#PC)).
B $BE94,$01 Unused?: #INK(#PEEK(#PC)).
B $BE95,$01 Scaffolding Colour: #INK(#PEEK(#PC)).
B $BE96,$01 Border Colour: #INK(#PEEK(#PC)).
B $BE97,$01 Paper Colour: #INK(#PEEK(#PC)).
B $BE98,$01 Ladder Colour: #INK(#PEEK(#PC)).
B $BE99,$01 Terminator.
N $BE9A Room scaffolding:
N $BE9A Scaffold #01.
B $BE9A,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BE9C,$01 Length: #N(#PEEK(#PC)).
N $BE9D Scaffold #02.
B $BE9D,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BE9F,$01 Length: #N(#PEEK(#PC)).
N $BEA0 Scaffold #03.
B $BEA0,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BEA2,$01 Length: #N(#PEEK(#PC)).
N $BEA3 Scaffold #04.
B $BEA3,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BEA5,$01 Length: #N(#PEEK(#PC)).
N $BEA6 Scaffold #05.
B $BEA6,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BEA8,$01 Length: #N(#PEEK(#PC)).
N $BEA9 Scaffold #06.
B $BEA9,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BEAB,$01 Length: #N(#PEEK(#PC)).
N $BEAC Scaffold #07.
B $BEAC,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BEAE,$01 Length: #N(#PEEK(#PC)).
N $BEAF Scaffold #08.
B $BEAF,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BEB1,$01 Length: #N(#PEEK(#PC)).
N $BEB2 Scaffold #09.
B $BEB2,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BEB4,$01 Length: #N(#PEEK(#PC)).
B $BEB5,$01 Terminator.
N $BEB6 Doors:
N $BEB6 Door #01.
B $BEB6,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BEB8,$01 Colour: #INK(#PEEK(#PC)).
B $BEB9,$01 Leads to room: #N(#PEEK(#PC)).
N $BEBA Door #02.
B $BEBA,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BEBC,$01 Colour: #INK(#PEEK(#PC)).
B $BEBD,$01 Leads to room: #N(#PEEK(#PC)).
B $BEBE,$01 Terminator.
N $BEBF Ladders:
B $BEBF,$01 Terminator.
N $BEC0 Keys and locked doors.
N $BEC0 Key/ Door #01.
B $BEC0,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BEC3,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $BEC6 Key/ Door #02.
B $BEC6,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BEC9,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $BECC Key/ Door #03.
B $BECC,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BECF,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $BED2 Key/ Door #04.
B $BED2,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BED5,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $BED8 Key/ Door #05.
B $BED8,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BEDB,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $BEDE Key/ Door #06.
B $BEDE,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BEE1,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $BEE4 Key/ Door #07.
B $BEE4,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BEE7,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BEEA,$01 Terminator.
N $BEEB Portholes:
B $BEEB,$01 Terminator.
N $BEEC Pirates:
B $BEEC,$01 Terminator.
N $BEED Items:
N $BEED Item #01.
B $BEED,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BEF1,$01 Colour: #INK(#PEEK(#PC)).
B $BEF3,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $BEF4 Item #02.
B $BEF4,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BEF8,$01 Colour: #INK(#PEEK(#PC)).
B $BEFA,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $BEFB Item #03.
B $BEFB,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BEFF,$01 Colour: #INK(#PEEK(#PC)).
B $BF01,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $BF02 Item #04.
B $BF02,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BF06,$01 Colour: #INK(#PEEK(#PC)).
B $BF08,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $BF09 Item #05.
B $BF09,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BF0D,$01 Colour: #INK(#PEEK(#PC)).
B $BF0F,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $BF10 Item #06.
B $BF10,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BF14,$01 Colour: #INK(#PEEK(#PC)).
B $BF16,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $BF17 Item #07.
B $BF17,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BF1B,$01 Colour: #INK(#PEEK(#PC)).
B $BF1D,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $BF1E,$01 Terminator.
N $BF1F Furniture:
N $BF1F Item #01.
B $BF1F,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BF21,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $BF22,$01 Colour: #INK(#PEEK(#PC)).
B $BF23,$01 Terminator.
N $BF24 Lifts:
N $BF24 Lift #01.
B $BF24,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BF2D,$01 Colour: #INK(#PEEK(#PC)).
N $BF34 Lift #02.
B $BF34,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BF3D,$01 Colour: #INK(#PEEK(#PC)).
N $BF44 Lift #03.
B $BF44,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BF4D,$01 Colour: #INK(#PEEK(#PC)).
N $BF54 Lift #04.
B $BF54,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BF5D,$01 Colour: #INK(#PEEK(#PC)).
B $BF64,$01 Terminator.
N $BF65 Disappearing floors:
B $BF65,$01 Terminator.

g $BF66 Data: Room #17
@ $BF66 label=DataRoom17
D $BF66 See #LINK:Rooms#room_17(Room #17).
N $BF66 #HTML(<img alt="room-bare-17" src="../images/scr/room-bare-17.png">)
N $BF66 The first seven bytes relate to the colours the room uses. See #R$AB44.
B $BF66,$01 Key Colour: #INK(#PEEK(#PC)).
B $BF67,$01 Closed Door Colour: #INK(#PEEK(#PC)).
B $BF68,$01 Unused?: #INK(#PEEK(#PC)).
B $BF69,$01 Scaffolding Colour: #INK(#PEEK(#PC)).
B $BF6A,$01 Border Colour: #INK(#PEEK(#PC)).
B $BF6B,$01 Paper Colour: #INK(#PEEK(#PC)).
B $BF6C,$01 Ladder Colour: #INK(#PEEK(#PC)).
B $BF6D,$01 Terminator.
N $BF6E Room scaffolding:
N $BF6E Scaffold #01.
B $BF6E,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BF70,$01 Length: #N(#PEEK(#PC)).
N $BF71 Scaffold #02.
B $BF71,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BF73,$01 Length: #N(#PEEK(#PC)).
N $BF74 Scaffold #03.
B $BF74,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BF76,$01 Length: #N(#PEEK(#PC)).
N $BF77 Scaffold #04.
B $BF77,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BF79,$01 Length: #N(#PEEK(#PC)).
N $BF7A Scaffold #05.
B $BF7A,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BF7C,$01 Length: #N(#PEEK(#PC)).
N $BF7D Scaffold #06.
B $BF7D,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BF7F,$01 Length: #N(#PEEK(#PC)).
N $BF80 Scaffold #07.
B $BF80,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BF82,$01 Length: #N(#PEEK(#PC)).
N $BF83 Scaffold #08.
B $BF83,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BF85,$01 Length: #N(#PEEK(#PC)).
N $BF86 Scaffold #09.
B $BF86,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BF88,$01 Length: #N(#PEEK(#PC)).
N $BF89 Scaffold #10.
B $BF89,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BF8B,$01 Length: #N(#PEEK(#PC)).
N $BF8C Scaffold #11.
B $BF8C,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BF8E,$01 Length: #N(#PEEK(#PC)).
N $BF8F Scaffold #12.
B $BF8F,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BF91,$01 Length: #N(#PEEK(#PC)).
N $BF92 Scaffold #13.
B $BF92,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BF94,$01 Length: #N(#PEEK(#PC)).
B $BF95,$01 Terminator.
N $BF96 Doors:
N $BF96 Door #01.
B $BF96,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BF98,$01 Colour: #INK(#PEEK(#PC)).
B $BF99,$01 Leads to room: #N(#PEEK(#PC)).
N $BF9A Door #02.
B $BF9A,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BF9C,$01 Colour: #INK(#PEEK(#PC)).
B $BF9D,$01 Leads to room: #N(#PEEK(#PC)).
B $BF9E,$01 Terminator.
N $BF9F Ladders:
B $BF9F,$01 Terminator.
N $BFA0 Keys and locked doors.
N $BFA0 Key/ Door #01.
B $BFA0,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BFA3,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $BFA6 Key/ Door #02.
B $BFA6,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BFA9,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $BFAC Key/ Door #03.
B $BFAC,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BFAF,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $BFB2 Key/ Door #04.
B $BFB2,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BFB5,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $BFB8 Key/ Door #05.
B $BFB8,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BFBB,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BFBE,$01 Terminator.
N $BFBF Portholes:
B $BFBF,$01 Terminator.
N $BFC0 Pirates:
N $BFC0 Pirate #01.
B $BFC0,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BFD0,$01 Terminator.
N $BFD1 Items:
N $BFD1 Item #01.
B $BFD1,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BFD5,$01 Colour: #INK(#PEEK(#PC)).
B $BFD7,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $BFD8 Item #02.
B $BFD8,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BFDC,$01 Colour: #INK(#PEEK(#PC)).
B $BFDE,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $BFDF Item #03.
B $BFDF,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BFE3,$01 Colour: #INK(#PEEK(#PC)).
B $BFE5,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $BFE6 Item #04.
B $BFE6,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BFEA,$01 Colour: #INK(#PEEK(#PC)).
B $BFEC,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $BFED Item #05.
B $BFED,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BFF1,$01 Colour: #INK(#PEEK(#PC)).
B $BFF3,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $BFF4 Item #06.
B $BFF4,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BFF8,$01 Colour: #INK(#PEEK(#PC)).
B $BFFA,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $BFFB,$01 Terminator.
N $BFFC Furniture:
N $BFFC Item #01.
B $BFFC,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $BFFE,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $BFFF,$01 Colour: #INK(#PEEK(#PC)).
N $C000 Item #02.
B $C000,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C002,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C003,$01 Colour: #INK(#PEEK(#PC)).
N $C004 Item #03.
B $C004,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C006,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C007,$01 Colour: #INK(#PEEK(#PC)).
B $C008,$01 Terminator.
N $C009 Lifts:
N $C009 Lift #01.
B $C009,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C012,$01 Colour: #INK(#PEEK(#PC)).
N $C019 Lift #02.
B $C019,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C022,$01 Colour: #INK(#PEEK(#PC)).
N $C029 Lift #03.
B $C029,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C032,$01 Colour: #INK(#PEEK(#PC)).
N $C039 Lift #04.
B $C039,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C042,$01 Colour: #INK(#PEEK(#PC)).
B $C049,$01 Terminator.
N $C04A Disappearing floors:
N $C04A Instance #01.
B $C04A,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C04C,$01 Width: #N(#PEEK(#PC)).
N $C050 Instance #02.
B $C050,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C052,$01 Width: #N(#PEEK(#PC)).
N $C056 Instance #03.
B $C056,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C058,$01 Width: #N(#PEEK(#PC)).
B $C05C,$01 Terminator.

g $C05D Data: Room #16
@ $C05D label=DataRoom16
D $C05D See #LINK:Rooms#room_16(Room #16).
N $C05D #HTML(<img alt="room-bare-16" src="../images/scr/room-bare-16.png">)
N $C05D The first seven bytes relate to the colours the room uses. See #R$AB44.
B $C05D,$01 Key Colour: #INK(#PEEK(#PC)).
B $C05E,$01 Closed Door Colour: #INK(#PEEK(#PC)).
B $C05F,$01 Unused?: #INK(#PEEK(#PC)).
B $C060,$01 Scaffolding Colour: #INK(#PEEK(#PC)).
B $C061,$01 Border Colour: #INK(#PEEK(#PC)).
B $C062,$01 Paper Colour: #INK(#PEEK(#PC)).
B $C063,$01 Ladder Colour: #INK(#PEEK(#PC)).
B $C064,$01 Terminator.
N $C065 Room scaffolding:
N $C065 Scaffold #01.
B $C065,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C067,$01 Length: #N(#PEEK(#PC)).
N $C068 Scaffold #02.
B $C068,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C06A,$01 Length: #N(#PEEK(#PC)).
N $C06B Scaffold #03.
B $C06B,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C06D,$01 Length: #N(#PEEK(#PC)).
N $C06E Scaffold #04.
B $C06E,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C070,$01 Length: #N(#PEEK(#PC)).
N $C071 Scaffold #05.
B $C071,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C073,$01 Length: #N(#PEEK(#PC)).
N $C074 Scaffold #06.
B $C074,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C076,$01 Length: #N(#PEEK(#PC)).
N $C077 Scaffold #07.
B $C077,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C079,$01 Length: #N(#PEEK(#PC)).
B $C07A,$01 Terminator.
N $C07B Doors:
N $C07B Door #01.
B $C07B,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C07D,$01 Colour: #INK(#PEEK(#PC)).
B $C07E,$01 Leads to room: #N(#PEEK(#PC)).
N $C07F Door #02.
B $C07F,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C081,$01 Colour: #INK(#PEEK(#PC)).
B $C082,$01 Leads to room: #N(#PEEK(#PC)).
N $C083 Door #03.
B $C083,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C085,$01 Colour: #INK(#PEEK(#PC)).
B $C086,$01 Leads to room: #N(#PEEK(#PC)).
B $C087,$01 Terminator.
N $C088 Ladders:
B $C088,$01 Terminator.
N $C089 Keys and locked doors.
N $C089 Key/ Door #01.
B $C089,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C08C,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C08F Key/ Door #02.
B $C08F,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C092,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C095 Key/ Door #03.
B $C095,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C098,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C09B Key/ Door #04.
B $C09B,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C09E,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C0A1 Key/ Door #05.
B $C0A1,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C0A4,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C0A7 Key/ Door #06.
B $C0A7,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C0AA,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C0AD,$01 Terminator.
N $C0AE Portholes:
B $C0AE,$01 Terminator.
N $C0AF Pirates:
N $C0AF Pirate #01.
B $C0AF,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C0BF Pirate #02.
B $C0BF,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C0CF,$01 Terminator.
N $C0D0 Items:
N $C0D0 Item #01.
B $C0D0,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C0D4,$01 Colour: #INK(#PEEK(#PC)).
B $C0D6,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C0D7 Item #02.
B $C0D7,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C0DB,$01 Colour: #INK(#PEEK(#PC)).
B $C0DD,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C0DE Item #03.
B $C0DE,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C0E2,$01 Colour: #INK(#PEEK(#PC)).
B $C0E4,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C0E5 Item #04.
B $C0E5,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C0E9,$01 Colour: #INK(#PEEK(#PC)).
B $C0EB,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C0EC Item #05.
B $C0EC,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C0F0,$01 Colour: #INK(#PEEK(#PC)).
B $C0F2,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C0F3 Item #06.
B $C0F3,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C0F7,$01 Colour: #INK(#PEEK(#PC)).
B $C0F9,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C0FA Item #07.
B $C0FA,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C0FE,$01 Colour: #INK(#PEEK(#PC)).
B $C100,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C101,$01 Terminator.
N $C102 Furniture:
N $C102 Item #01.
B $C102,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C104,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C105,$01 Colour: #INK(#PEEK(#PC)).
N $C106 Item #02.
B $C106,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C108,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C109,$01 Colour: #INK(#PEEK(#PC)).
B $C10A,$01 Terminator.
N $C10B Lifts:
N $C10B Lift #01.
B $C10B,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C114,$01 Colour: #INK(#PEEK(#PC)).
N $C11B Lift #02.
B $C11B,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C124,$01 Colour: #INK(#PEEK(#PC)).
B $C12B,$01 Terminator.
N $C12C Disappearing floors:
B $C12C,$01 Terminator.

g $C12D Data: Room #15
@ $C12D label=DataRoom15
D $C12D See #LINK:Rooms#room_15(Room #15).
N $C12D #HTML(<img alt="room-bare-15" src="../images/scr/room-bare-15.png">)
N $C12D The first seven bytes relate to the colours the room uses. See #R$AB44.
B $C12D,$01 Key Colour: #INK(#PEEK(#PC)).
B $C12E,$01 Closed Door Colour: #INK(#PEEK(#PC)).
B $C12F,$01 Unused?: #INK(#PEEK(#PC)).
B $C130,$01 Scaffolding Colour: #INK(#PEEK(#PC)).
B $C131,$01 Border Colour: #INK(#PEEK(#PC)).
B $C132,$01 Paper Colour: #INK(#PEEK(#PC)).
B $C133,$01 Ladder Colour: #INK(#PEEK(#PC)).
B $C134,$01 Terminator.
N $C135 Room scaffolding:
N $C135 Scaffold #01.
B $C135,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C137,$01 Length: #N(#PEEK(#PC)).
N $C138 Scaffold #02.
B $C138,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C13A,$01 Length: #N(#PEEK(#PC)).
N $C13B Scaffold #03.
B $C13B,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C13D,$01 Length: #N(#PEEK(#PC)).
N $C13E Scaffold #04.
B $C13E,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C140,$01 Length: #N(#PEEK(#PC)).
N $C141 Scaffold #05.
B $C141,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C143,$01 Length: #N(#PEEK(#PC)).
N $C144 Scaffold #06.
B $C144,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C146,$01 Length: #N(#PEEK(#PC)).
N $C147 Scaffold #07.
B $C147,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C149,$01 Length: #N(#PEEK(#PC)).
N $C14A Scaffold #08.
B $C14A,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C14C,$01 Length: #N(#PEEK(#PC)).
N $C14D Scaffold #09.
B $C14D,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C14F,$01 Length: #N(#PEEK(#PC)).
N $C150 Scaffold #10.
B $C150,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C152,$01 Length: #N(#PEEK(#PC)).
N $C153 Scaffold #11.
B $C153,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C155,$01 Length: #N(#PEEK(#PC)).
N $C156 Scaffold #12.
B $C156,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C158,$01 Length: #N(#PEEK(#PC)).
N $C159 Scaffold #13.
B $C159,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C15B,$01 Length: #N(#PEEK(#PC)).
B $C15C,$01 Terminator.
N $C15D Doors:
N $C15D Door #01.
B $C15D,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C15F,$01 Colour: #INK(#PEEK(#PC)).
B $C160,$01 Leads to room: #N(#PEEK(#PC)).
N $C161 Door #02.
B $C161,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C163,$01 Colour: #INK(#PEEK(#PC)).
B $C164,$01 Leads to room: #N(#PEEK(#PC)).
N $C165 Door #03.
B $C165,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C167,$01 Colour: #INK(#PEEK(#PC)).
B $C168,$01 Leads to room: #N(#PEEK(#PC)).
B $C169,$01 Terminator.
N $C16A Ladders:
B $C16A,$01 Terminator.
N $C16B Keys and locked doors.
N $C16B Key/ Door #01.
B $C16B,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C16E,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C171 Key/ Door #02.
B $C171,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C174,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C177 Key/ Door #03.
B $C177,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C17A,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C17D Key/ Door #04.
B $C17D,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C180,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C183 Key/ Door #05.
B $C183,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C186,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C189 Key/ Door #06.
B $C189,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C18C,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C18F,$01 Terminator.
N $C190 Portholes:
B $C190,$01 Terminator.
N $C191 Pirates:
B $C191,$01 Terminator.
N $C192 Items:
N $C192 Item #01.
B $C192,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C196,$01 Colour: #INK(#PEEK(#PC)).
B $C198,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C199 Item #02.
B $C199,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C19D,$01 Colour: #INK(#PEEK(#PC)).
B $C19F,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C1A0 Item #03.
B $C1A0,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C1A4,$01 Colour: #INK(#PEEK(#PC)).
B $C1A6,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C1A7 Item #04.
B $C1A7,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C1AB,$01 Colour: #INK(#PEEK(#PC)).
B $C1AD,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C1AE Item #05.
B $C1AE,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C1B2,$01 Colour: #INK(#PEEK(#PC)).
B $C1B4,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C1B5 Item #06.
B $C1B5,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C1B9,$01 Colour: #INK(#PEEK(#PC)).
B $C1BB,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C1BC Item #07.
B $C1BC,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C1C0,$01 Colour: #INK(#PEEK(#PC)).
B $C1C2,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C1C3 Item #08.
B $C1C3,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C1C7,$01 Colour: #INK(#PEEK(#PC)).
B $C1C9,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C1CA Item #09.
B $C1CA,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C1CE,$01 Colour: #INK(#PEEK(#PC)).
B $C1D0,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C1D1 Item #10.
B $C1D1,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C1D5,$01 Colour: #INK(#PEEK(#PC)).
B $C1D7,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C1D8,$01 Terminator.
N $C1D9 Furniture:
N $C1D9 Item #01.
B $C1D9,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C1DB,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C1DC,$01 Colour: #INK(#PEEK(#PC)).
N $C1DD Item #02.
B $C1DD,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C1DF,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C1E0,$01 Colour: #INK(#PEEK(#PC)).
B $C1E1,$01 Terminator.
N $C1E2 Lifts:
N $C1E2 Lift #01.
B $C1E2,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C1EB,$01 Colour: #INK(#PEEK(#PC)).
N $C1F2 Lift #02.
B $C1F2,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C1FB,$01 Colour: #INK(#PEEK(#PC)).
B $C202,$01 Terminator.
N $C203 Disappearing floors:
B $C203,$01 Terminator.

g $C204 Data: Room #14
@ $C204 label=DataRoom14
D $C204 See #LINK:Rooms#room_14(Room #14).
N $C204 #HTML(<img alt="room-bare-14" src="../images/scr/room-bare-14.png">)
N $C204 The first seven bytes relate to the colours the room uses. See #R$AB44.
B $C204,$01 Key Colour: #INK(#PEEK(#PC)).
B $C205,$01 Closed Door Colour: #INK(#PEEK(#PC)).
B $C206,$01 Unused?: #INK(#PEEK(#PC)).
B $C207,$01 Scaffolding Colour: #INK(#PEEK(#PC)).
B $C208,$01 Border Colour: #INK(#PEEK(#PC)).
B $C209,$01 Paper Colour: #INK(#PEEK(#PC)).
B $C20A,$01 Ladder Colour: #INK(#PEEK(#PC)).
B $C20B,$01 Terminator.
N $C20C Room scaffolding:
N $C20C Scaffold #01.
B $C20C,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C20E,$01 Length: #N(#PEEK(#PC)).
N $C20F Scaffold #02.
B $C20F,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C211,$01 Length: #N(#PEEK(#PC)).
N $C212 Scaffold #03.
B $C212,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C214,$01 Length: #N(#PEEK(#PC)).
N $C215 Scaffold #04.
B $C215,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C217,$01 Length: #N(#PEEK(#PC)).
N $C218 Scaffold #05.
B $C218,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C21A,$01 Length: #N(#PEEK(#PC)).
N $C21B Scaffold #06.
B $C21B,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C21D,$01 Length: #N(#PEEK(#PC)).
N $C21E Scaffold #07.
B $C21E,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C220,$01 Length: #N(#PEEK(#PC)).
N $C221 Scaffold #08.
B $C221,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C223,$01 Length: #N(#PEEK(#PC)).
B $C224,$01 Terminator.
N $C225 Doors:
N $C225 Door #01.
B $C225,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C227,$01 Colour: #INK(#PEEK(#PC)).
B $C228,$01 Leads to room: #N(#PEEK(#PC)).
N $C229 Door #02.
B $C229,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C22B,$01 Colour: #INK(#PEEK(#PC)).
B $C22C,$01 Leads to room: #N(#PEEK(#PC)).
N $C22D Door #03.
B $C22D,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C22F,$01 Colour: #INK(#PEEK(#PC)).
B $C230,$01 Leads to room: #N(#PEEK(#PC)).
B $C231,$01 Terminator.
N $C232 Ladders:
N $C232 Ladder #01.
B $C232,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C234 Ladder #02.
B $C234,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C236 Ladder #03.
B $C236,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C238,$01 Terminator.
N $C239 Keys and locked doors.
B $C239,$01 Terminator.
N $C23A Portholes:
B $C23A,$01 Terminator.
N $C23B Pirates:
N $C23B Pirate #01.
B $C23B,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C24B,$01 Terminator.
N $C24C Items:
N $C24C Item #01.
B $C24C,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C250,$01 Colour: #INK(#PEEK(#PC)).
B $C252,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C253 Item #02.
B $C253,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C257,$01 Colour: #INK(#PEEK(#PC)).
B $C259,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C25A Item #03.
B $C25A,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C25E,$01 Colour: #INK(#PEEK(#PC)).
B $C260,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C261 Item #04.
B $C261,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C265,$01 Colour: #INK(#PEEK(#PC)).
B $C267,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C268 Item #05.
B $C268,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C26C,$01 Colour: #INK(#PEEK(#PC)).
B $C26E,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C26F Item #06.
B $C26F,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C273,$01 Colour: #INK(#PEEK(#PC)).
B $C275,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C276 Item #07.
B $C276,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C27A,$01 Colour: #INK(#PEEK(#PC)).
B $C27C,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C27D,$01 Terminator.
N $C27E Furniture:
N $C27E Item #01.
B $C27E,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C280,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C281,$01 Colour: #INK(#PEEK(#PC)).
N $C282 Item #02.
B $C282,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C284,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C285,$01 Colour: #INK(#PEEK(#PC)).
N $C286 Item #03.
B $C286,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C288,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C289,$01 Colour: #INK(#PEEK(#PC)).
B $C28A,$01 Terminator.
N $C28B Lifts:
N $C28B Lift #01.
B $C28B,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C294,$01 Colour: #INK(#PEEK(#PC)).
N $C29B Lift #02.
B $C29B,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C2A4,$01 Colour: #INK(#PEEK(#PC)).
N $C2AB Lift #03.
B $C2AB,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C2B4,$01 Colour: #INK(#PEEK(#PC)).
B $C2BB,$01 Terminator.
N $C2BC Disappearing floors:
B $C2BC,$01 Terminator.

g $C2BD Data: Room #13
@ $C2BD label=DataRoom13
D $C2BD See #LINK:Rooms#room_13(Room #13).
N $C2BD #HTML(<img alt="room-bare-13" src="../images/scr/room-bare-13.png">)
N $C2BD The first seven bytes relate to the colours the room uses. See #R$AB44.
B $C2BD,$01 Key Colour: #INK(#PEEK(#PC)).
B $C2BE,$01 Closed Door Colour: #INK(#PEEK(#PC)).
B $C2BF,$01 Unused?: #INK(#PEEK(#PC)).
B $C2C0,$01 Scaffolding Colour: #INK(#PEEK(#PC)).
B $C2C1,$01 Border Colour: #INK(#PEEK(#PC)).
B $C2C2,$01 Paper Colour: #INK(#PEEK(#PC)).
B $C2C3,$01 Ladder Colour: #INK(#PEEK(#PC)).
B $C2C4,$01 Terminator.
N $C2C5 Room scaffolding:
N $C2C5 Scaffold #01.
B $C2C5,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C2C7,$01 Length: #N(#PEEK(#PC)).
N $C2C8 Scaffold #02.
B $C2C8,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C2CA,$01 Length: #N(#PEEK(#PC)).
N $C2CB Scaffold #03.
B $C2CB,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C2CD,$01 Length: #N(#PEEK(#PC)).
N $C2CE Scaffold #04.
B $C2CE,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C2D0,$01 Length: #N(#PEEK(#PC)).
N $C2D1 Scaffold #05.
B $C2D1,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C2D3,$01 Length: #N(#PEEK(#PC)).
N $C2D4 Scaffold #06.
B $C2D4,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C2D6,$01 Length: #N(#PEEK(#PC)).
N $C2D7 Scaffold #07.
B $C2D7,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C2D9,$01 Length: #N(#PEEK(#PC)).
N $C2DA Scaffold #08.
B $C2DA,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C2DC,$01 Length: #N(#PEEK(#PC)).
N $C2DD Scaffold #09.
B $C2DD,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C2DF,$01 Length: #N(#PEEK(#PC)).
B $C2E0,$01 Terminator.
N $C2E1 Doors:
N $C2E1 Door #01.
B $C2E1,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C2E3,$01 Colour: #INK(#PEEK(#PC)).
B $C2E4,$01 Leads to room: #N(#PEEK(#PC)).
N $C2E5 Door #02.
B $C2E5,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C2E7,$01 Colour: #INK(#PEEK(#PC)).
B $C2E8,$01 Leads to room: #N(#PEEK(#PC)).
N $C2E9 Door #03.
B $C2E9,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C2EB,$01 Colour: #INK(#PEEK(#PC)).
B $C2EC,$01 Leads to room: #N(#PEEK(#PC)).
B $C2ED,$01 Terminator.
N $C2EE Ladders:
B $C2EE,$01 Terminator.
N $C2EF Keys and locked doors.
N $C2EF Key/ Door #01.
B $C2EF,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C2F2,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C2F5 Key/ Door #02.
B $C2F5,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C2F8,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C2FB Key/ Door #03.
B $C2FB,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C2FE,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C301 Key/ Door #04.
B $C301,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C304,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C307 Key/ Door #05.
B $C307,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C30A,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C30D,$01 Terminator.
N $C30E Portholes:
N $C30E Porthole #01.
B $C30E,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C310,$01 UDG: #R($914C+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C311 Porthole #02.
B $C311,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C313,$01 UDG: #R($914C+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C314,$01 Terminator.
N $C315 Pirates:
N $C315 Pirate #01.
B $C315,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C325,$01 Terminator.
N $C326 Items:
N $C326 Item #01.
B $C326,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C32A,$01 Colour: #INK(#PEEK(#PC)).
B $C32C,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C32D Item #02.
B $C32D,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C331,$01 Colour: #INK(#PEEK(#PC)).
B $C333,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C334 Item #03.
B $C334,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C338,$01 Colour: #INK(#PEEK(#PC)).
B $C33A,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C33B Item #04.
B $C33B,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C33F,$01 Colour: #INK(#PEEK(#PC)).
B $C341,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C342 Item #05.
B $C342,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C346,$01 Colour: #INK(#PEEK(#PC)).
B $C348,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C349 Item #06.
B $C349,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C34D,$01 Colour: #INK(#PEEK(#PC)).
B $C34F,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C350 Item #07.
B $C350,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C354,$01 Colour: #INK(#PEEK(#PC)).
B $C356,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C357,$01 Terminator.
N $C358 Furniture:
N $C358 Item #01.
B $C358,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C35A,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C35B,$01 Colour: #INK(#PEEK(#PC)).
N $C35C Item #02.
B $C35C,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C35E,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C35F,$01 Colour: #INK(#PEEK(#PC)).
N $C360 Item #03.
B $C360,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C362,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C363,$01 Colour: #INK(#PEEK(#PC)).
B $C364,$01 Terminator.
N $C365 Lifts:
N $C365 Lift #01.
B $C365,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C36E,$01 Colour: #INK(#PEEK(#PC)).
B $C375,$01 Terminator.
N $C376 Disappearing floors:
B $C376,$01 Terminator.

g $C377 Data: Room #12
@ $C377 label=DataRoom12
D $C377 See #LINK:Rooms#room_12(Room #12).
N $C377 #HTML(<img alt="room-bare-12" src="../images/scr/room-bare-12.png">)
N $C377 The first seven bytes relate to the colours the room uses. See #R$AB44.
B $C377,$01 Key Colour: #INK(#PEEK(#PC)).
B $C378,$01 Closed Door Colour: #INK(#PEEK(#PC)).
B $C379,$01 Unused?: #INK(#PEEK(#PC)).
B $C37A,$01 Scaffolding Colour: #INK(#PEEK(#PC)).
B $C37B,$01 Border Colour: #INK(#PEEK(#PC)).
B $C37C,$01 Paper Colour: #INK(#PEEK(#PC)).
B $C37D,$01 Ladder Colour: #INK(#PEEK(#PC)).
B $C37E,$01 Terminator.
N $C37F Room scaffolding:
N $C37F Scaffold #01.
B $C37F,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C381,$01 Length: #N(#PEEK(#PC)).
N $C382 Scaffold #02.
B $C382,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C384,$01 Length: #N(#PEEK(#PC)).
N $C385 Scaffold #03.
B $C385,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C387,$01 Length: #N(#PEEK(#PC)).
N $C388 Scaffold #04.
B $C388,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C38A,$01 Length: #N(#PEEK(#PC)).
N $C38B Scaffold #05.
B $C38B,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C38D,$01 Length: #N(#PEEK(#PC)).
N $C38E Scaffold #06.
B $C38E,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C390,$01 Length: #N(#PEEK(#PC)).
N $C391 Scaffold #07.
B $C391,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C393,$01 Length: #N(#PEEK(#PC)).
N $C394 Scaffold #08.
B $C394,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C396,$01 Length: #N(#PEEK(#PC)).
N $C397 Scaffold #09.
B $C397,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C399,$01 Length: #N(#PEEK(#PC)).
N $C39A Scaffold #10.
B $C39A,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C39C,$01 Length: #N(#PEEK(#PC)).
B $C39D,$01 Terminator.
N $C39E Doors:
N $C39E Door #01.
B $C39E,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C3A0,$01 Colour: #INK(#PEEK(#PC)).
B $C3A1,$01 Leads to room: #N(#PEEK(#PC)).
N $C3A2 Door #02.
B $C3A2,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C3A4,$01 Colour: #INK(#PEEK(#PC)).
B $C3A5,$01 Leads to room: #N(#PEEK(#PC)).
N $C3A6 Door #03.
B $C3A6,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C3A8,$01 Colour: #INK(#PEEK(#PC)).
B $C3A9,$01 Leads to room: #N(#PEEK(#PC)).
B $C3AA,$01 Terminator.
N $C3AB Ladders:
N $C3AB Ladder #01.
B $C3AB,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C3AD,$01 Terminator.
N $C3AE Keys and locked doors.
N $C3AE Key/ Door #01.
B $C3AE,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C3B1,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C3B4 Key/ Door #02.
B $C3B4,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C3B7,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C3BA Key/ Door #03.
B $C3BA,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C3BD,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C3C0,$01 Terminator.
N $C3C1 Portholes:
B $C3C1,$01 Terminator.
N $C3C2 Pirates:
N $C3C2 Pirate #01.
B $C3C2,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C3D2 Pirate #02.
B $C3D2,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C3E2 Pirate #03.
B $C3E2,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C3F2,$01 Terminator.
N $C3F3 Items:
N $C3F3 Item #01.
B $C3F3,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C3F7,$01 Colour: #INK(#PEEK(#PC)).
B $C3F9,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C3FA Item #02.
B $C3FA,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C3FE,$01 Colour: #INK(#PEEK(#PC)).
B $C400,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C401 Item #03.
B $C401,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C405,$01 Colour: #INK(#PEEK(#PC)).
B $C407,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C408 Item #04.
B $C408,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C40C,$01 Colour: #INK(#PEEK(#PC)).
B $C40E,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C40F,$01 Terminator.
N $C410 Furniture:
B $C410,$01 Terminator.
N $C411 Lifts:
N $C411 Lift #01.
B $C411,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C41A,$01 Colour: #INK(#PEEK(#PC)).
N $C421 Lift #02.
B $C421,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C42A,$01 Colour: #INK(#PEEK(#PC)).
N $C431 Lift #03.
B $C431,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C43A,$01 Colour: #INK(#PEEK(#PC)).
B $C441,$01 Terminator.
N $C442 Disappearing floors:
N $C442 Instance #01.
B $C442,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C444,$01 Width: #N(#PEEK(#PC)).
B $C448,$01 Terminator.

g $C449 Data: Room #11
@ $C449 label=DataRoom11
D $C449 See #LINK:Rooms#room_11(Room #11).
N $C449 #HTML(<img alt="room-bare-11" src="../images/scr/room-bare-11.png">)
N $C449 The first seven bytes relate to the colours the room uses. See #R$AB44.
B $C449,$01 Key Colour: #INK(#PEEK(#PC)).
B $C44A,$01 Closed Door Colour: #INK(#PEEK(#PC)).
B $C44B,$01 Unused?: #INK(#PEEK(#PC)).
B $C44C,$01 Scaffolding Colour: #INK(#PEEK(#PC)).
B $C44D,$01 Border Colour: #INK(#PEEK(#PC)).
B $C44E,$01 Paper Colour: #INK(#PEEK(#PC)).
B $C44F,$01 Ladder Colour: #INK(#PEEK(#PC)).
B $C450,$01 Terminator.
N $C451 Room scaffolding:
N $C451 Scaffold #01.
B $C451,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C453,$01 Length: #N(#PEEK(#PC)).
N $C454 Scaffold #02.
B $C454,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C456,$01 Length: #N(#PEEK(#PC)).
N $C457 Scaffold #03.
B $C457,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C459,$01 Length: #N(#PEEK(#PC)).
N $C45A Scaffold #04.
B $C45A,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C45C,$01 Length: #N(#PEEK(#PC)).
N $C45D Scaffold #05.
B $C45D,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C45F,$01 Length: #N(#PEEK(#PC)).
B $C460,$01 Terminator.
N $C461 Doors:
N $C461 Door #01.
B $C461,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C463,$01 Colour: #INK(#PEEK(#PC)).
B $C464,$01 Leads to room: #N(#PEEK(#PC)).
N $C465 Door #02.
B $C465,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C467,$01 Colour: #INK(#PEEK(#PC)).
B $C468,$01 Leads to room: #N(#PEEK(#PC)).
N $C469 Door #03.
B $C469,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C46B,$01 Colour: #INK(#PEEK(#PC)).
B $C46C,$01 Leads to room: #N(#PEEK(#PC)).
B $C46D,$01 Terminator.
N $C46E Ladders:
N $C46E Ladder #01.
B $C46E,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C470 Ladder #02.
B $C470,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C472 Ladder #03.
B $C472,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C474,$01 Terminator.
N $C475 Keys and locked doors.
N $C475 Key/ Door #01.
B $C475,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C478,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C47B Key/ Door #02.
B $C47B,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C47E,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C481 Key/ Door #03.
B $C481,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C484,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C487 Key/ Door #04.
B $C487,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C48A,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C48D Key/ Door #05.
B $C48D,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C490,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C493 Key/ Door #06.
B $C493,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C496,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C499,$01 Terminator.
N $C49A Portholes:
B $C49A,$01 Terminator.
N $C49B Pirates:
N $C49B Pirate #01.
B $C49B,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C4AB,$01 Terminator.
N $C4AC Items:
N $C4AC Item #01.
B $C4AC,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C4B0,$01 Colour: #INK(#PEEK(#PC)).
B $C4B2,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C4B3 Item #02.
B $C4B3,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C4B7,$01 Colour: #INK(#PEEK(#PC)).
B $C4B9,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C4BA Item #03.
B $C4BA,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C4BE,$01 Colour: #INK(#PEEK(#PC)).
B $C4C0,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C4C1 Item #04.
B $C4C1,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C4C5,$01 Colour: #INK(#PEEK(#PC)).
B $C4C7,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C4C8 Item #05.
B $C4C8,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C4CC,$01 Colour: #INK(#PEEK(#PC)).
B $C4CE,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C4CF Item #06.
B $C4CF,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C4D3,$01 Colour: #INK(#PEEK(#PC)).
B $C4D5,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C4D6,$01 Terminator.
N $C4D7 Furniture:
N $C4D7 Item #01.
B $C4D7,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C4D9,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C4DA,$01 Colour: #INK(#PEEK(#PC)).
N $C4DB Item #02.
B $C4DB,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C4DD,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C4DE,$01 Colour: #INK(#PEEK(#PC)).
B $C4DF,$01 Terminator.
N $C4E0 Lifts:
B $C4E0,$01 Terminator.
N $C4E1 Disappearing floors:
N $C4E1 Instance #01.
B $C4E1,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C4E3,$01 Width: #N(#PEEK(#PC)).
N $C4E7 Instance #02.
B $C4E7,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C4E9,$01 Width: #N(#PEEK(#PC)).
N $C4ED Instance #03.
B $C4ED,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C4EF,$01 Width: #N(#PEEK(#PC)).
B $C4F3,$01 Terminator.

g $C4F4 Data: Room #10
@ $C4F4 label=DataRoom10
D $C4F4 See #LINK:Rooms#room_10(Room #10).
N $C4F4 #HTML(<img alt="room-bare-10" src="../images/scr/room-bare-10.png">)
N $C4F4 The first seven bytes relate to the colours the room uses. See #R$AB44.
B $C4F4,$01 Key Colour: #INK(#PEEK(#PC)).
B $C4F5,$01 Closed Door Colour: #INK(#PEEK(#PC)).
B $C4F6,$01 Unused?: #INK(#PEEK(#PC)).
B $C4F7,$01 Scaffolding Colour: #INK(#PEEK(#PC)).
B $C4F8,$01 Border Colour: #INK(#PEEK(#PC)).
B $C4F9,$01 Paper Colour: #INK(#PEEK(#PC)).
B $C4FA,$01 Ladder Colour: #INK(#PEEK(#PC)).
B $C4FB,$01 Terminator.
N $C4FC Room scaffolding:
N $C4FC Scaffold #01.
B $C4FC,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C4FE,$01 Length: #N(#PEEK(#PC)).
N $C4FF Scaffold #02.
B $C4FF,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C501,$01 Length: #N(#PEEK(#PC)).
N $C502 Scaffold #03.
B $C502,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C504,$01 Length: #N(#PEEK(#PC)).
N $C505 Scaffold #04.
B $C505,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C507,$01 Length: #N(#PEEK(#PC)).
N $C508 Scaffold #05.
B $C508,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C50A,$01 Length: #N(#PEEK(#PC)).
N $C50B Scaffold #06.
B $C50B,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C50D,$01 Length: #N(#PEEK(#PC)).
N $C50E Scaffold #07.
B $C50E,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C510,$01 Length: #N(#PEEK(#PC)).
N $C511 Scaffold #08.
B $C511,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C513,$01 Length: #N(#PEEK(#PC)).
N $C514 Scaffold #09.
B $C514,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C516,$01 Length: #N(#PEEK(#PC)).
N $C517 Scaffold #10.
B $C517,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C519,$01 Length: #N(#PEEK(#PC)).
B $C51A,$01 Terminator.
N $C51B Doors:
N $C51B Door #01.
B $C51B,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C51D,$01 Colour: #INK(#PEEK(#PC)).
B $C51E,$01 Leads to room: #N(#PEEK(#PC)).
N $C51F Door #02.
B $C51F,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C521,$01 Colour: #INK(#PEEK(#PC)).
B $C522,$01 Leads to room: #N(#PEEK(#PC)).
N $C523 Door #03.
B $C523,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C525,$01 Colour: #INK(#PEEK(#PC)).
B $C526,$01 Leads to room: #N(#PEEK(#PC)).
N $C527 Door #04.
B $C527,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C529,$01 Colour: #INK(#PEEK(#PC)).
B $C52A,$01 Leads to room: #N(#PEEK(#PC)).
B $C52B,$01 Terminator.
N $C52C Ladders:
B $C52C,$01 Terminator.
N $C52D Keys and locked doors.
N $C52D Key/ Door #01.
B $C52D,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C530,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C533 Key/ Door #02.
B $C533,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C536,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C539 Key/ Door #03.
B $C539,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C53C,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C53F Key/ Door #04.
B $C53F,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C542,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C545 Key/ Door #05.
B $C545,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C548,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C54B Key/ Door #06.
B $C54B,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C54E,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C551,$01 Terminator.
N $C552 Portholes:
B $C552,$01 Terminator.
N $C553 Pirates:
B $C553,$01 Terminator.
N $C554 Items:
N $C554 Item #01.
B $C554,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C558,$01 Colour: #INK(#PEEK(#PC)).
B $C55A,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C55B Item #02.
B $C55B,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C55F,$01 Colour: #INK(#PEEK(#PC)).
B $C561,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C562 Item #03.
B $C562,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C566,$01 Colour: #INK(#PEEK(#PC)).
B $C568,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C569 Item #04.
B $C569,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C56D,$01 Colour: #INK(#PEEK(#PC)).
B $C56F,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C570 Item #05.
B $C570,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C574,$01 Colour: #INK(#PEEK(#PC)).
B $C576,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C577 Item #06.
B $C577,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C57B,$01 Colour: #INK(#PEEK(#PC)).
B $C57D,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C57E,$01 Terminator.
N $C57F Furniture:
B $C57F,$01 Terminator.
N $C580 Lifts:
N $C580 Lift #01.
B $C580,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C589,$01 Colour: #INK(#PEEK(#PC)).
N $C590 Lift #02.
B $C590,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C599,$01 Colour: #INK(#PEEK(#PC)).
B $C5A0,$01 Terminator.
N $C5A1 Disappearing floors:
B $C5A1,$01 Terminator.

g $C5A2 Data: Room #09
@ $C5A2 label=DataRoom09
D $C5A2 See #LINK:Rooms#room_09(Room #09).
N $C5A2 #HTML(<img alt="room-bare-09" src="../images/scr/room-bare-09.png">)
N $C5A2 The first seven bytes relate to the colours the room uses. See #R$AB44.
B $C5A2,$01 Key Colour: #INK(#PEEK(#PC)).
B $C5A3,$01 Closed Door Colour: #INK(#PEEK(#PC)).
B $C5A4,$01 Unused?: #INK(#PEEK(#PC)).
B $C5A5,$01 Scaffolding Colour: #INK(#PEEK(#PC)).
B $C5A6,$01 Border Colour: #INK(#PEEK(#PC)).
B $C5A7,$01 Paper Colour: #INK(#PEEK(#PC)).
B $C5A8,$01 Ladder Colour: #INK(#PEEK(#PC)).
B $C5A9,$01 Terminator.
N $C5AA Room scaffolding:
N $C5AA Scaffold #01.
B $C5AA,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C5AC,$01 Length: #N(#PEEK(#PC)).
N $C5AD Scaffold #02.
B $C5AD,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C5AF,$01 Length: #N(#PEEK(#PC)).
N $C5B0 Scaffold #03.
B $C5B0,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C5B2,$01 Length: #N(#PEEK(#PC)).
N $C5B3 Scaffold #04.
B $C5B3,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C5B5,$01 Length: #N(#PEEK(#PC)).
N $C5B6 Scaffold #05.
B $C5B6,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C5B8,$01 Length: #N(#PEEK(#PC)).
N $C5B9 Scaffold #06.
B $C5B9,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C5BB,$01 Length: #N(#PEEK(#PC)).
N $C5BC Scaffold #07.
B $C5BC,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C5BE,$01 Length: #N(#PEEK(#PC)).
B $C5BF,$01 Terminator.
N $C5C0 Doors:
N $C5C0 Door #01.
B $C5C0,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C5C2,$01 Colour: #INK(#PEEK(#PC)).
B $C5C3,$01 Leads to room: #N(#PEEK(#PC)).
N $C5C4 Door #02.
B $C5C4,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C5C6,$01 Colour: #INK(#PEEK(#PC)).
B $C5C7,$01 Leads to room: #N(#PEEK(#PC)).
N $C5C8 Door #03.
B $C5C8,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C5CA,$01 Colour: #INK(#PEEK(#PC)).
B $C5CB,$01 Leads to room: #N(#PEEK(#PC)).
B $C5CC,$01 Terminator.
N $C5CD Ladders:
N $C5CD Ladder #01.
B $C5CD,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C5CF Ladder #02.
B $C5CF,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C5D1 Ladder #03.
B $C5D1,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C5D3 Ladder #04.
B $C5D3,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C5D5 Ladder #05.
B $C5D5,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C5D7,$01 Terminator.
N $C5D8 Keys and locked doors.
B $C5D8,$01 Terminator.
N $C5D9 Portholes:
B $C5D9,$01 Terminator.
N $C5DA Pirates:
N $C5DA Pirate #01.
B $C5DA,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C5EA Pirate #02.
B $C5EA,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C5FA Pirate #03.
B $C5FA,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C60A,$01 Terminator.
N $C60B Items:
N $C60B Item #01.
B $C60B,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C60F,$01 Colour: #INK(#PEEK(#PC)).
B $C611,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C612 Item #02.
B $C612,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C616,$01 Colour: #INK(#PEEK(#PC)).
B $C618,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C619,$01 Terminator.
N $C61A Furniture:
N $C61A Item #01.
B $C61A,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C61C,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C61D,$01 Colour: #INK(#PEEK(#PC)).
N $C61E Item #02.
B $C61E,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C620,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C621,$01 Colour: #INK(#PEEK(#PC)).
N $C622 Item #03.
B $C622,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C624,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C625,$01 Colour: #INK(#PEEK(#PC)).
N $C626 Item #04.
B $C626,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C628,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C629,$01 Colour: #INK(#PEEK(#PC)).
N $C62A Item #05.
B $C62A,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C62C,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C62D,$01 Colour: #INK(#PEEK(#PC)).
B $C62E,$01 Terminator.
N $C62F Lifts:
B $C62F,$01 Terminator.
N $C630 Disappearing floors:
B $C630,$01 Terminator.

g $C631 Data: Room #08
@ $C631 label=DataRoom08
D $C631 See #LINK:Rooms#room_08(Room #08).
N $C631 #HTML(<img alt="room-bare-08" src="../images/scr/room-bare-08.png">)
N $C631 The first seven bytes relate to the colours the room uses. See #R$AB44.
B $C631,$01 Key Colour: #INK(#PEEK(#PC)).
B $C632,$01 Closed Door Colour: #INK(#PEEK(#PC)).
B $C633,$01 Unused?: #INK(#PEEK(#PC)).
B $C634,$01 Scaffolding Colour: #INK(#PEEK(#PC)).
B $C635,$01 Border Colour: #INK(#PEEK(#PC)).
B $C636,$01 Paper Colour: #INK(#PEEK(#PC)).
B $C637,$01 Ladder Colour: #INK(#PEEK(#PC)).
B $C638,$01 Terminator.
N $C639 Room scaffolding:
N $C639 Scaffold #01.
B $C639,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C63B,$01 Length: #N(#PEEK(#PC)).
N $C63C Scaffold #02.
B $C63C,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C63E,$01 Length: #N(#PEEK(#PC)).
N $C63F Scaffold #03.
B $C63F,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C641,$01 Length: #N(#PEEK(#PC)).
N $C642 Scaffold #04.
B $C642,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C644,$01 Length: #N(#PEEK(#PC)).
N $C645 Scaffold #05.
B $C645,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C647,$01 Length: #N(#PEEK(#PC)).
B $C648,$01 Terminator.
N $C649 Doors:
N $C649 Door #01.
B $C649,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C64B,$01 Colour: #INK(#PEEK(#PC)).
B $C64C,$01 Leads to room: #N(#PEEK(#PC)).
N $C64D Door #02.
B $C64D,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C64F,$01 Colour: #INK(#PEEK(#PC)).
B $C650,$01 Leads to room: #N(#PEEK(#PC)).
N $C651 Door #03.
B $C651,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C653,$01 Colour: #INK(#PEEK(#PC)).
B $C654,$01 Leads to room: #N(#PEEK(#PC)).
B $C655,$01 Terminator.
N $C656 Ladders:
N $C656 Ladder #01.
B $C656,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C658 Ladder #02.
B $C658,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C65A Ladder #03.
B $C65A,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C65C,$01 Terminator.
N $C65D Keys and locked doors.
N $C65D Key/ Door #01.
B $C65D,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C660,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C663 Key/ Door #02.
B $C663,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C666,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C669 Key/ Door #03.
B $C669,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C66C,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C66F Key/ Door #04.
B $C66F,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C672,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C675 Key/ Door #05.
B $C675,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C678,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C67B Key/ Door #06.
B $C67B,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C67E,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C681,$01 Terminator.
N $C682 Portholes:
N $C682 Porthole #01.
B $C682,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C684,$01 UDG: #R($914C+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C685 Porthole #02.
B $C685,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C687,$01 UDG: #R($914C+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C688 Porthole #03.
B $C688,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C68A,$01 UDG: #R($914C+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C68B Porthole #04.
B $C68B,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C68D,$01 UDG: #R($914C+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C68E Porthole #05.
B $C68E,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C690,$01 UDG: #R($914C+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C691 Porthole #06.
B $C691,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C693,$01 UDG: #R($914C+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C694,$01 Terminator.
N $C695 Pirates:
B $C695,$01 Terminator.
N $C696 Items:
N $C696 Item #01.
B $C696,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C69A,$01 Colour: #INK(#PEEK(#PC)).
B $C69C,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C69D Item #02.
B $C69D,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C6A1,$01 Colour: #INK(#PEEK(#PC)).
B $C6A3,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C6A4 Item #03.
B $C6A4,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C6A8,$01 Colour: #INK(#PEEK(#PC)).
B $C6AA,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C6AB Item #04.
B $C6AB,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C6AF,$01 Colour: #INK(#PEEK(#PC)).
B $C6B1,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C6B2 Item #05.
B $C6B2,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C6B6,$01 Colour: #INK(#PEEK(#PC)).
B $C6B8,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C6B9 Item #06.
B $C6B9,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C6BD,$01 Colour: #INK(#PEEK(#PC)).
B $C6BF,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C6C0 Item #07.
B $C6C0,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C6C4,$01 Colour: #INK(#PEEK(#PC)).
B $C6C6,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C6C7 Item #08.
B $C6C7,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C6CB,$01 Colour: #INK(#PEEK(#PC)).
B $C6CD,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C6CE,$01 Terminator.
N $C6CF Furniture:
N $C6CF Item #01.
B $C6CF,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C6D1,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C6D2,$01 Colour: #INK(#PEEK(#PC)).
B $C6D3,$01 Terminator.
N $C6D4 Lifts:
B $C6D4,$01 Terminator.
N $C6D5 Disappearing floors:
B $C6D5,$01 Terminator.

g $C6D6 Data: Room #07
@ $C6D6 label=DataRoom07
D $C6D6 See #LINK:Rooms#room_07(Room #07).
N $C6D6 #HTML(<img alt="room-bare-07" src="../images/scr/room-bare-07.png">)
N $C6D6 The first seven bytes relate to the colours the room uses. See #R$AB44.
B $C6D6,$01 Key Colour: #INK(#PEEK(#PC)).
B $C6D7,$01 Closed Door Colour: #INK(#PEEK(#PC)).
B $C6D8,$01 Unused?: #INK(#PEEK(#PC)).
B $C6D9,$01 Scaffolding Colour: #INK(#PEEK(#PC)).
B $C6DA,$01 Border Colour: #INK(#PEEK(#PC)).
B $C6DB,$01 Paper Colour: #INK(#PEEK(#PC)).
B $C6DC,$01 Ladder Colour: #INK(#PEEK(#PC)).
B $C6DD,$01 Terminator.
N $C6DE Room scaffolding:
N $C6DE Scaffold #01.
B $C6DE,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C6E0,$01 Length: #N(#PEEK(#PC)).
N $C6E1 Scaffold #02.
B $C6E1,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C6E3,$01 Length: #N(#PEEK(#PC)).
N $C6E4 Scaffold #03.
B $C6E4,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C6E6,$01 Length: #N(#PEEK(#PC)).
N $C6E7 Scaffold #04.
B $C6E7,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C6E9,$01 Length: #N(#PEEK(#PC)).
N $C6EA Scaffold #05.
B $C6EA,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C6EC,$01 Length: #N(#PEEK(#PC)).
B $C6ED,$01 Terminator.
N $C6EE Doors:
N $C6EE Door #01.
B $C6EE,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C6F0,$01 Colour: #INK(#PEEK(#PC)).
B $C6F1,$01 Leads to room: #N(#PEEK(#PC)).
N $C6F2 Door #02.
B $C6F2,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C6F4,$01 Colour: #INK(#PEEK(#PC)).
B $C6F5,$01 Leads to room: #N(#PEEK(#PC)).
N $C6F6 Door #03.
B $C6F6,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C6F8,$01 Colour: #INK(#PEEK(#PC)).
B $C6F9,$01 Leads to room: #N(#PEEK(#PC)).
B $C6FA,$01 Terminator.
N $C6FB Ladders:
N $C6FB Ladder #01.
B $C6FB,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C6FD Ladder #02.
B $C6FD,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C6FF Ladder #03.
B $C6FF,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C701,$01 Terminator.
N $C702 Keys and locked doors.
N $C702 Key/ Door #01.
B $C702,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C705,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C708 Key/ Door #02.
B $C708,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C70B,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C70E Key/ Door #03.
B $C70E,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C711,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C714 Key/ Door #04.
B $C714,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C717,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C71A Key/ Door #05.
B $C71A,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C71D,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C720 Key/ Door #06.
B $C720,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C723,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C726,$01 Terminator.
N $C727 Portholes:
B $C727,$01 Terminator.
N $C728 Pirates:
N $C728 Pirate #01.
B $C728,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C738,$01 Terminator.
N $C739 Items:
N $C739 Item #01.
B $C739,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C73D,$01 Colour: #INK(#PEEK(#PC)).
B $C73F,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C740 Item #02.
B $C740,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C744,$01 Colour: #INK(#PEEK(#PC)).
B $C746,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C747 Item #03.
B $C747,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C74B,$01 Colour: #INK(#PEEK(#PC)).
B $C74D,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C74E Item #04.
B $C74E,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C752,$01 Colour: #INK(#PEEK(#PC)).
B $C754,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C755 Item #05.
B $C755,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C759,$01 Colour: #INK(#PEEK(#PC)).
B $C75B,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C75C Item #06.
B $C75C,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C760,$01 Colour: #INK(#PEEK(#PC)).
B $C762,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C763 Item #07.
B $C763,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C767,$01 Colour: #INK(#PEEK(#PC)).
B $C769,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C76A,$01 Terminator.
N $C76B Furniture:
N $C76B Item #01.
B $C76B,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C76D,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C76E,$01 Colour: #INK(#PEEK(#PC)).
N $C76F Item #02.
B $C76F,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C771,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C772,$01 Colour: #INK(#PEEK(#PC)).
N $C773 Item #03.
B $C773,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C775,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C776,$01 Colour: #INK(#PEEK(#PC)).
N $C777 Item #04.
B $C777,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C779,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C77A,$01 Colour: #INK(#PEEK(#PC)).
N $C77B Item #05.
B $C77B,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C77D,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C77E,$01 Colour: #INK(#PEEK(#PC)).
B $C77F,$01 Terminator.
N $C780 Lifts:
B $C780,$01 Terminator.
N $C781 Disappearing floors:
B $C781,$01 Terminator.

g $C782 Data: Room #06
@ $C782 label=DataRoom06
D $C782 See #LINK:Rooms#room_06(Room #06).
N $C782 #HTML(<img alt="room-bare-06" src="../images/scr/room-bare-06.png">)
N $C782 The first seven bytes relate to the colours the room uses. See #R$AB44.
B $C782,$01 Key Colour: #INK(#PEEK(#PC)).
B $C783,$01 Closed Door Colour: #INK(#PEEK(#PC)).
B $C784,$01 Unused?: #INK(#PEEK(#PC)).
B $C785,$01 Scaffolding Colour: #INK(#PEEK(#PC)).
B $C786,$01 Border Colour: #INK(#PEEK(#PC)).
B $C787,$01 Paper Colour: #INK(#PEEK(#PC)).
B $C788,$01 Ladder Colour: #INK(#PEEK(#PC)).
B $C789,$01 Terminator.
N $C78A Room scaffolding:
N $C78A Scaffold #01.
B $C78A,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C78C,$01 Length: #N(#PEEK(#PC)).
N $C78D Scaffold #02.
B $C78D,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C78F,$01 Length: #N(#PEEK(#PC)).
N $C790 Scaffold #03.
B $C790,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C792,$01 Length: #N(#PEEK(#PC)).
N $C793 Scaffold #04.
B $C793,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C795,$01 Length: #N(#PEEK(#PC)).
N $C796 Scaffold #05.
B $C796,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C798,$01 Length: #N(#PEEK(#PC)).
N $C799 Scaffold #06.
B $C799,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C79B,$01 Length: #N(#PEEK(#PC)).
N $C79C Scaffold #07.
B $C79C,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C79E,$01 Length: #N(#PEEK(#PC)).
B $C79F,$01 Terminator.
N $C7A0 Doors:
N $C7A0 Door #01.
B $C7A0,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C7A2,$01 Colour: #INK(#PEEK(#PC)).
B $C7A3,$01 Leads to room: #N(#PEEK(#PC)).
N $C7A4 Door #02.
B $C7A4,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C7A6,$01 Colour: #INK(#PEEK(#PC)).
B $C7A7,$01 Leads to room: #N(#PEEK(#PC)).
N $C7A8 Door #03.
B $C7A8,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C7AA,$01 Colour: #INK(#PEEK(#PC)).
B $C7AB,$01 Leads to room: #N(#PEEK(#PC)).
B $C7AC,$01 Terminator.
N $C7AD Ladders:
N $C7AD Ladder #01.
B $C7AD,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C7AF Ladder #02.
B $C7AF,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C7B1 Ladder #03.
B $C7B1,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C7B3,$01 Terminator.
N $C7B4 Keys and locked doors.
N $C7B4 Key/ Door #01.
B $C7B4,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C7B7,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C7BA Key/ Door #02.
B $C7BA,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C7BD,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C7C0 Key/ Door #03.
B $C7C0,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C7C3,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C7C6,$01 Terminator.
N $C7C7 Portholes:
B $C7C7,$01 Terminator.
N $C7C8 Pirates:
N $C7C8 Pirate #01.
B $C7C8,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C7D8,$01 Terminator.
N $C7D9 Items:
N $C7D9 Item #01.
B $C7D9,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C7DD,$01 Colour: #INK(#PEEK(#PC)).
B $C7DF,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C7E0 Item #02.
B $C7E0,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C7E4,$01 Colour: #INK(#PEEK(#PC)).
B $C7E6,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C7E7 Item #03.
B $C7E7,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C7EB,$01 Colour: #INK(#PEEK(#PC)).
B $C7ED,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C7EE Item #04.
B $C7EE,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C7F2,$01 Colour: #INK(#PEEK(#PC)).
B $C7F4,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C7F5 Item #05.
B $C7F5,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C7F9,$01 Colour: #INK(#PEEK(#PC)).
B $C7FB,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C7FC,$01 Terminator.
N $C7FD Furniture:
N $C7FD Item #01.
B $C7FD,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C7FF,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C800,$01 Colour: #INK(#PEEK(#PC)).
N $C801 Item #02.
B $C801,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C803,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C804,$01 Colour: #INK(#PEEK(#PC)).
N $C805 Item #03.
B $C805,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C807,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C808,$01 Colour: #INK(#PEEK(#PC)).
B $C809,$01 Terminator.
N $C80A Lifts:
B $C80A,$01 Terminator.
N $C80B Disappearing floors:
B $C80B,$01 Terminator.

g $C80C Data: Room #05
@ $C80C label=DataRoom05
D $C80C See #LINK:Rooms#room_05(Room #05).
N $C80C #HTML(<img alt="room-bare-05" src="../images/scr/room-bare-05.png">)
N $C80C The first seven bytes relate to the colours the room uses. See #R$AB44.
B $C80C,$01 Key Colour: #INK(#PEEK(#PC)).
B $C80D,$01 Closed Door Colour: #INK(#PEEK(#PC)).
B $C80E,$01 Unused?: #INK(#PEEK(#PC)).
B $C80F,$01 Scaffolding Colour: #INK(#PEEK(#PC)).
B $C810,$01 Border Colour: #INK(#PEEK(#PC)).
B $C811,$01 Paper Colour: #INK(#PEEK(#PC)).
B $C812,$01 Ladder Colour: #INK(#PEEK(#PC)).
B $C813,$01 Terminator.
N $C814 Room scaffolding:
N $C814 Scaffold #01.
B $C814,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C816,$01 Length: #N(#PEEK(#PC)).
N $C817 Scaffold #02.
B $C817,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C819,$01 Length: #N(#PEEK(#PC)).
N $C81A Scaffold #03.
B $C81A,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C81C,$01 Length: #N(#PEEK(#PC)).
N $C81D Scaffold #04.
B $C81D,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C81F,$01 Length: #N(#PEEK(#PC)).
N $C820 Scaffold #05.
B $C820,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C822,$01 Length: #N(#PEEK(#PC)).
B $C823,$01 Terminator.
N $C824 Doors:
N $C824 Door #01.
B $C824,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C826,$01 Colour: #INK(#PEEK(#PC)).
B $C827,$01 Leads to room: #N(#PEEK(#PC)).
N $C828 Door #02.
B $C828,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C82A,$01 Colour: #INK(#PEEK(#PC)).
B $C82B,$01 Leads to room: #N(#PEEK(#PC)).
N $C82C Door #03.
B $C82C,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C82E,$01 Colour: #INK(#PEEK(#PC)).
B $C82F,$01 Leads to room: #N(#PEEK(#PC)).
B $C830,$01 Terminator.
N $C831 Ladders:
N $C831 Ladder #01.
B $C831,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C833 Ladder #02.
B $C833,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C835 Ladder #03.
B $C835,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C837,$01 Terminator.
N $C838 Keys and locked doors.
N $C838 Key/ Door #01.
B $C838,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C83B,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C83E Key/ Door #02.
B $C83E,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C841,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C844 Key/ Door #03.
B $C844,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C847,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C84A Key/ Door #04.
B $C84A,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C84D,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C850 Key/ Door #05.
B $C850,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C853,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C856 Key/ Door #06.
B $C856,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C859,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C85C,$01 Terminator.
N $C85D Portholes:
B $C85D,$01 Terminator.
N $C85E Pirates:
B $C85E,$01 Terminator.
N $C85F Items:
N $C85F Item #01.
B $C85F,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C863,$01 Colour: #INK(#PEEK(#PC)).
B $C865,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C866 Item #02.
B $C866,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C86A,$01 Colour: #INK(#PEEK(#PC)).
B $C86C,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C86D Item #03.
B $C86D,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C871,$01 Colour: #INK(#PEEK(#PC)).
B $C873,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C874 Item #04.
B $C874,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C878,$01 Colour: #INK(#PEEK(#PC)).
B $C87A,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C87B Item #05.
B $C87B,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C87F,$01 Colour: #INK(#PEEK(#PC)).
B $C881,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C882 Item #06.
B $C882,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C886,$01 Colour: #INK(#PEEK(#PC)).
B $C888,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C889 Item #07.
B $C889,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C88D,$01 Colour: #INK(#PEEK(#PC)).
B $C88F,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C890,$01 Terminator.
N $C891 Furniture:
N $C891 Item #01.
B $C891,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C893,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C894,$01 Colour: #INK(#PEEK(#PC)).
N $C895 Item #02.
B $C895,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C897,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C898,$01 Colour: #INK(#PEEK(#PC)).
N $C899 Item #03.
B $C899,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C89B,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C89C,$01 Colour: #INK(#PEEK(#PC)).
N $C89D Item #04.
B $C89D,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C89F,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C8A0,$01 Colour: #INK(#PEEK(#PC)).
B $C8A1,$01 Terminator.
N $C8A2 Lifts:
B $C8A2,$01 Terminator.
N $C8A3 Disappearing floors:
N $C8A3 Instance #01.
B $C8A3,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C8A5,$01 Width: #N(#PEEK(#PC)).
B $C8A9,$01 Terminator.

g $C8AA Data: Room #04
@ $C8AA label=DataRoom04
D $C8AA See #LINK:Rooms#room_04(Room #04).
N $C8AA #HTML(<img alt="room-bare-04" src="../images/scr/room-bare-04.png">)
N $C8AA The first seven bytes relate to the colours the room uses. See #R$AB44.
B $C8AA,$01 Key Colour: #INK(#PEEK(#PC)).
B $C8AB,$01 Closed Door Colour: #INK(#PEEK(#PC)).
B $C8AC,$01 Unused?: #INK(#PEEK(#PC)).
B $C8AD,$01 Scaffolding Colour: #INK(#PEEK(#PC)).
B $C8AE,$01 Border Colour: #INK(#PEEK(#PC)).
B $C8AF,$01 Paper Colour: #INK(#PEEK(#PC)).
B $C8B0,$01 Ladder Colour: #INK(#PEEK(#PC)).
B $C8B1,$01 Terminator.
N $C8B2 Room scaffolding:
N $C8B2 Scaffold #01.
B $C8B2,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C8B4,$01 Length: #N(#PEEK(#PC)).
N $C8B5 Scaffold #02.
B $C8B5,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C8B7,$01 Length: #N(#PEEK(#PC)).
N $C8B8 Scaffold #03.
B $C8B8,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C8BA,$01 Length: #N(#PEEK(#PC)).
N $C8BB Scaffold #04.
B $C8BB,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C8BD,$01 Length: #N(#PEEK(#PC)).
N $C8BE Scaffold #05.
B $C8BE,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C8C0,$01 Length: #N(#PEEK(#PC)).
B $C8C1,$01 Terminator.
N $C8C2 Doors:
N $C8C2 Door #01.
B $C8C2,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C8C4,$01 Colour: #INK(#PEEK(#PC)).
B $C8C5,$01 Leads to room: #N(#PEEK(#PC)).
N $C8C6 Door #02.
B $C8C6,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C8C8,$01 Colour: #INK(#PEEK(#PC)).
B $C8C9,$01 Leads to room: #N(#PEEK(#PC)).
N $C8CA Door #03.
B $C8CA,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C8CC,$01 Colour: #INK(#PEEK(#PC)).
B $C8CD,$01 Leads to room: #N(#PEEK(#PC)).
B $C8CE,$01 Terminator.
N $C8CF Ladders:
N $C8CF Ladder #01.
B $C8CF,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C8D1 Ladder #02.
B $C8D1,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C8D3 Ladder #03.
B $C8D3,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C8D5 Ladder #04.
B $C8D5,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C8D7,$01 Terminator.
N $C8D8 Keys and locked doors.
N $C8D8 Key/ Door #01.
B $C8D8,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C8DB,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C8DE Key/ Door #02.
B $C8DE,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C8E1,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C8E4 Key/ Door #03.
B $C8E4,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C8E7,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C8EA Key/ Door #04.
B $C8EA,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C8ED,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C8F0 Key/ Door #05.
B $C8F0,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C8F3,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C8F6 Key/ Door #06.
B $C8F6,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C8F9,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C8FC,$01 Terminator.
N $C8FD Portholes:
B $C8FD,$01 Terminator.
N $C8FE Pirates:
N $C8FE Pirate #01.
B $C8FE,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C90E Pirate #02.
B $C90E,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C91E,$01 Terminator.
N $C91F Items:
N $C91F Item #01.
B $C91F,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C923,$01 Colour: #INK(#PEEK(#PC)).
B $C925,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C926 Item #02.
B $C926,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C92A,$01 Colour: #INK(#PEEK(#PC)).
B $C92C,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C92D Item #03.
B $C92D,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C931,$01 Colour: #INK(#PEEK(#PC)).
B $C933,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C934 Item #04.
B $C934,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C938,$01 Colour: #INK(#PEEK(#PC)).
B $C93A,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C93B Item #05.
B $C93B,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C93F,$01 Colour: #INK(#PEEK(#PC)).
B $C941,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C942 Item #06.
B $C942,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C946,$01 Colour: #INK(#PEEK(#PC)).
B $C948,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C949 Item #07.
B $C949,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C94D,$01 Colour: #INK(#PEEK(#PC)).
B $C94F,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C950 Item #08.
B $C950,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C954,$01 Colour: #INK(#PEEK(#PC)).
B $C956,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C957 Item #09.
B $C957,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C95B,$01 Colour: #INK(#PEEK(#PC)).
B $C95D,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C95E Item #10.
B $C95E,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C962,$01 Colour: #INK(#PEEK(#PC)).
B $C964,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C965,$01 Terminator.
N $C966 Furniture:
N $C966 Item #01.
B $C966,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C968,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C969,$01 Colour: #INK(#PEEK(#PC)).
N $C96A Item #02.
B $C96A,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C96C,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $C96D,$01 Colour: #INK(#PEEK(#PC)).
B $C96E,$01 Terminator.
N $C96F Lifts:
B $C96F,$01 Terminator.
N $C970 Disappearing floors:
B $C970,$01 Terminator.

g $C971 Data: Room #03
@ $C971 label=DataRoom03
D $C971 See #LINK:Rooms#room_03(Room #03).
N $C971 #HTML(<img alt="room-bare-03" src="../images/scr/room-bare-03.png">)
N $C971 The first seven bytes relate to the colours the room uses. See #R$AB44.
B $C971,$01 Key Colour: #INK(#PEEK(#PC)).
B $C972,$01 Closed Door Colour: #INK(#PEEK(#PC)).
B $C973,$01 Unused?: #INK(#PEEK(#PC)).
B $C974,$01 Scaffolding Colour: #INK(#PEEK(#PC)).
B $C975,$01 Border Colour: #INK(#PEEK(#PC)).
B $C976,$01 Paper Colour: #INK(#PEEK(#PC)).
B $C977,$01 Ladder Colour: #INK(#PEEK(#PC)).
B $C978,$01 Terminator.
N $C979 Room scaffolding:
N $C979 Scaffold #01.
B $C979,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C97B,$01 Length: #N(#PEEK(#PC)).
N $C97C Scaffold #02.
B $C97C,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C97E,$01 Length: #N(#PEEK(#PC)).
N $C97F Scaffold #03.
B $C97F,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C981,$01 Length: #N(#PEEK(#PC)).
N $C982 Scaffold #04.
B $C982,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C984,$01 Length: #N(#PEEK(#PC)).
N $C985 Scaffold #05.
B $C985,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C987,$01 Length: #N(#PEEK(#PC)).
B $C988,$01 Terminator.
N $C989 Doors:
N $C989 Door #01.
B $C989,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C98B,$01 Colour: #INK(#PEEK(#PC)).
B $C98C,$01 Leads to room: #N(#PEEK(#PC)).
N $C98D Door #02.
B $C98D,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C98F,$01 Colour: #INK(#PEEK(#PC)).
B $C990,$01 Leads to room: #N(#PEEK(#PC)).
N $C991 Door #03.
B $C991,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C993,$01 Colour: #INK(#PEEK(#PC)).
B $C994,$01 Leads to room: #N(#PEEK(#PC)).
B $C995,$01 Terminator.
N $C996 Ladders:
N $C996 Ladder #01.
B $C996,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C998 Ladder #02.
B $C998,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C99A Ladder #03.
B $C99A,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C99C,$01 Terminator.
N $C99D Keys and locked doors.
N $C99D Key/ Door #01.
B $C99D,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C9A0,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C9A3 Key/ Door #02.
B $C9A3,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C9A6,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C9A9 Key/ Door #03.
B $C9A9,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C9AC,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C9AF Key/ Door #04.
B $C9AF,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C9B2,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C9B5 Key/ Door #05.
B $C9B5,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C9B8,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C9BB Key/ Door #06.
B $C9BB,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C9BE,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $C9C1 Key/ Door #07.
B $C9C1,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C9C4,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C9C7,$01 Terminator.
N $C9C8 Portholes:
B $C9C8,$01 Terminator.
N $C9C9 Pirates:
N $C9C9 Pirate #01.
B $C9C9,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C9D9,$01 Terminator.
N $C9DA Items:
N $C9DA Item #01.
B $C9DA,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C9DE,$01 Colour: #INK(#PEEK(#PC)).
B $C9E0,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C9E1 Item #02.
B $C9E1,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C9E5,$01 Colour: #INK(#PEEK(#PC)).
B $C9E7,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C9E8 Item #03.
B $C9E8,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C9EC,$01 Colour: #INK(#PEEK(#PC)).
B $C9EE,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C9EF Item #04.
B $C9EF,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C9F3,$01 Colour: #INK(#PEEK(#PC)).
B $C9F5,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C9F6 Item #05.
B $C9F6,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $C9FA,$01 Colour: #INK(#PEEK(#PC)).
B $C9FC,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $C9FD Item #06.
B $C9FD,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CA01,$01 Colour: #INK(#PEEK(#PC)).
B $CA03,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $CA04 Item #07.
B $CA04,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CA08,$01 Colour: #INK(#PEEK(#PC)).
B $CA0A,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $CA0B,$01 Terminator.
N $CA0C Furniture:
N $CA0C Item #01.
B $CA0C,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CA0E,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $CA0F,$01 Colour: #INK(#PEEK(#PC)).
B $CA10,$01 Terminator.
N $CA11 Lifts:
B $CA11,$01 Terminator.
N $CA12 Disappearing floors:
B $CA12,$01 Terminator.

g $CA13 Data: Room #02
@ $CA13 label=DataRoom02
D $CA13 See #LINK:Rooms#room_02(Room #02).
N $CA13 #HTML(<img alt="room-bare-02" src="../images/scr/room-bare-02.png">)
N $CA13 The first seven bytes relate to the colours the room uses. See #R$AB44.
B $CA13,$01 Key Colour: #INK(#PEEK(#PC)).
B $CA14,$01 Closed Door Colour: #INK(#PEEK(#PC)).
B $CA15,$01 Unused?: #INK(#PEEK(#PC)).
B $CA16,$01 Scaffolding Colour: #INK(#PEEK(#PC)).
B $CA17,$01 Border Colour: #INK(#PEEK(#PC)).
B $CA18,$01 Paper Colour: #INK(#PEEK(#PC)).
B $CA19,$01 Ladder Colour: #INK(#PEEK(#PC)).
B $CA1A,$01 Terminator.
N $CA1B Room scaffolding:
N $CA1B Scaffold #01.
B $CA1B,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CA1D,$01 Length: #N(#PEEK(#PC)).
N $CA1E Scaffold #02.
B $CA1E,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CA20,$01 Length: #N(#PEEK(#PC)).
N $CA21 Scaffold #03.
B $CA21,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CA23,$01 Length: #N(#PEEK(#PC)).
N $CA24 Scaffold #04.
B $CA24,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CA26,$01 Length: #N(#PEEK(#PC)).
N $CA27 Scaffold #05.
B $CA27,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CA29,$01 Length: #N(#PEEK(#PC)).
B $CA2A,$01 Terminator.
N $CA2B Doors:
N $CA2B Door #01.
B $CA2B,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CA2D,$01 Colour: #INK(#PEEK(#PC)).
B $CA2E,$01 Leads to room: #N(#PEEK(#PC)).
N $CA2F Door #02.
B $CA2F,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CA31,$01 Colour: #INK(#PEEK(#PC)).
B $CA32,$01 Leads to room: #N(#PEEK(#PC)).
N $CA33 Door #03.
B $CA33,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CA35,$01 Colour: #INK(#PEEK(#PC)).
B $CA36,$01 Leads to room: #N(#PEEK(#PC)).
B $CA37,$01 Terminator.
N $CA38 Ladders:
N $CA38 Ladder #01.
B $CA38,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $CA3A Ladder #02.
B $CA3A,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $CA3C Ladder #03.
B $CA3C,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $CA3E Ladder #04.
B $CA3E,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CA40,$01 Terminator.
N $CA41 Keys and locked doors.
N $CA41 Key/ Door #01.
B $CA41,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CA44,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $CA47 Key/ Door #02.
B $CA47,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CA4A,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $CA4D Key/ Door #03.
B $CA4D,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CA50,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $CA53 Key/ Door #04.
B $CA53,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CA56,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $CA59 Key/ Door #05.
B $CA59,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CA5C,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $CA5F Key/ Door #06.
B $CA5F,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CA62,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $CA65 Key/ Door #07.
B $CA65,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CA68,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CA6B,$01 Terminator.
N $CA6C Portholes:
B $CA6C,$01 Terminator.
N $CA6D Pirates:
N $CA6D Pirate #01.
B $CA6D,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $CA7D Pirate #02.
B $CA7D,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CA8D,$01 Terminator.
N $CA8E Items:
N $CA8E Item #01.
B $CA8E,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CA92,$01 Colour: #INK(#PEEK(#PC)).
B $CA94,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $CA95 Item #02.
B $CA95,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CA99,$01 Colour: #INK(#PEEK(#PC)).
B $CA9B,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $CA9C Item #03.
B $CA9C,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CAA0,$01 Colour: #INK(#PEEK(#PC)).
B $CAA2,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $CAA3 Item #04.
B $CAA3,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CAA7,$01 Colour: #INK(#PEEK(#PC)).
B $CAA9,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $CAAA Item #05.
B $CAAA,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CAAE,$01 Colour: #INK(#PEEK(#PC)).
B $CAB0,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $CAB1 Item #06.
B $CAB1,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CAB5,$01 Colour: #INK(#PEEK(#PC)).
B $CAB7,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $CAB8 Item #07.
B $CAB8,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CABC,$01 Colour: #INK(#PEEK(#PC)).
B $CABE,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $CABF Item #08.
B $CABF,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CAC3,$01 Colour: #INK(#PEEK(#PC)).
B $CAC5,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $CAC6 Item #09.
B $CAC6,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CACA,$01 Colour: #INK(#PEEK(#PC)).
B $CACC,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $CACD,$01 Terminator.
N $CACE Furniture:
N $CACE Item #01.
B $CACE,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CAD0,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $CAD1,$01 Colour: #INK(#PEEK(#PC)).
N $CAD2 Item #02.
B $CAD2,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CAD4,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $CAD5,$01 Colour: #INK(#PEEK(#PC)).
B $CAD6,$01 Terminator.
N $CAD7 Lifts:
B $CAD7,$01 Terminator.
N $CAD8 Disappearing floors:
B $CAD8,$01 Terminator.

g $CAD9 Data: Room #01
@ $CAD9 label=DataRoom01
D $CAD9 See #LINK:Rooms#room_01(Room #01).
N $CAD9 #HTML(<img alt="room-bare-01" src="../images/scr/room-bare-01.png">)
N $CAD9 The first seven bytes relate to the colours the room uses. See #R$AB44.
B $CAD9,$01 Key Colour: #INK(#PEEK(#PC)).
B $CADA,$01 Closed Door Colour: #INK(#PEEK(#PC)).
B $CADB,$01 Unused?: #INK(#PEEK(#PC)).
B $CADC,$01 Scaffolding Colour: #INK(#PEEK(#PC)).
B $CADD,$01 Border Colour: #INK(#PEEK(#PC)).
B $CADE,$01 Paper Colour: #INK(#PEEK(#PC)).
B $CADF,$01 Ladder Colour: #INK(#PEEK(#PC)).
B $CAE0,$01 Terminator.
N $CAE1 Room scaffolding:
N $CAE1 Scaffold #01.
B $CAE1,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CAE3,$01 Length: #N(#PEEK(#PC)).
N $CAE4 Scaffold #02.
B $CAE4,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CAE6,$01 Length: #N(#PEEK(#PC)).
N $CAE7 Scaffold #03.
B $CAE7,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CAE9,$01 Length: #N(#PEEK(#PC)).
N $CAEA Scaffold #04.
B $CAEA,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CAEC,$01 Length: #N(#PEEK(#PC)).
N $CAED Scaffold #05.
B $CAED,$02 Start Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CAEF,$01 Length: #N(#PEEK(#PC)).
B $CAF0,$01 Terminator.
N $CAF1 Doors:
N $CAF1 Door #01.
B $CAF1,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CAF3,$01 Colour: #INK(#PEEK(#PC)).
B $CAF4,$01 Leads to room: #N(#PEEK(#PC)).
N $CAF5 Door #02.
B $CAF5,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CAF7,$01 Colour: #INK(#PEEK(#PC)).
B $CAF8,$01 Leads to room: #N(#PEEK(#PC)).
N $CAF9 Door #03.
B $CAF9,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CAFB,$01 Colour: #INK(#PEEK(#PC)).
B $CAFC,$01 Leads to room: #N(#PEEK(#PC)).
B $CAFD,$01 Terminator.
N $CAFE Ladders:
N $CAFE Ladder #01.
B $CAFE,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $CB00 Ladder #02.
B $CB00,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $CB02 Ladder #03.
B $CB02,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CB04,$01 Terminator.
N $CB05 Keys and locked doors.
N $CB05 Key/ Door #01.
B $CB05,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CB08,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $CB0B Key/ Door #02.
B $CB0B,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CB0E,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $CB11 Key/ Door #03.
B $CB11,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CB14,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $CB17 Key/ Door #04.
B $CB17,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CB1A,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $CB1D Key/ Door #05.
B $CB1D,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CB20,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $CB23 Key/ Door #06.
B $CB23,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CB26,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $CB29 Key/ Door #07.
B $CB29,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CB2C,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $CB2F Key/ Door #08.
B $CB2F,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CB32,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CB35,$01 Terminator.
N $CB36 Portholes:
B $CB36,$01 Terminator.
N $CB37 Pirates:
N $CB37 Pirate #01.
B $CB37,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
N $CB47 Pirate #02.
B $CB47,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CB57,$01 Terminator.
N $CB58 Items:
N $CB58 Item #01.
B $CB58,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CB5C,$01 Colour: #INK(#PEEK(#PC)).
B $CB5E,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $CB5F Item #02.
B $CB5F,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CB63,$01 Colour: #INK(#PEEK(#PC)).
B $CB65,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $CB66 Item #03.
B $CB66,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CB6A,$01 Colour: #INK(#PEEK(#PC)).
B $CB6C,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $CB6D Item #04.
B $CB6D,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CB71,$01 Colour: #INK(#PEEK(#PC)).
B $CB73,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $CB74 Item #05.
B $CB74,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CB78,$01 Colour: #INK(#PEEK(#PC)).
B $CB7A,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $CB7B Item #06.
B $CB7B,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CB7F,$01 Colour: #INK(#PEEK(#PC)).
B $CB81,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
N $CB82 Item #07.
B $CB82,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CB86,$01 Colour: #INK(#PEEK(#PC)).
B $CB88,$01 UDG: #R($8378+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $CB89,$01 Terminator.
N $CB8A Furniture:
N $CB8A Item #01.
B $CB8A,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CB8C,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $CB8D,$01 Colour: #INK(#PEEK(#PC)).
N $CB8E Item #02.
B $CB8E,$02 Coordinates: #N(#PEEK(#PC))/ #N(#PEEK(#PC+$01)).
B $CB90,$01 UDG: #R($8678+(#PEEK(#PC))*$08) (#N(#PEEK(#PC))).
B $CB91,$01 Colour: #INK(#PEEK(#PC)).
B $CB92,$01 Terminator.
N $CB93 Lifts:
B $CB93,$01 Terminator.
N $CB94 Disappearing floors:
B $CB94,$01 Terminator.

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

c $CD14 Game Entry Point
@ $CD14 label=GameEntryPoint
D $CD14 #HTML(Manually write "<code>JP #R$FE69</code>" at #R$FEFE.)
  $CD14,$03 #REGhl=#R$FEFE.
  $CD17,$03 #HTML(Write #N$C3, which is the opcode for the "<code>JP</code>" instruction to *#REGhl.)
  $CD1A,$01 Increment #REGhl by one.
  $CD1B,$03 Write #N$69 to *#REGhl.
  $CD1E,$01 Increment #REGhl by one.
  $CD1F,$03 Write #N$FE to *#REGhl.
N $CD22 All will become clear soon...
  $CD22,$03 #REGhl=#R$F400.
  $CD25,$03 #REGbc=#N($0104,$04,$04).
@ $CD28 label=WriteInterruptJumpAddress
  $CD28,$02 #REGa=#N$FE.
  $CD2A,$01 Write #REGa to *#REGhl.
  $CD2B,$01 Increment #REGhl by one.
  $CD2C,$01 Decrease #REGbc by one.
  $CD2D,$04 Jump to #R$CD28 until #REGbc is zero.
M $CD22,$0F Write #N$FE to #N($0104,$04,$04) bytes, starting from #R$F400.
  $CD31,$0F Write #N($0000,$04,$04) to: #LIST { *#R$FFFE } { *#R$FFFC } { *#R$FFFB } LIST#
  $CD40,$01 Disable interrupts.
  $CD41,$06 Write #R$FA00 to *#R$FFF9.
N $CD47 This sets interrupt mode #N$02; when the system generates an interrupt,
. it'll use the high-order byte set here, together with a low-order byte
. generated from the system to form a 16-bit address to jump to.
.
. As we've just set #N$FE to every address, this means that every generated
. interrupt will jump to #R$FEFE, which in turn will jump to #R$FE69.
  $CD47,$04 Set #N$F4 as the high-order byte in #REGi.
  $CD4B,$02 Set interrupt mode #N$02.
  $CD4D,$08 Write #N$03 to: #LIST { *#R$FFF7 } { *#R$FFF8 } LIST#
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
  $CD8B,$08 Call #R$CD6F if no control method has been set yet (as-in, game has just been loaded).
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
  $CDB3,$06 #HTML(Call #R$D602 if the timer held by <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/5C78.html">FRAMES</a> is up.)
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
N $CE44 Print the playing instructions.
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
  $CED9,$02 Copy #N($0064,$04,$04) bytes of data from *#R$A06C to *#R$DB46.
  $CEDB,$03 #REGhl=#R$A06C.
  $CEDE,$03 #REGde=#R$DBAA.
  $CEE1,$03 #REGbc=#N($0064,$04,$04).
  $CEE4,$02 Copy #N($0064,$04,$04) bytes of data from *#R$A06C to *#R$DBAA.
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
  $CF12,$06 #HTML(Write <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/3D00.html">#N$3C00</a> (CHARSET-#N$100) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
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
  $CFA8,$06 Set INK: BLACK (#N$00).
  $CFAE,$06 Set PAPER: CYAN (#N$05).
N $CFB4 Restore the default ZX Spectrum font.
  $CFB4,$06 #HTML(Write <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/3D00.html">#N$3C00</a> (CHARSET-#N$100) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $CFBA,$07 #HTML(Set up the screen buffer location #N$02/#N$1C using <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
N $CFC1 #HTML(Store *#R$DB42 in #REGbc so we can use <a href="https://skoolkid.github.io/rom/asm/1A1B.html">OUT_NUM_1</a> to print it to the screen.)
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
  $D021,$03 #REGc=Horizontal position (*#REGix+#N$00).
  $D024,$03 #REGb=Vertical position (*#REGix+#N$01).
  $D027,$03 #REGe=*#REGix+#N$07.
  $D02A,$03 #REGd=*#REGix+#N$08.
  $D02D,$07 Jump to #R$D035 if *#REGix+#N$02 is equal to #N$03.
  $D034,$01 Increment #REGe by one.
  $D035,$06 #HTML(Write #R$A06C(#N$9F6C) (#R$A06C) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
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
N $D08A When a new game starts, the players lives have already been set to #N$04 in #R$CD86.
N $D08A It's not clear when *#R$5BF1 will be set to #N$02#RAW(,) perhaps after completion of the Goldfish Game;
. see #R$CF36. Game modes #N$01 and #N$02 appear to be identical though.
  $D08A,$07 Jump to #R$D099 if *#R$5BF1 is equal to #N$04.
  $D091,$05 Write "Mystery Game Mode" (#N$02) to *#R$5BF0.
  $D096,$03 Jump to #R$D09E.
@ $D099 label=SetNormalGame
  $D099,$05 Write "Normal Game" (#N$01) to *#R$5BF0.
@ $D09E label=NewGame
  $D09E,$03 Call #R$DEA8.
N $D0A1 This looks as though the game might start the Goldfish Game if you reach here without losing all your lives?
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
@ $D260 label=GoldfishGame_Handler_Bubbles
  $D260,$04 #REGix=#R$DD2A.
  $D264,$02 #REGb=#N$05 (counter; maximum number of bubbles).
@ $D266 label=Handler_Bubbles_Loop
  $D266,$01 Stash the bubble counter on the stack.
  $D267,$08 Jump to #R$D2B1 if the bubble state (*#REGix+#N$0A) is inactive (#N$00).
N $D26F A bubble exists, so we need to redraw it in a new position. Hence, we erase it first here.
  $D26F,$06 Set INVERSE: ON
N $D275 Fetch the current co-ordinates.
  $D275,$03 #REGc=Horizontal position (*#REGix+#N$00).
  $D278,$03 #REGb=Vertical position (*#REGix+#N$01).
N $D27B Plot while using inverse will erase the bubble (it's only a single pixel).
  $D27B,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/22DC.html#22e5">PLOT_SUB</a>.)
N $D27E Prepare for drawing the new bubble.
  $D27E,$06 Set INVERSE: OFF
N $D284 Fetch the current co-ordinates.
  $D284,$03 #REGc=Horizontal position (*#REGix+#N$00).
  $D287,$03 #REGb=Vertical position (*#REGix+#N$01).
N $D28A Move the bubble to the new position.
N $D28A The bubble always moves "up" three pixels and accelerates to the right exponentially.
  $D28A,$03 Increment #REGc by three.
  $D28D,$03 #REGa=horizontal velocity (*#REGix+#N$05).
  $D290,$03 Increment the horizontal velocity (*#REGix+#N$05) by one to simulate acceleration.
  $D293,$02 #REGb+=the velocity value.
  $D295,$04 Jump to #R$D2AB if #REGa is higher than #N$70.
N $D299 Update the data table with the new co-ordinates.
  $D299,$03 Write #REGc to horizontal position (*#REGix+#N$00).
  $D29C,$03 Write #REGb to vertical position (*#REGix+#N$01).
N $D29F Draw the bubble to the screen buffer.
@ $D29F label=Handler_Bubbles_Plot
  $D29F,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/22DC.html#22e5">PLOT_SUB</a>.)
N $D2A2 Move onto the next bubble.
@ $D2A2 label=Handler_Bubbles_Next
  $D2A2,$01 Restore the bubble counter from the stack.
  $D2A3,$05 #REGix+=#N($000B,$04,$04).
  $D2A8,$02 Decrease the bubble counter by one and loop back to #R$D266 until all bubbles have been evaluated.
  $D2AA,$01 Return.
N $D2AB The bubble has finished its cycle so deactivate it.
@ $D2AB label=Handler_Bubbles_Deactivate
  $D2AB,$04 Write inactive (#N$00) to bubble state (*#REGix+#N$0A).
  $D2AF,$02 Jump to #R$D2A2.
N $D2B1 Decide if a new bubble should be created.
@ $D2B1 label=Handler_Bubbles_Generate
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
  $D2CE,$03 Write #REGa to horizontal position (*#REGix+#N$00).
  $D2D1,$01 #REGa=#REGb.
  $D2D2,$02 Decrease #REGa by two.
  $D2D4,$06 Shift #REGa left three positions (with carry).
  $D2DA,$04 Jump to #R$D2A2 if #REGa is higher than #N$70.
N $D2DE Active the bubble.
  $D2DE,$03 Write #REGa to horizontal position (*#REGix+#N$01).
  $D2E1,$04 Write "active" (#N$01) to bubble state (*#REGix+#N$0A).
  $D2E5,$04 Write #N$01 to the horizontal velocity (*#REGix+#N$05).
N $D2E9 Fetch the current co-ordinates, and jump to plot the new bubble on the screen.
  $D2E9,$03 #REGc=Horizontal position (*#REGix+#N$00).
  $D2EC,$03 #REGb=Vertical position (*#REGix+#N$01).
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
  $D343,$06 #HTML(Write #R$A06C(#N$9F6C) (#R$A06C) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $D349,$02 #REGa=#N$20.
  $D34B,$03 Call #R$D460.
  $D34E,$04 #HTML(Restore the previous character set pointer from the stack, and write it to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $D352,$01 Return.

c $D353 Goldfish Game: Print Colour UDG
@ $D353 label=GoldfishGame_PrintColourUDG
N $D353 Identical clone of #R$E6DC.
N $D353 Compare against the non-colour version at #R$A817.
R $D353 A Character to print
  $D353,$01 Switch to the shadow registers.
  $D354,$0F #REGde'=#REGa*#N$08.
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

c $D4C4 Goldfish Game: Move Player Right
@ $D4C4 label=GoldfishGame_PlayerMoveRight
  $D4C4,$03 Decrease *#REGix+#N$04 by one.
  $D4C7,$01 Return.

c $D4C8 Goldfish Game: Move Player Left
@ $D4C8 label=GoldfishGame_PlayerMoveLeft
  $D4C8,$03 Increment *#REGix+#N$04 by one.
  $D4CB,$01 Return.

c $D4CC
  $D4CC,$04 #REGix=#R$DC0E.
  $D4D0,$06 Set PAPER: BLUE (#N$01).
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

c $D579 Goldfish Game: Player Controls
@ $D579 label=GoldfishGame_PlayerControls
N $D579 See #R$ED35.
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
  $D5A9,$06 #HTML(Write <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/3D00.html">#N$3C00</a> (CHARSET-#N$100) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $D5AF,$01 Return.

c $D5B0 Toggle Music
@ $D5B0 label=ToggleMusic
N $D5B0 Mostly a clone of #R$ED7D.
  $D5B0,$07 Jump to #R$D5BF if *#R$FFF8 is equal to #N$00.
  $D5B7,$05 Write OFF (#N$00) to *#R$FFF8.
  $D5BC,$03 Jump to #R$D5D6.
@ $D5BF label=ToggleMusicOn
  $D5BF,$05 Write ON (#N$01) to *#R$FFF8.
  $D5C4,$03 Jump to #R$D5D6.

c $D5C7 Goldfish Game: Move Player Down
@ $D5C7 label=GoldfishGame_PlayerMoveDown
  $D5C7,$03 Decrease *#REGix+#N$05 by one.
  $D5CA,$01 Return.

c $D5CB Goldfish Game: Move Player Up
@ $D5CB label=GoldfishGame_PlayerMoveUp
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

c $D602 Demo Mode
@ $D602 label=DemoMode
  $D602,$01 Restore #REGbc from the stack.
  $D603,$05 Write "Demo Mode" (#N$03) to #R$5BF0.
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
  $D778,$06 Set PAPER: BLUE (#N$01).
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
  $D870,$05 Set INK: BLACK (#N$00).
  $D875,$06 Set PAPER: WHITE (#N$07).
N $D87B Graphics are created like fonts, they are 8x8 pixel UDG character blocks arranged sequentially into grids.
  $D87B,$06 #HTML(Write #R$99EC(#N$98EC) (#R$99EC) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
N $D881 Start fetching UDGs from #R$99EC.
  $D881,$02 #REGa=initial sprite ID: #N$20.
  $D883,$04 Print co-ordinates: #N$0F/ #N$18.
  $D887,$04 Width and height: #N$0C/ #N$08.
  $D88B,$03 Call #R$D460.
  $D88E,$06 #HTML(Write #R$9CEC(#N$9BEC) (#R$9CEC) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
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
  $D8E2,$06 Set PAPER: BLUE (#N$01).
  $D8E8,$06 #HTML(Write #R$DC22(#N$DB22) (#R$DC22) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $D8EE,$06 Set INK: YELLOW (#N$06).
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
N $DEA8 Perhaps the jump after the Golden Key is collected is incorrect (i.e. when the game is completed), and maybe
. game mode #N$02 was supposed to be used instead (it jumps to #R$DEBC). After all, the only difference is that it
. skips over setting the starting lives and resetting the booty count.
N $DEA8 Don't reset player lives or booty count.
  $DEA8,$08 Jump to #R$DEBC if *#R$5BF0 is set to "Mystery Game Mode" (#N$02).
N $DEB0 Initialise new Game State attributes.
  $DEB0,$05 Write #N$03 to *#R$5BF1.
  $DEB5,$07 Write #N($0000,$04,$04) to *#R$5BF4.
@ $DEBC label=InitialiseGameStates
  $DEBC,$04 Write #N$00 to *#R$5BD3.
  $DEC0,$07 Write #N($007D,$04,$04) to *#R$5BF2.
  $DEC7,$02 Jump to #R$DECE.
@ $DEC9 label=SetFirstRoom
  $DEC9,$05 Write #N$01 to *#R$5BD3.
N $DECE Initialise Player starting attributes.
@ $DECE label=InitialisePlayer
  $DECE,$03 #REGde=#R$F231.
  $DED1,$03 #REGhl=#R$F245.
  $DED4,$03 #REGbc=#N($0014,$04,$04).
  $DED7,$02 Copy #N($0014,$04,$04) bytes of data from #R$F245 to #R$F231.
M $DECE,$0B Copy #N($0014,$04,$04) bytes of data from #R$F245 to #R$F231.
  $DED9,$0B Write #N$00 to: #LIST { *#R$F33A } { *#R$F33F } { *#R$E479 } LIST#
  $DEE4,$05 Write #N$00 to *#R$F2DB.
  $DEE9,$0E #HTML(Write #N$00 to: #LIST
. { *#R$F31C }
. { *<a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/5C78.html">FRAMES</a> }
. { *<a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/5C78.html">FRAMES+#N$01</a> }
. { *#R$F340 }
. LIST#)
N $DEF7 This also draws the whole room.
  $DEF7,$03 Call #R$E0A9.
N $DEFA Restore the default ZX Spectrum font.
  $DEFA,$06 #HTML(Write <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/3D00.html">#N$3C00</a>
. (CHARSET-#N$100) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $DF00,$06 Set INK: YELLOW (#N$06).
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
  $DF2F,$08 Call #R$EBD8 if *#R$5BF0 is not set to "Demo Mode" (#N$03).
  $DF37,$03 Call #R$E4F1.
  $DF3A,$07 Jump to #R$DF45 if *#R$E820 is equal to #N$00.
  $DF41,$01 Decrease #REGa by one.
  $DF42,$03 Write #REGa to *#R$E820.
  $DF45,$08 Call #R$E30B if *#R$5BEA is set to Kempston joystick (#N$0C).
  $DF4D,$08 Call #R$ED35 if *#R$5BEA is not set to Kempston joystick (#N$0C).
  $DF55,$03 Call #R$E5F4.
  $DF58,$03 Call #R$E581.
N $DF5B Display the currently carried key.
N $DF5B Set attributes.
  $DF5B,$06 Set INK: YELLOW (#N$06).
  $DF61,$07 Set PAPER: *#R$5BD0.
  $DF68,$07 #HTML(Set up the screen buffer location #N$1B/#N$01 using <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
N $DF6F Restore the default ZX Spectrum font.
  $DF6F,$06 #HTML(Write <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/3D00.html">#N$3C00</a> (CHARSET-#N$100) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $DF75,$04 #REGix=#R$F231.
  $DF79,$03 #REGa=*#REGix+#N$10.
  $DF7C,$02 #REGa+=#N$30.
  $DF7E,$03 Call #R$E6DC.
  $DF81,$04 #REGbc=*#R$5BF2.
  $DF85,$05 Call #R$DFD3 if #REGbc is zero.
  $DF8A,$08 Jump to #R$DF13 if *#R$5BF0 is not set to "Demo Mode" (#N$03).
  $DF92,$08 #HTML(Jump to #R$DF13 if *<a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/5C78.html">FRAMES+#N$01</a> is not equal to #N$03.)
  $DF9A,$07 Increment *#R$F340 by one.
  $DFA1,$05 Call #R$ED8F if #REGa is equal to #N$02.
  $DFA6,$03 Call #R$E349.
  $DFA9,$02,b$01 Keep only bits 0-3.
  $DFAB,$02 #REGa+=#N$02.
  $DFAD,$03 Call #R$EE84.
  $DFB0,$08 #HTML(Write #N$00 to: #LIST
. { *<a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/5C78.html">FRAMES</a> }
. { *<a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/5C78.html">FRAMES+#N$01</a> }
. LIST#)
  $DFB8,$03 Jump to #R$DF13.

b $DFBB Graphics: Golden Key
@ $DFBB label=Graphics_GoldenKey
  $DFBB,$10,$08 #UDGTABLE { #UDGS$01,$02,$04(golden-key)(#UDG(#PC+$08*$y,attr=$06)(*golden-key)golden-key) } UDGTABLE#

c $DFCB Force Game-Over
@ $DFCB label=ForceGameOver
  $DFCB,$05 Write #N$00 to #R$5BF1.
  $DFD0,$03 Jump to #R$E3A4.

c $DFD3 All Treasure Collected
N $DFD3 Restore the default ZX Spectrum font.
@ $DFD3 label=AllTreasureCollected
  $DFD3,$06 #HTML(Write <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/3D00.html">#N$3C00</a> (CHARSET-#N$100) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
N $DFD9 Set the attributes.
  $DFD9,$06 Set INK: WHITE (#N$07).
  $DFDF,$07 Set PAPER: *#R$5BD1.
N $DFE6 Don't decrease *#R$5BFF every frame, we track a count of the frames and only decrease it every 20th frame.
  $DFE6,$09 Decrease *#R$5BFA by one.
  $DFEF,$04 Skip to #R$E004 if *#R$5BFA is not yet zero.
N $DFF3 #N$14 frames have passed, so decrease the actual timer and check that it hasn't expired yet.
  $DFF3,$07 Reset *#R$5BFA back to #N($0014,$04,$04).
  $DFFA,$07 Decrease *#R$5BFF by one.
N $E001 Player lives don't matter with the Golden Key section of the game, once the timer expires it's Game Over.
  $E001,$03 Jump to #R$DFCB if *#R$5BFF is zero.
N $E004 Display the Golden Key timer.
@ $E004 label=DisplayGoldenKeyTimer
  $E004,$07 #HTML(Set up the screen buffer location #N$0C/#N$02 using <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
N $E00B #HTML(Store *#R$5BFF in #REGbc so we can use <a href="https://skoolkid.github.io/rom/asm/1A1B.html">OUT_NUM_1</a> to print it to the screen.)
  $E00B,$06 #REGbc=*#R$5BFF.
  $E011,$03 #HTML(Call <a href="https://skoolkid.github.io/rom/asm/1A1B.html">OUT_NUM_1</a>.)
N $E014 The ASCII space after the timer acts to clear "extra" digits when the timer transitions to being single digit.
  $E014,$02 #REGa=ASCII "space" (#N$20).
  $E016,$03 Call #R$E6DC.
N $E019 Is the Golden Key in the current room?
  $E019,$08 Return if *#R$5BD3 is not equal to *#R$5BFC.
N $E021 It is in this room, so display it.
  $E021,$04 #REGbc=*#R$5BFD.
  $E025,$06 #HTML(Write #R$DFBB(#N$DEBB) (#R$DFBB) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $E02B,$06 Set INK: YELLOW (#N$06).
  $E031,$02 #REGa=#N$20 (base sprite ID).
  $E033,$03 #REGde=Set the sprite width/ height (#N$02/ #N$01).
  $E036,$03 Call #R$EA93.
N $E039 Handle player collision with the Golden Key.
  $E039,$04 #REGix=#R$F231.
  $E03D,$04 #REGbc=*#R$5BFD.
  $E041,$05 Return if the players horizontal co-ordinate is not equal to the Golden Key horizontal co-ordinate.
  $E046,$05 Return if the players vertical co-ordinate is not equal to the Golden Key vertical co-ordinate.
N $E04B The player has collected the Golden Key!
N $E04B Hilariously, just beep at the player and restart the game. Zero fanfare!
  $E04B,$03 #REGde=#N($00C8,$04,$04).
  $E04E,$03 #REGhl=#N($00C8,$04,$04).
  $E051,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/03B5.html">BEEPER</a>.)
  $E054,$01 Restore #REGbc from the stack.
  $E055,$03 Jump to #R$DEBC.

c $E058
  $E058,$03 #REGhl=#R$A06C.
  $E05B,$03 #REGde=#R$FFFB.
  $E05E,$03 #REGbc=#N($0064,$04,$04).
  $E061,$02 Copy #N($0064,$04,$04) bytes of data from *#R$A06C to *#R$FFFB.
  $E063,$01 Return.

c $E064 Print Status Bar Icons
@ $E064 label=PrintStatusBarIcons
  $E064,$06 #HTML(Write #R$F25B(#N$F15B) (#R$F25B) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
N $E06A Set up the screen buffer position.
  $E06A,$07 #HTML(Set up the screen buffer location #N$01/#N$21 using <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
N $E071 Skip showing any lives if the player is using their last life.
  $E071,$07 Jump to #R$E080 if *#R$5BF1 is equal to #N$00.
N $E078 Display a life icon for each life the player has.
N $E078 #HTML(<img alt="life" src="../images/udgs/life.png">)
  $E078,$01 #REGb=#R$5BF1 (number of lives counter).
@ $E079 label=PrintLifeIcon_Loop
  $E079,$02 #REGa=Player life icon (#N$21).
  $E07B,$03 Call #R$E6DC.
  $E07E,$02 Decrease lives counter by one and loop back to #R$E079 until all lives have been printed.
N $E080 Put a space between the lives and the key icon.
N $E080 Restore the default ZX Spectrum font.
@ $E080 label=PrintKeyIcon
  $E080,$06 #HTML(Write <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/3D00.html">#N$3C00</a> (CHARSET-#N$100) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $E086,$02 #REGa=ASCII "space" (#N$20).
  $E088,$03 Call #R$E6DC.
N $E08B Set up the screen buffer position.
  $E08B,$07 #HTML(Set up the screen buffer location #N$01/#N$1D using <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $E092,$06 #HTML(Write #R$F25B(#N$F15B) (#R$F25B) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
N $E098 Display the key icon.
N $E098 #HTML(<img alt="key" src="../images/udgs/key.png">)
  $E098,$02 #REGa=Key icon left (#N$22).
  $E09A,$03 Call #R$E6DC.
  $E09D,$02 #REGa=Key icon right (#N$23).
  $E09F,$03 Call #R$E6DC.
N $E0A2 Restore the default ZX Spectrum font.
  $E0A2,$06 #HTML(Write <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/3D00.html">#N$3C00</a> (CHARSET-#N$100) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
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
N $E0D9 #HTML(Store *#R$5BF4 in #REGbc so we can use <a href="https://skoolkid.github.io/rom/asm/1A1B.html">OUT_NUM_1</a> to print it to the screen.)
  $E0D9,$04 #REGbc=*#R$5BF4.
  $E0DD,$03 #HTML(Call <a href="https://skoolkid.github.io/rom/asm/1A1B.html">OUT_NUM_1</a>.)
N $E0E0 Prints the "Treasure" count.
  $E0E0,$07 #HTML(Set up the screen buffer location #N$01/#N$05 using <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
N $E0E7 #HTML(Store *#R$5BF2 in #REGbc so we can use <a href="https://skoolkid.github.io/rom/asm/1A1B.html">OUT_NUM_1</a> to print it to the screen.)
  $E0E7,$04 #REGbc=*#R$5BF2.
  $E0EB,$03 #HTML(Call <a href="https://skoolkid.github.io/rom/asm/1A1B.html">OUT_NUM_1</a>.)
  $E0EE,$03 Call #R$E064.
  $E0F1,$06 Return if *#R$5BF2 is not equal to #N$00.
@ $E0F7 label=PrintFindTheGoldKey
  $E0F7,$06 Set INK: WHITE (#N$07).
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

c $E11F Increased Frequency Animals Event Timing
@ $E11F label=IncreasedFrequencyAnimalsEventTiming
  $E11F,$0A #HTML(Jump to #R$E13C if
. *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C78.html">FRAMES</a>
. is higher than #N$0352.)
  $E129,$01 Else, return.

c $E12A Animals Event Timing
@ $E12A label=AnimalsEventTiming
N $E12A *#R$5BF4 starts at #N($0000,$04,$04) and counts up for every item of
. booty collected.
. This means that, the chance that animals appear increases when the player has
. collected over 100 items (of booty, not treasure - which counts down from #N($007D,$04,$04)).
  $E12A,$09 If the player has collected over 100 items of booty (in *#R$5BF4) then jump to #R$E11F.
  $E133,$09 #HTML(Return if
. *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C78.html">FRAMES</a>
. is lower than #N$0578.)
N $E13C #HTML(Use <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/5C78.html">FRAMES</a> as a counter.)
@ $E13C label=StartAnimalsEvent
  $E13C,$06 #HTML(Reset
. *<a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/5C78.html">FRAMES</a>
. to #N($0000,$04,$04) to start a new event cycle.)
  $E142,$03 Call #R$E349.
  $E145,$02,b$01 Ensure the random number is between #N$00 and #N$03.
  $E147,$07 #REGhl=#R$F317+the random number.
  $E14E,$01 Stash #REGhl on the stack.
  $E14F,$01 Increment #REGhl by one.
  $E150,$01 #REGa=*#REGhl.
  $E151,$04 #REGix=#R$5BDA.
  $E155,$01 #REGb=#REGa.
  $E156,$07 Jump to #R$E172 if *#REGix+#N$00 is equal to #N$FF.
  $E15D,$06 Jump to #R$E16B if *#REGix+#N$01 is not equal to #REGb.
  $E163,$08 Jump to #R$E118 if *#REGix+#N$05 is not equal to #N$00.
  $E16B,$05 #REGix+=#N($0006,$04,$04).
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

c $E22D Handler: Animals
@ $E22D label=Handler_Animals
  $E22D,$04 #REGix=#R$F31C.
  $E231,$08 Jump to #R$E12A if *#REGix+#N$00 is equal to #N$00.
  $E239,$06 #HTML(Write #R$944C(#N$934C) (#R$944C) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
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
  $E2D5,$04 Shift #REGa left two positions (with carry).
  $E2D9,$01 #REGb=#REGa.
  $E2DA,$03 #REGc=*#REGix+#N$00.
  $E2DD,$04 #REGd=*#R$F233.
  $E2E1,$01 #REGa=#REGc.
  $E2E2,$04 Shift #REGa left two positions (with carry).
  $E2E6,$04 #REGc=#REGa+*#REGix+#N$02.
  $E2EA,$03 #REGa=*#R$F231.
  $E2ED,$03 #REGa+=*#REGix+#N$07.
  $E2F0,$02 Shift #REGa left (with carry).
  $E2F2,$02 Shift #REGa left (with carry).
  $E2F4,$01 #REGa+=#REGd.
  $E2F5,$01 Decrease #REGa by one.
  $E2F6,$01 #REGa-=#REGc.
N $E2F7 See #POKE#immuneBirdsRats(Immune To Birds & Rats).
  $E2F7,$02 Return if #REGa is higher than #REGb.
  $E2F9,$05 Write #N$01 to *#R$FFFE.
  $E2FE,$03 Jump to #R$E3A4.
  $E301,$04 Write #N$00 to *#REGix+#N$00.
  $E305,$05 Write #N$00 to *#R$FFFF.
  $E30A,$01 Return.

c $E30B Player Controls Kempston
@ $E30B label=PlayerControls_Kempston
  $E30B,$04 #REGix=#R$F231.
  $E30F,$07 Jump to #R$E31E if *#R$5BF0 is not set to "Demo Mode" (#N$03).
  $E316,$02 Read from the Kempston joystick port.
  $E318,$02,b$01 Keep only bits 0-4.
  $E31A,$03 Jump to #R$ED8F if the result is not zero.
  $E31D,$01 Return.
N $E31E The control is stored at *#R$F342 but does not appear to be referenced again outside of this routine.
@ $E31E label=Check_PlayerControls_Kempston
  $E31E,$02 Read from the Kempston joystick port.
  $E320,$03 Write #REGa to *#R$F342.
N $E323 Check for "fire".
  $E323,$02,b$01 Keep only bit 4.
  $E325,$03 Jump to #R$EE5B if the result is not zero.
N $E328 Check for "right".
  $E328,$03 #REGa=*#R$F342.
  $E32B,$02,b$01 Keep only bit 0.
  $E32D,$03 Jump to #R$EB05 if the result is not zero.
N $E330 Check for "left".
  $E330,$03 #REGa=*#R$F342.
  $E333,$02,b$01 Keep only bit 1.
  $E335,$03 Jump to #R$EB49 if the result is not zero.
N $E338 Check for "down".
  $E338,$03 #REGa=*#R$F342.
  $E33B,$02,b$01 Keep only bit 2.
  $E33D,$03 Jump to #R$ED9A if the result is not zero.
N $E340 Check for "up".
  $E340,$03 #REGa=*#R$F342.
  $E343,$02,b$01 Keep only bit 3.
  $E345,$03 Jump to #R$EE08 if the result is not zero.
N $E348 No controls were pressed, just return.
  $E348,$01 Return.

c $E349 Get Random Number
@ $E349 label=GetRandomNumber
N $E349 (((#REGb + #REGc) % #N$100 + #N$AB) % #N$100) * #N$100 + (#REGc + #N$CD) % #N$100
R $E349 O:A The random number
  $E349,$01 Stash #REGbc on the stack.
  $E34A,$04 #REGbc=*#R$F343.
  $E34E,$01 Reset the flags.
  $E34F,$03 #REGb=#REGb+#REGc.
  $E352,$01 Reset the flags.
  $E353,$04 #REGc=#N$CD+#REGc.
  $E357,$04 #REGb+=#N$AB.
  $E35B,$04 Write the updated #REGbc backit  to *#R$F343.
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
N $E3A4 Lose A Life
N $E3A4 This entry point is used by the routines at #R$DEA8, #R$E22D, #R$EBD8 and #R$F001.
@ $E3A4 label=LoseLife
  $E3A4,$05 Write #N$01 to *#R$FFFB.
  $E3A9,$01 Restore #REGbc from the stack.
  $E3AA,$03 #REGhl=#N($0064,$04,$04).
  $E3AD,$03 #REGde=#N($00C8,$04,$04).
  $E3B0,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/03B5.html">BEEPER</a>.)
N $E3B3 See #POKE#infiniteLives(Infinite Lives).
  $E3B3,$07 Decrease *#R$5BF1 by one.
  $E3BA,$05 Call #R$ED8F is *#R$5BF1 is equal to #N$FF.
N $E3BF See #POKE#dontGoBackStart(Don't Go Back To Start)
  $E3BF,$03 Jump to #R$DEC9.
  $E3C2,$03 Call #R$E349.
  $E3C5,$03 Return if #REGa is higher than #N$40.
N $E3C8 See #POKE#bombsDontExplode(Bombs Don't Explode).
  $E3C8,$06 Return if *#R$E479 is not equal to #N$00.
  $E3CE,$05 Write #N$20 to *#R$E475.
  $E3D3,$04 Write #REGbc to *#R$E46F.
  $E3D7,$08 Write #N$01 to: #LIST { *#R$E479 } { *#R$FFFD } LIST#
  $E3DF,$01 Return.

c $E3E0 Handler: Explosion
@ $E3E0 label=Handler_Explosion
  $E3E0,$06 Return if *#R$F2DB is equal to #N$00.
  $E3E6,$04 #REGix=#R$F2DB.
  $E3EA,$06 #HTML(Write #R$F25B(#N$F15B) (#R$F25B) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $E3F0,$06 Set INK: WHITE (#N$07).
  $E3F6,$02 #REGb=#N$05 (five "sparks").
@ $E3F8 label=Handler_Explosion_Loop
  $E3F8,$01 Stash the sparks counter on the stack.
  $E3F9,$03 #REGb=*#REGix+#N$01.
  $E3FC,$03 #REGde=Set the sprite width/ height (#N$01/ #N$01).
  $E3FF,$03 #REGc=*#REGix+#N$00.
  $E402,$05 Jump to #R$E412 if #REGc is higher than #N$22.
  $E407,$04 Jump to #R$E412 if #REGc is lower than #N$02.
  $E40B,$02 Stash #REGbc and #REGde on the stack.
  $E40D,$03 Call #R$E787.
  $E410,$02 Restore #REGde and #REGbc from the stack.
  $E412,$05 #REGb+=*#REGix+#N$03.
  $E417,$05 #REGc+=*#REGix+#N$02.
  $E41C,$03 Increment *#REGix+#N$05 by one.
  $E41F,$07 Jump to #R$E464 if *#REGix+#N$05 is equal to #N$04.
  $E426,$05 Jump to #R$E45B if #REGc is higher than #N$22.
  $E42B,$04 Jump to #R$E45B if #REGc is lower than #N$02.
  $E42F,$03 Write #REGc to *#REGix+#N$00.
  $E432,$03 Write #REGb to *#REGix+#N$01.
  $E435,$03 #REGde=Set the sprite width/ height (#N$01/ #N$01).
  $E438,$02 #REGa=Sprite ID (#N$20).
  $E43A,$03 Call #R$EA93.
  $E43D,$03 #REGb=*#REGix+#N$01.
  $E440,$03 #REGa=*#R$F232.
  $E443,$01 #REGa-=#REGb.
  $E444,$04 Jump to #R$E45B if #REGa is higher than #N$02.
  $E448,$03 #REGc=*#REGix+#N$00.
  $E44B,$03 #REGa=*#R$F231.
  $E44E,$01 #REGa-=#REGc.
  $E44F,$04 Jump to #R$E45B if #REGa is higher than #N$02.
  $E453,$05 Write #N$03 to *#R$FFFE.
  $E458,$03 Jump to #R$E3A3.
@ $E45B label=Handler_Explosion_Next
  $E45B,$05 #REGix+=#N($0006,$04,$04).
  $E460,$01 Restore sparks counter from the stack.
  $E461,$02 Decrease sparks counter by one and loop back to #R$E3F8 until counter is zero.
  $E463,$01 Return.
N $E464 This spark has run its course, remove it.
@ $E464 label=Handler_Explosion_Housekeep
  $E464,$04 Write #N$00 to *#REGix+#N$00.
  $E468,$05 Write #N$00 to *#R$FFFD.
  $E46D,$02 Jump to #R$E45B.

g $E46F Table: Bomb
@ $E46F label=TableBomb_Position
B $E46F,$02
B $E471,$01
B $E472,$01
B $E473,$01
B $E474,$01
@ $E475 label=TableBomb_SpriteID
B $E475,$01
B $E476,$01
B $E477,$01
B $E478,$01
@ $E479 label=TableBomb_Flag
B $E479,$01

c $E47A Handler: Bomb
@ $E47A label=Handler_Bomb
  $E47A,$06 Return if *#R$E479 is equal to #N$00.
N $E480 Only continue every other frame.
  $E480,$03 #REGa=*#R$F341.
  $E483,$01 Increment #REGa by one.
  $E484,$02,b$01 Ensure #REGa is only ever #N$00 or #N$01.
  $E486,$03 Write #REGa back to *#R$F341.
  $E489,$03 Return if #REGa is not equal to #N$00.
N $E48C Set up the bomb.
  $E48C,$06 #HTML(Write #R$934C(#N$924C) (#R$934C) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $E492,$06 Set INK: YELLOW (#N$06).
N $E498 The fuse burning down acts as a countdown before the explosion.
  $E498,$03 #REGa=*#R$E475.
  $E49B,$02 #REGa+=#N$04.
  $E49D,$04 Jump to #R$E4AF if #REGa is equal to #N$40.
  $E4A1,$03 Write the new frame ID back to *#R$E475.
N $E4A4 Print the bomb on the screen.
  $E4A4,$04 #REGbc=*#R$E46F.
  $E4A8,$03 #REGde=Set the sprite width/ height (#N$02/ #N$02).
  $E4AB,$03 Call #R$EA93.
  $E4AE,$01 Return.
N $E4AF The bomb has been lit!
@ $E4AF label=IgniteBomb
  $E4AF,$04 #REGbc=*#R$E46F.
  $E4B3,$03 #REGde=Set the sprite width/ height (#N$02/ #N$02).
  $E4B6,$03 Call #R$E787.
  $E4B9,$08 Write #N$00 to: #LIST { *#R$FFFD } { *#R$E479 } LIST#
  $E4C1,$06 Return if an explosion is already in-progress, only one bomb can explode at a time.
N $E4C7 There are #N$05 sparks, and each occupies #N$06 bytes.
  $E4C7,$0B Copy #N($001E,$04,$04) bytes of data from #R$F2F9 to #R$F2DB.
  $E4D2,$04 #REGbc=*#R$E46F.
  $E4D6,$01 Move down one line.
N $E4D7 Update each spark with the starting co-ordinates.
  $E4D7,$04 #REGix=#R$F2DB.
  $E4DB,$02 #REGl=#N$05 (counter; number of sparks).
@ $E4DD label=SetSparksStartingPosition
  $E4DD,$03 Write #REGc to *#REGix+#N$00.
  $E4E0,$03 Write #REGb to *#REGix+#N$01.
  $E4E3,$05 #REGix+=#N($0006,$04,$04).
  $E4E8,$01 Decrease spark counter by one.
  $E4E9,$02 Jump to #R$E4DD until all sparks have been processed.
  $E4EB,$05 Write #N$02 to *#R$FFFD.
  $E4F0,$01 Return.

c $E4F1
  $E4F1,$04 #REGix=#R$5BE4.
  $E4F5,$06 Return if *#REGix+#N$00 is equal to #N$FF.
  $E4FB,$07 Jump to #R$E531 if *#REGix+#N$05 is equal to #N$00.
  $E502,$03 #REGc=*#REGix+#N$00.
  $E505,$03 #REGb=*#REGix+#N$01.
  $E508,$07 Jump to #R$E547 if *#REGix+#N$03 is equal to #N$03.
  $E50F,$04 Jump to #R$E538 if *#REGix+#N$03 is equal to #N$02.
  $E513,$04 Jump to #R$E554 if *#REGix+#N$03 is equal to #N$01.
  $E517,$01 Decrease #REGb by one.
  $E518,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $E51B,$02 #REGd=#N$04.
  $E51D,$03 #REGb=*#REGix+#N$07.
  $E520,$02 #REGa=#N$FF.
  $E522,$03 #HTML(#REGhl=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C84.html">DF_CC</a>.)
  $E525,$01 Increment #REGh by one.
  $E526,$03 #HTML(Write #REGhl to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C84.html">DF_CC</a>.)
  $E529,$01 Decrease #REGh by one.
  $E52A,$01 Write #REGa to *#REGhl.
  $E52B,$01 Increment #REGhl by one.
  $E52C,$02 Decrease counter by one and loop back to #R$E52A until counter is zero.
  $E52E,$01 Decrease #REGd by one.
  $E52F,$02 Jump to #R$E51D until #REGd is zero.
  $E531,$05 #REGix+=#N($0010,$04,$04).
  $E536,$02 Jump to #R$E4F5.
  $E538,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $E53B,$03 #HTML(#REGhl=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C84.html">DF_CC</a>.)
  $E53E,$04 Increment #REGh by four.
  $E542,$03 #HTML(Write #REGhl to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C84.html">DF_CC</a>.)
  $E545,$02 Jump to #R$E51B.
  $E547,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $E54A,$03 #HTML(#REGhl=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C84.html">DF_CC</a>.)
  $E54D,$02 Increment #REGh by two.
  $E54F,$03 #HTML(Write #REGhl to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C84.html">DF_CC</a>.)
  $E552,$02 Jump to #R$E51B.
  $E554,$01 Stash #REGbc on the stack.
  $E555,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $E558,$03 #HTML(#REGhl=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C84.html">DF_CC</a>.)
  $E55B,$04 #REGh+=#N$06.
  $E55F,$03 #HTML(Write #REGhl to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C84.html">DF_CC</a>.)
  $E562,$02 #REGd=#N$02.
  $E564,$03 #HTML(#REGhl=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C84.html">DF_CC</a>.)
  $E567,$01 Increment #REGh by one.
  $E568,$03 #HTML(Write #REGhl to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C84.html">DF_CC</a>.)
  $E56B,$01 Decrease #REGh by one.
  $E56C,$02 #REGa=#N$FF.
  $E56E,$03 #REGb=*#REGix+#N$07.
  $E571,$01 Write #REGa to *#REGhl.
  $E572,$01 Increment #REGhl by one.
  $E573,$02 Decrease counter by one and loop back to #R$E571 until counter is zero.
  $E575,$01 Decrease #REGd by one.
  $E576,$02 Jump to #R$E564 until #REGd is zero.
  $E578,$01 Restore #REGbc from the stack.
  $E579,$01 Decrease #REGb by one.
  $E57A,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $E57D,$02 #REGd=#N$02.
  $E57F,$02 Jump to #R$E51D.

c $E581 Handler: Disappearing Floors
@ $E581 label=Handler_DisappearingFloors
  $E581,$04 #REGix=#R$5BE6.
@ $E585 label=Handler_DisappearingFloors_Loop
  $E585,$06 Return if *#REGix+#N$00 is equal to #N$FF.
  $E58B,$03 #REGa=*#REGix+#N$02.
  $E58E,$02,b$01 Keep only bit 7.
  $E590,$03 Jump to #R$E5C5 if the result is zero.
  $E593,$06 #HTML(Write #R$A06C(#N$9F6C) (#R$A06C) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $E599,$03 Increment *#REGix+#N$05 by one.
  $E59C,$08 Jump to #R$E5B0 if *#REGix+#N$04 is not equal to *#REGix+#N$05.
  $E5A4,$03 #REGa=*#REGix+#N$02.
  $E5A7,$02,b$01 Keep only bits 0-6.
  $E5A9,$03 Write #REGa to *#REGix+#N$02.
  $E5AC,$04 Write #N$00 to *#REGix+#N$05.
  $E5B0,$03 #REGc=*#REGix+#N$00.
  $E5B3,$03 #REGb=*#REGix+#N$01.
  $E5B6,$03 #REGa=*#REGix+#N$02.
  $E5B9,$02,b$01 Keep only bits 0-6.
  $E5BB,$01 #REGe=Sprite width (#REGa).
  $E5BC,$02 #REGd=Sprite height (#N$01).
  $E5BE,$02 #REGa=base sprite ID (#N$20).
  $E5C0,$03 Call #R$EA93.
  $E5C3,$02 Jump to #R$E5ED.
  $E5C5,$03 #REGa=*#REGix+#N$03.
  $E5C8,$03 Increment *#REGix+#N$05 by one.
  $E5CB,$05 Jump to #R$E5DC if #REGa is not equal to *#REGix+#N$05.
  $E5D0,$03 #REGa=*#REGix+#N$02.
  $E5D3,$02,b$01 Set bit 7.
  $E5D5,$03 Write #REGa to *#REGix+#N$02.
  $E5D8,$04 Write #N$00 to *#REGix+#N$05.
  $E5DC,$03 #REGc=*#REGix+#N$00.
  $E5DF,$03 #REGb=*#REGix+#N$01.
  $E5E2,$03 #REGa=*#REGix+#N$02.
  $E5E5,$02,b$01 Keep only bits 0-6.
  $E5E7,$01 #REGe=Sprite width (#REGa).
  $E5E8,$02 #REGd=Sprite height (#N$01).
  $E5EA,$03 Call #R$E787.
@ $E5ED label=Handler_DisappearingFloors_Next
  $E5ED,$05 #REGix+=#N($0006,$04,$04).
  $E5F2,$02 Jump to #R$E585.

c $E5F4 Handler: Items
@ $E5F4 label=Handler_Items
  $E5F4,$04 #REGix=#R$5BE0.
@ $E5F8 label=Handler_Items_Loop
  $E5F8,$06 Return if *#REGix+#N$00 is equal to #N$FF.
  $E5FE,$01 #REGc=#REGa.
  $E5FF,$03 #REGb=*#REGix+#N$01.
  $E602,$07 Jump to #R$E61A if *#REGix+#N$05 is equal to #N$00.
  $E609,$03 #REGa=*#R$F232.
  $E60C,$01 Decrease #REGa by one.
  $E60D,$03 Jump to #R$E61A if #REGa is not equal to #REGb.
  $E610,$03 #REGa=*#R$F231.
  $E613,$01 #REGa-=#REGc.
  $E614,$02 Jump to #R$E621 if #REGa is zero.
  $E616,$04 Jump to #R$E621 if #REGa is equal to #N$FF.
@ $E61A label=Handler_Items_Next
  $E61A,$05 #REGix+=#N($0007,$04,$04).
  $E61F,$02 Jump to #R$E5F8.

  $E621,$03 Call #R$E3C2.
  $E624,$05 Write #N$04 to *#R$FFFE.
  $E629,$02 #REGa=#N$00.
  $E62B,$04 #REGde=Set the sprite width/ height (#N$02/ #N$02).
  $E62F,$01 Stash #REGde on the stack.
  $E630,$03 Call #R$E72F.
  $E633,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $E636,$01 Restore #REGde from the stack.
  $E637,$06 #HTML(Write #R$A06C(#N$9F6C) (#R$A06C) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $E63D,$02 #REGa=#N$20.
  $E63F,$03 Call #R$EA93.
  $E642,$04 Write #N$05 to *#REGix+#N$05.
  $E646,$06 Set INK: YELLOW (#N$06).
  $E64C,$07 Set PAPER: *#R$5BD0.
N $E653 Restore the default ZX Spectrum font.
  $E653,$06 #HTML(Write <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/3D00.html">#N$3C00</a> (CHARSET-#N$100) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $E659,$07 #HTML(Set up the screen buffer location #N$13/#N$01 using <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $E660,$09 Increment *#R$5BF4 by one.
  $E669,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/1A1B.html">OUT_NUM_1</a>.)
  $E66C,$07 #HTML(Set up the screen buffer location #N$05/#N$01 using <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $E673,$09 Decrease *#R$5BF2 by one.
  $E67C,$05 Jump to #R$E699 if #REGb is not equal to #N$00.
  $E681,$05 Jump to #R$E699 if #REGc is not equal to #N$32.
  $E686,$06 Write *#R$5BD3 to *#R$5BFC.
  $E68C,$06 Write *#REGix+#N$00 to *#R$5BFD.
  $E692,$03 #REGa=*#REGix+#N$01.
  $E695,$01 Increment #REGa by one.
  $E696,$03 Write #REGa to *#R$5BFE.
  $E699,$03 Compare #REGc with #N$00.
  $E69C,$01 Stash #REGaf on the stack.
  $E69D,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/1A1B.html">OUT_NUM_1</a> if #REGc was not zero on line #R$E699.)
  $E6A0,$02 #REGa=ASCII "space" (#N$20).
  $E6A2,$03 Call #R$E6DC.
  $E6A5,$01 Restore #REGaf from the stack.
  $E6A6,$01 Return if {} is not zero.
  $E6A7,$05 Write #N$2D to *#R$5BFF.
  $E6AC,$07 Write #N($0014,$04,$04) to *#R$5BFA.
N $E6B3 Restore the default ZX Spectrum font.
  $E6B3,$06 #HTML(Write <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/3D00.html">#N$3C00</a> (CHARSET-#N$100) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $E6B9,$03 Jump to #R$E0F7.

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
  $E74A,$04 Jump to #R$E751 if #REGa is equal to #N$00.
  $E74E,$03 Write #REGa to *#R$F336.
  $E751,$03 Call #R$E804.
  $E754,$01 Decrease #REGe by one.
  $E755,$02 Jump to #R$E746 until #REGe is zero.
  $E757,$01 Decrease #REGd by one.
  $E758,$02 Jump to #R$E75D if #REGd is zero.
  $E75A,$01 Decrease #REGb by one.
  $E75B,$02 Jump to #R$E73B.
  $E75D,$04 Restore #REGhl, #REGde, #REGbc and #REGaf from the stack.
  $E761,$01 Return.

c $E762
  $E762,$04 #REGe=#N$18-#REGb.
  $E766,$02 #REGd=#N$00.
  $E768,$14 #REGde*=#N$100.
  $E77C,$04 #REGl=#N$21-#REGc.
  $E780,$02 #REGh=#N$00.
  $E782,$01 #REGhl+=#REGde.
  $E783,$03 Write #REGhl to *#R$F330.
  $E786,$01 Return.

c $E787 Mask Sprite?
@ $E787 label=MaskSprite
  $E787,$04 #HTML(Stash *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a> on the stack.)
  $E78B,$06 #HTML(Write #R$8478(#N$8378) (#R$8478) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $E791,$04 Write #REGe to *#R$F335.
  $E795,$04 #REGe=*#R$F335.
  $E799,$02 Stash #REGbc and #REGde on the stack.
  $E79B,$03 Call #R$E762.
  $E79E,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $E7A1,$02 Restore #REGde and #REGbc from the stack.
  $E7A3,$01 Stash #REGde on the stack.
  $E7A4,$07 Increment *#R$F330 by one.
  $E7AB,$01 Decrease #REGhl by one.
  $E7AC,$04 #REGhl+=#R$A1C4.
  $E7B0,$01 #REGa=*#REGhl.
  $E7B1,$01 Restore #REGde from the stack.
  $E7B2,$04 Jump to #R$E7BD if #REGa is not equal to #N$00.
  $E7B6,$02 #REGa=#N$20.
  $E7B8,$03 Call #R$E6DC.
  $E7BB,$02 Jump to #R$E7D3.
  $E7BD,$02 Stash #REGaf and #REGaf on the stack.
  $E7BF,$02,b$01 Keep only bit 7.
  $E7C1,$03 Call #R$E7FB not zero.
  $E7C4,$01 Restore #REGaf from the stack.
  $E7C5,$02,b$01 Keep only bits 0-6.
  $E7C8,$01 Restore #REGaf from the stack.
  $E7C9,$02 Jump to #R$E7D3 if {} is zero.
  $E7CB,$01 Stash #REGhl on the stack.
  $E7CC,$06 #HTML(Write #R$8478(#N$8378) (#R$8478) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $E7D2,$01 Restore #REGhl from the stack.
  $E7D3,$02 Stash #REGde and #REGhl on the stack.
  $E7D5,$03 #REGhl=*#R$F330.
  $E7D8,$01 Decrease #REGhl by one.
  $E7D9,$04 #REGhl+=#R$A4E4.
  $E7DD,$05 Jump to #R$E7EB if *#REGhl is equal to #N$00.
  $E7E2,$03 #REGde=#N$5800 (attribute buffer location).
  $E7E5,$03 #REGhl=*#R$F330.
  $E7E8,$01 Decrease #REGhl by one.
  $E7E9,$01 #REGhl+=#REGde.
  $E7EA,$01 Write #REGa to *#REGhl.
  $E7EB,$02 Restore #REGhl and #REGde from the stack.
  $E7ED,$01 Decrease #REGe by one.
  $E7EE,$02 Jump to #R$E7A3 until #REGe is zero.
  $E7F0,$01 Decrease #REGd by one.
  $E7F1,$02 Jump to #R$E7F6 if #REGd is zero.
  $E7F3,$01 Decrease #REGb by one.
  $E7F4,$02 Jump to #R$E795.
  $E7F6,$01 Restore #REGhl from the stack.
  $E7F7,$03 #HTML(Write #REGhl to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $E7FA,$01 Return.
  $E7FB,$01 Stash #REGhl on the stack.
  $E7FC,$06 #HTML(Write #R$8778(#N$8678) (#R$8778) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $E802,$01 Restore #REGhl from the stack.
  $E803,$01 Return.

c $E804
  $E804,$03 Stash #REGaf, #REGde and #REGhl on the stack.
  $E807,$07 Increment *#R$F330 by one.
  $E80E,$01 Decrease #REGhl by one.
  $E80F,$04 #REGhl+=#R$A1C4.
  $E813,$01 Write #REGa to *#REGhl.
  $E814,$04 #REGhl+=#N$0320.
  $E818,$03 #HTML(#REGa=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C8F.html">ATTR_T</a>.)
  $E81B,$01 Write #REGa to *#REGhl.
  $E81C,$03 Restore #REGhl, #REGde and #REGaf from the stack.
  $E81F,$01 Return.

b $E820

c $E821 Handler: Lifts
@ $E821 label=Handler_Lifts
N $E821 Only action lifts every other frame.
  $E821,$03 #REGa=*#R$F334.
  $E824,$01 Increment #REGa by one.
  $E825,$02,b$01 Ensure #REGa is either #N$00 or #N$01.
  $E827,$03 Write #REGa back to *#R$F334.
  $E82A,$03 Return if #REGa is not equal to #N$01.
N $E82D Set the UDG graphics pointer.
  $E82D,$06 #HTML(Write #R$F27B(#N$F17B) (#R$F27B) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
N $E833 Find active lifts.
  $E833,$04 #REGix=*#R$5BE4.
@ $E837 label=Handler_Lifts_Loop
  $E837,$06 Return if *#REGix+#N$00 is equal to #N$FF.
  $E83D,$08 Jump to #R$E946 if *#REGix+#N$04 is equal to #N$00.
  $E845,$07 Jump to #R$E8B5 if *#R$F240 is not equal to #N$03.
  $E84C,$03 #REGe=*#REGix+#N$07.
  $E84F,$03 #REGc=*#REGix+#N$00.
  $E852,$03 #REGb=*#REGix+#N$01.
  $E855,$03 #REGa=*#R$F23F.
  $E858,$02 #REGa-=#N$03.
  $E85A,$03 Jump to #R$E8B5 if #REGa is not equal to #REGb.
  $E85D,$03 #REGc=*#REGix+#N$00.
  $E860,$03 #REGb=*#REGix+#N$01.
  $E863,$01 Stash #REGbc on the stack.
  $E864,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $E867,$03 #HTML(#REGhl=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C84.html">DF_CC</a>.)
  $E86A,$01 Restore #REGbc from the stack.
  $E86B,$01 Increment #REGb by one.
  $E86C,$01 Stash #REGhl on the stack.
  $E86D,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $E870,$01 Restore #REGhl from the stack.
  $E871,$04 #HTML(#REGde=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C84.html">DF_CC</a>.)
  $E875,$04 #REGd+=#N$07.
  $E879,$03 #REGb=*#REGix+#N$07.
  $E87C,$07 Jump to #R$E884 if *#REGix+#N$02 is higher than #N$02.
  $E883,$01 Increment #REGb by one.
  $E884,$01 #REGa=*#REGde.
  $E885,$01 Merge the bits from *#REGhl.
  $E886,$02 Jump to #R$E88E if the result is not zero.
  $E888,$01 Increment #REGhl by one.
  $E889,$01 Increment #REGde by one.
  $E88A,$02 Decrease counter by one and loop back to #R$E884 until counter is zero.
  $E88C,$02 Jump to #R$E8B5.

  $E88E,$05 Write #N$02 to *#R$E820.
  $E893,$07 Jump to #R$E8A4 if *#REGix+#N$04 is equal to #N$00.
  $E89A,$02 Compare #REGa with #N$FF.
  $E89C,$01 Stash #REGaf on the stack.
  $E89D,$03 Call #R$E92E zero.
  $E8A0,$01 Restore #REGaf from the stack.
  $E8A1,$03 Call #R$E926 not zero.
  $E8A4,$07 Jump to #R$E8B5 if *#REGix+#N$05 is equal to #N$00.
  $E8AB,$02 Compare #REGa with #N$FF.
  $E8AD,$01 Stash #REGaf on the stack.
  $E8AE,$03 Call #R$E93E if #REGa was equal to #N$FF on line #R$E8AB.
  $E8B1,$01 Restore #REGaf from the stack.
  $E8B2,$03 Call #R$E936 if #REGa was not equal to #N$FF on line #R$E8AB.
  $E8B5,$03 Call #R$EEA6.
  $E8B8,$03 #REGa=*#REGix+#N$04.
  $E8BB,$02 Compare #REGa with #N$00.
  $E8BD,$01 Stash #REGaf on the stack.
  $E8BE,$03 Call #R$E901 if #REGa was equal to #N$FF on line #R$E8BB.
  $E8C1,$01 Restore #REGaf from the stack.
  $E8C2,$03 Call #R$E8DC if #REGa was not equal to #N$FF on line #R$E8BB.
  $E8C5,$03 Write #REGc to *#REGix+#N$00.
  $E8C8,$03 Write #REGb to *#REGix+#N$01.
  $E8CB,$03 Write #REGe to *#REGix+#N$02.
  $E8CE,$03 Write #REGd to *#REGix+#N$03.
  $E8D1,$03 Call #R$EED7.
  $E8D4,$05 #REGix+=#N($0010,$04,$04).
  $E8D9,$03 Jump to #R$E837.
  $E8DC,$07 Jump to #R$E8F2 if *#REGix+#N$04 is equal to #N$FF.
  $E8E3,$05 Return if *#REGix+#N$0A is not equal to #REGc.
  $E8E8,$05 Return if *#REGix+#N$0B is not equal to #REGe.
  $E8ED,$04 Write #N$FF to *#REGix+#N$04.
  $E8F1,$01 Return.
  $E8F2,$05 Return if *#REGix+#N$0C is not equal to #REGc.
  $E8F7,$05 Return if *#REGix+#N$0D is not equal to #REGe.
  $E8FC,$04 Write #N$01 to *#REGix+#N$04.
  $E900,$01 Return.

  $E901,$07 Jump to #R$E917 if *#REGix+#N$05 is equal to #N$FF.
  $E908,$05 Return if *#REGix+#N$0A is not equal to #REGb.
  $E90D,$05 Return if *#REGix+#N$0B is not equal to #REGd.
  $E912,$04 Write #N$FF to *#REGix+#N$05.
  $E916,$01 Return.

  $E917,$05 Return if *#REGix+#N$0C is not equal to #REGb.
  $E91C,$05 Return if *#REGix+#N$0D is not equal to #REGd.
  $E921,$04 Write #N$01 to *#REGix+#N$05.
  $E925,$01 Return.

  $E926,$07 Increment *#R$F235 by one.
  $E92D,$01 Return.

  $E92E,$07 Decrease *#R$F235 by one.
  $E935,$01 Return.

  $E936,$07 Increment *#R$F236 by one.
  $E93D,$01 Return.

  $E93E,$07 Decrease *#R$F236 by one.
  $E945,$01 Return.

  $E946,$03 #REGa=*#R$F240.
  $E949,$01 Increment #REGa by one.
  $E94A,$02,b$01 Keep only bits 0-1.
  $E94C,$06 Jump to #R$E8B5 if #REGa is not equal to *#REGix+#N$03.
  $E952,$03 #REGc=*#REGix+#N$00.
  $E955,$03 #REGb=*#REGix+#N$01.
  $E958,$03 #REGa=*#REGix+#N$03.
  $E95B,$02 Compare #REGa with #N$00.
  $E95D,$03 #REGa=*#R$F23F.
  $E960,$02 Jump to #R$E963 if #REGa was equal to #N$00 on line #R$E95B.
  $E962,$01 Decrease #REGa by one.
  $E963,$02 #REGa-=#N$02.
  $E965,$04 Jump to #R$E8B5 if #REGa is not equal to #REGb.
  $E969,$03 #REGa=*#REGix+#N$03.
  $E96C,$03 #REGc=*#REGix+#N$00.
  $E96F,$03 #REGb=*#REGix+#N$01.
  $E972,$01 Stash #REGaf on the stack.
  $E973,$05 Call #R$E9B7 if #REGa is equal to #N$03.
  $E978,$01 Restore #REGaf from the stack.
  $E979,$01 Stash #REGaf on the stack.
  $E97A,$05 Call #R$E9AA if #REGa is equal to #N$02.
  $E97F,$01 Restore #REGaf from the stack.
  $E980,$01 Stash #REGaf on the stack.
  $E981,$05 Call #R$E99B if #REGa is equal to #N$01.
  $E986,$01 Restore #REGaf from the stack.
  $E987,$05 Call #R$E9C2 if #REGa is equal to #N$00.
  $E98C,$03 #REGb=*#REGix+#N$07.
  $E98F,$01 #REGa=*#REGde.
  $E990,$01 Merge the bits from *#REGhl.
  $E991,$03 Jump to #R$E88E if the result is not zero.
  $E994,$01 Increment #REGhl by one.
  $E995,$01 Increment #REGde by one.
  $E996,$02 Decrease counter by one and loop back to #R$E98F until counter is zero.
  $E998,$03 Jump to #R$E8B5.
  $E99B,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $E99E,$03 #HTML(#REGhl=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C84.html">DF_CC</a>.)
  $E9A1,$05 Increment #REGh by five.
  $E9A6,$02 #REGde=#REGhl (using the stack).
  $E9A8,$01 Increment #REGh by one.
  $E9A9,$01 Return.
  $E9AA,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $E9AD,$03 #HTML(#REGhl=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C84.html">DF_CC</a>.)
  $E9B0,$03 Increment #REGh by three.
  $E9B3,$02 #REGde=#REGhl (using the stack).
  $E9B5,$01 Increment #REGh by one.
  $E9B6,$01 Return.

  $E9B7,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $E9BA,$03 #HTML(#REGhl=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C84.html">DF_CC</a>.)
  $E9BD,$01 Increment #REGh by one.
  $E9BE,$02 #REGde=#REGhl (using the stack).
  $E9C0,$01 Increment #REGh by one.
  $E9C1,$01 Return.

  $E9C2,$01 Stash #REGbc on the stack.
  $E9C3,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $E9C6,$01 Restore #REGbc from the stack.
  $E9C7,$04 #HTML(#REGde=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C84.html">DF_CC</a>.)
  $E9CB,$04 #REGd+=#N$07.
  $E9CF,$01 Stash #REGde on the stack.
  $E9D0,$01 Decrease #REGb by one.
  $E9D1,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $E9D4,$01 Restore #REGde from the stack.
  $E9D5,$03 #HTML(#REGhl=*<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C84.html">DF_CC</a>.)
  $E9D8,$01 Return.

c $E9D9 In-Game Pause
@ $E9D9 label=InGamePause
  $E9D9,$03 #REGbc=#N$07D0.
@ $E9DC label=InGamePause_Loop
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

c $EA93 Print Sprite
@ $EA93 label=PrintSprite
R $EA93 A Sprite ID
R $EA93 B Vertical co-ordinate
R $EA93 C Horizontal co-ordinate
R $EA93 D Height (in character blocks)
R $EA93 E Width (in character blocks)
  $EA93,$01 Stash #REGhl on the stack.
  $EA94,$01 Decrease #REGa by one.
  $EA95,$03 Write #REGa to *#R$F336.
  $EA98,$04 Write #REGe to *#R$F335.
  $EA9C,$06 Jump to #R$EACD if #REGc is lower than #N$02.
  $EAA2,$04 #REGe=*#R$F335.
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

c $EB05 Player: Move Right
@ $EB05 label=PlayerMoveRight
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

c $EB49 Player: Move Left
@ $EB49 label=PlayerMoveLeft
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
  $EBB3,$04 #HTML(Stash *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a> on the stack.)
  $EBB7,$06 #HTML(Write #R$A06C(#N$9F6C) (#R$A06C) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $EBBD,$04 #REGde=Set the sprite width/ height (#N$01/ #N$04).
  $EBC1,$02 #REGa=#N$00.
  $EBC3,$03 Call #R$E72F.
  $EBC6,$02 #REGa=#N$20.
  $EBC8,$03 Call #R$EA93.
  $EBCB,$04 #HTML(Restore the previous value of *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a> from the stack.)
  $EBCF,$04 Restore #REGde, #REGbc and #REGix from the stack.
  $EBD3,$04 Write #N$00 to *#REGix+#N$10.
  $EBD7,$01 Return.

c $EBD8 Handler: Player
@ $EBD8 label=Handler_Player
  $EBD8,$04 #REGix=#R$F231.
  $EBDC,$06 Set INK: CYAN (#N$05).
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
  $EC2D,$02 Jump to #R$EC49 if the result is not zero.
  $EC2F,$01 Increment #REGhl by one.
  $EC30,$03 #REGa=*#R$F32D.
  $EC33,$01 Merge the bits from *#REGhl.
  $EC34,$02 Jump to #R$EC49 if the result is not zero.
  $EC36,$01 Increment #REGhl by one.
  $EC37,$03 #REGa=*#R$F32E.
  $EC3A,$01 Merge the bits from *#REGhl.
  $EC3B,$02 Jump to #R$EC49 if the result is not zero.
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
N $EC9D See #POKE#walkthroughDoors(Walkthrough All Doors).
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
  $ECC4,$06 #HTML(Write #R$8A78(#N$8978) (#R$8A78) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
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

c $ED35 Player Controls
N $ED35 See #R$D579.
@ $ED35 label=PlayerControls
  $ED35,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/028E.html">KEY_SCAN</a>.)
  $ED38,$07 Jump to #R$ED46 if *#R$5BF0 is not set to "Demo Mode" (#N$03).
  $ED3F,$01 #REGa=the keypress.
  $ED40,$03 Return if no keys have been pressed.
  $ED43,$03 Jump to #R$ED8F.
N $ED46 All player controls directly alter the user-defined keys except for (obviously) the Kempston joystick.
@ $ED46 label=Check_PlayerControls
  $ED46,$04 #REGix=#R$F231.
  $ED4A,$01 #REGa=the keypress.
N $ED4B Check against #R$5BEB.
  $ED4B,$03 Check the first user-defined key at #R$5BEB.
  $ED4E,$04 Jump to #R$EB49 if "left" has been pressed.
N $ED52 Check against #R$5BEC.
  $ED52,$01 Check the next user-defined key.
  $ED53,$04 Jump to #R$EB05 if "right" has been pressed.
N $ED57 Check against #R$5BED.
  $ED57,$01 Check the next user-defined key.
  $ED58,$04 Jump to #R$EE08 if "up" has been pressed.
N $ED5C Check against #R$5BEE.
  $ED5C,$01 Check the next user-defined key.
  $ED5D,$04 Jump to #R$ED9A if "down" has been pressed.
N $ED61 Check against #R$5BEF.
  $ED61,$01 Check the next user-defined key.
  $ED62,$04 Jump to #R$EE5B if "fire" has been pressed.
N $ED66 Toggle the music on/ off - I wish I knew this in 1984!
  $ED66,$05 Jump to #R$ED7D if #REGa is equal to #N$10.
N $ED6B Was the game paused?
  $ED6B,$03 Return if #REGa is not equal to #N$22.
N $ED6E Handle the game being paused.
  $ED6E,$01 Disable interrupts.
@ $ED6F label=InGamePauseLoop
  $ED6F,$03 Call #R$E9D9.
  $ED72,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/028E.html">KEY_SCAN</a>.)
  $ED75,$06 Jump to #R$ED6F if no keys have been pressed.
  $ED7B,$01 Re-enable interrupts.
  $ED7C,$01 Return.

c $ED7D In-Game Toggle Music
@ $ED7D label=InGame_ToggleMusic
N $ED7D A clone in functionality of #R$D5B0, just the check is the opposite way round and we return instead of jumping.
  $ED7D,$07 Jump to #R$ED8A if *#R$FFF8 is equal to #N$01.
  $ED84,$05 Write ON (#N$01) to *#R$FFF8.
  $ED89,$01 Return.
@ $ED8A label=ToggleMusicOff
  $ED8A,$04 Write OFF (#N$00) to *#R$FFF8.
  $ED8E,$01 Return.

c $ED8F
  $ED8F,$01 Restore #REGbc from the stack.
N $ED90 Restore the default ZX Spectrum font.
  $ED90,$06 #HTML(Write <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/3D00.html">#N$3C00</a> (CHARSET-#N$100) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $ED96,$03 Call #R$E058.
  $ED99,$01 Return.

c $ED9A Player: Move Down
@ $ED9A label=PlayerMoveDown
  $ED9A,$07 Jump to #R$EDED if *#REGix+#N$11 is equal to #N$03.
  $EDA1,$03 #REGc=*#REGix+#N$00.
  $EDA4,$03 #REGb=*#REGix+#N$01.
  $EDA7,$03 #REGhl=*#R$5BD8.
  $EDAA,$04 Return if *#REGhl is equal to #N$FF.
  $EDAE,$01 Increment #REGhl by one.
  $EDAF,$03 Jump to #R$EDB5 if #REGa is equal to #REGc.
  $EDB2,$01 Increment #REGhl by one.
  $EDB3,$02 Jump to #R$EDAA.

  $EDB5,$01 #REGa=*#REGhl.
  $EDB6,$02 Decrease #REGa by two.
  $EDB8,$03 Write #REGa to *#REGix+#N$13.
  $EDBB,$02 #REGa+=#N$05.
  $EDBD,$03 Write #REGa to *#REGix+#N$12.
  $EDC0,$01 Increment #REGhl by one.
  $EDC1,$01 #REGa-=#REGb.
  $EDC2,$04 Jump to #R$EDAA if #REGa is higher than #N$04.
  $EDC6,$07 Jump to #R$EDD5 if *#REGix+#N$11 is equal to #N$03.
  $EDCD,$04 Write #N$7A to *#REGix+#N$06.
  $EDD1,$04 Write #N$03 to *#REGix+#N$11.
  $EDD5,$03 #REGa=*#REGix+#N$06.
  $EDD8,$02 #REGa+=#N$06.
  $EDDA,$03 Write #REGa to *#REGix+#N$06.
  $EDDD,$04 Jump to #R$EDE5 if #REGa is not equal to #N$98.
  $EDE1,$04 Write #N$80 to *#REGix+#N$06.
  $EDE5,$03 Decrease *#REGix+#N$05 by one.
  $EDE8,$04 Write #N$03 to *#REGix+#N$02.
  $EDEC,$01 Return.

  $EDED,$08 Jump to #R$EDD5 if *#REGix+#N$01 is not equal to *#REGix+#N$13.
  $EDF5,$01 Return.

  $EDF6,$0A Jump to #R$EE42 if *#REGix+#N$01 is not equal to *#REGix+#N$12.
  $EE00,$07 Jump to #R$EE42 if *#REGix+#N$03 is not equal to #N$03.
  $EE07,$01 Return.

c $EE08 Player: Move Up
@ $EE08 label=PlayerMoveUp
  $EE08,$07 Jump to #R$EDF6 if *#REGix+#N$11 is equal to #N$03.
  $EE0F,$03 #REGc=*#REGix+#N$00.
  $EE12,$03 #REGb=*#REGix+#N$01.
  $EE15,$03 #REGhl=*#R$5BD8.
  $EE18,$04 Return if *#REGhl is equal to #N$FF.
  $EE1C,$01 Increment #REGhl by one.
  $EE1D,$03 Jump to #R$EE23 if #REGa is equal to #REGc.
  $EE20,$01 Increment #REGhl by one.
  $EE21,$02 Jump to #R$EE18.
  $EE23,$01 #REGa=*#REGhl.
  $EE24,$01 Increment #REGhl by one.
  $EE25,$02 Decrease #REGa by two.
  $EE27,$03 Jump to #R$EE18 if #REGa is not equal to #REGb.
  $EE2A,$03 Write #REGa to *#REGix+#N$13.
  $EE2D,$02 #REGa+=#N$05.
  $EE2F,$03 Write #REGa to *#REGix+#N$12.
  $EE32,$01 Increment #REGhl by one.
  $EE33,$07 Jump to #R$EE42 if *#REGix+#N$11 is equal to #N$03.
  $EE3A,$04 Write #N$98 to *#REGix+#N$06.
  $EE3E,$04 Write #N$03 to *#REGix+#N$11.
  $EE42,$03 #REGa=*#REGix+#N$06.
  $EE45,$02 #REGa-=#N$06.
  $EE47,$03 Write #REGa to *#REGix+#N$06.
  $EE4A,$04 Jump to #R$EE52 if #REGa is not equal to #N$7A.
  $EE4E,$04 Write #N$92 to *#REGix+#N$06.
  $EE52,$04 Write #N$01 to *#REGix+#N$05.
  $EE56,$04 Write #N$03 to *#REGix+#N$02.
  $EE5A,$01 Return.


c $EE5B Player: Fire
@ $EE5B label=PlayerFire
  $EE5B,$04 #REGix=#R$5BD6.
  $EE5F,$04 #REGbc=*#R$F231.
  $EE63,$06 Return if *#REGix+#N$00 is equal to #N$FF.
  $EE69,$01 #REGa-=#REGc.
  $EE6A,$04 Jump to #R$EE75 if #REGa is higher than #N$02.
  $EE6E,$03 #REGa=*#REGix+#N$01.
  $EE71,$01 Decrease #REGa by one.
  $EE72,$03 Jump to #R$EE7C if #REGa is equal to #REGb.
  $EE75,$05 #REGix+=#N($0004,$04,$04).
  $EE7A,$02 Jump to #R$EE63.
  $EE7C,$08 Call #R$E361 if *#REGix+#N$03 is equal to #N$15.
@ $EE84 label=ChangeRoom
  $EE84,$03 Write #REGa to *#R$5BD3.
  $EE87,$0E Write #N$00 to: #LIST
. { *#R$F241 }
. { *#R$F2DB }
. { *#R$E479 }
. { *#R$F31C }
. LIST#
  $EE95,$05 Write #N$01 to *#R$F242.
N $EE9A Write the front-facing player sprite to be the active frame.
.
. This ensures the player appears to be emerging from the door.
  $EE9A,$05 Write #R$8E38(#N$98) to *#R$F237.
N $EE9F This also draws the whole room.
  $EE9F,$03 Call #R$E0A9.
  $EEA2,$03 Call #R$E058.
  $EEA5,$01 Return.

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
  $EF5D,$05 #REGhl+=*#R$F33C.
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
  $EFC7,$05 #REGd+=*#R$F33E.
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
  $EFE2,$05 #REGd+=*#R$F33E.
  $EFE7,$02 Jump to #R$EFDC.
  $EFE9,$05 #REGd+=*#R$F33E.
  $EFEE,$01 Decrease #REGe by one.
  $EFEF,$03 Jump to #R$EFFB if #REGe is zero.
  $EFF2,$01 Decrease #REGc by one.
  $EFF3,$05 Jump to #R$EFE9 if #REGc is higher than #N$22.
  $EFF8,$03 Jump to #R$EFB5.
  $EFFB,$03 Restore #REGbc, #REGbc and #REGbc from the stack.
  $EFFE,$03 Jump to #R$EFD7.

c $F001 Handler: Pirates
@ $F001 label=Handler_Pirates
N $F001 See #POKE#noPirates(No Pirates).
  $F001,$06 Return if *#R$F334 is equal to #N$00.
  $F007,$06 #HTML(Write #R$8F28(#N$8E28) (#R$8F28) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $F00D,$04 #REGix=*#R$5BDE.
@ $F011 label=Handler_Pirates_Loop
  $F011,$06 Return if Pirate state (*#REGix+#N$00) is equal to OFF (#N$FF).
  $F017,$07 Set INK: Pirate attribute (*#REGix+#N$09).
N $F01E Update the sprite frame.
  $F01E,$03 Fetch the current Pirate sprite reference (*#REGix+#N$06).
  $F021,$02 Add #N$06.
  $F023,$03 Write it back to the current Pirate sprite reference (*#REGix+#N$06).
N $F026
  $F026,$04 Jump to #R$F02E if #REGa is not equal to #N$4A.
  $F02A,$04 Write #N$20 (facing right) to Pirate sprite reference (*#REGix+#N$06).
@ $F02E label=Handler_Pirates_CheckSpriteFrames
  $F02E,$04 Jump to #R$F036 if #REGa is not equal to #N$80.
  $F032,$04 Write #N$50 (facing left) to Pirate sprite reference (*#REGix+#N$06).
@ $F036 label=Handler_Pirates_SkipSpriteFrames
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
N $F0C1 See #POKE#immunePirates(Immune To Pirates).
  $F0C1,$04 Jump to #R$F0DB if #REGa is higher than #N$10.
  $F0C5,$03 #REGb=*#REGix+#N$01.
  $F0C8,$03 #REGa=*#R$F232.
  $F0CB,$02 #REGa+=#N$02.
  $F0CD,$01 #REGa-=#REGb.
  $F0CE,$05 Jump to #R$F0DB if #REGa is higher than #N$06.
  $F0D3,$05 Write #N$02 to *#R$FFFE.
  $F0D8,$03 Jump to #R$E3A4.
N $F0DB Move onto the next Pirate.
@ $F0DB label=Handler_Pirate_Next
  $F0DB,$05 #REGix+=#N($0010,$04,$04).
  $F0E0,$03 Jump to #R$F011.
N $F0E3 Alters the direction of the Pirate to now face and move left.
@ $F0E3 label=Handler_Pirate_TurnLeft
  $F0E3,$04 Write #N$01 (move left) to Pirate direction (*#REGix+#N$04).
  $F0E7,$04 Write #N$50 (facing left) to Pirate sprite reference (*#REGix+#N$06).
  $F0EB,$03 Jump to #R$F089.
N $F0EE Alters the direction of the Pirate to now face and move right.
@ $F0EE label=Handler_Pirate_TurnRight
  $F0EE,$04 Write #N$FF (move right) to Pirate direction (*#REGix+#N$04).
  $F0F2,$04 Write #N$20 (facing right) to Pirate sprite reference (*#REGix+#N$06).
  $F0F6,$03 Jump to #R$F089.
N $F0F9 Handle making the Pirate about-turn.
@ $F0F9 label=Pirate_TurnController
  $F0F9,$08 Jump to #R$F0E3 if the direction the Pirate is moving (*#REGix+#N$04) is right (#N$FF).
  $F101,$03 Jump to #R$F0EE.

c $F104 Handler: Housekeeping
N $F104 Clears the data reference from the stack before returning.
@ $F104 label=Handler_Housekeeping
  $F104,$02 Restore the current data reference from the stack.
  $F106,$01 Return.

c $F107 Handler: Keys And Locked Doors
@ $F107 label=Handler_KeysAndLockedDoors
  $F107,$02 Stash #REGix on the stack.
  $F109,$04 #REGix=*#R$5BDA.
@ $F10D label=Handler_KeysAndLockedDoors_Loop
  $F10D,$07 Jump to #R$F104 if *#REGix+#N$00 is equal to #N$FF.
  $F114,$03 #REGa=*#REGix+#N$05.
  $F117,$02,b$01 Keep only bit 1.
  $F119,$02 Jump to #R$F127 if the result is zero.
  $F11B,$06 Jump to #R$F127 if *#REGix+#N$02 is not equal to #REGc.
  $F121,$06 Jump to #R$F12E if *#REGix+#N$03 is equal to #REGb.
@ $F127 label=Handler_KeysAndLockedDoors_Next
  $F127,$05 #REGix+=#N($0006,$04,$04).
  $F12C,$02 Jump to #R$F10D.

  $F12E,$05 Write #N$06 to *#R$FFFE.
  $F133,$04 Write #N$01 to *#REGix+#N$05.
  $F137,$03 #REGc=*#REGix+#N$02.
  $F13A,$03 #REGb=*#REGix+#N$03.
  $F13D,$04 Set the sprite width/ height in #REGde (#N$01/#N$02).
  $F141,$02 #REGa=#N$00.
  $F143,$03 Call #R$E72F.
  $F146,$04 #HTML(Stash *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a> on the stack.)
  $F14A,$06 #HTML(Write #R$A06C(#N$9F6C) (#R$A06C) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $F150,$02 #REGa=#N$20.
  $F152,$03 Call #R$EA93.
  $F155,$04 #HTML(Restore the original value of *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a> from the stack.)
  $F159,$03 #REGa=*#REGix+#N$04.
  $F15C,$02 Restore #REGix from the stack.
  $F15E,$01 Stash #REGaf on the stack.
  $F15F,$07 Jump to #R$F1AA if *#REGix+#N$10 is equal to #N$00.
  $F166,$02 Stash #REGix on the stack.
  $F168,$03 Call #R$F1E5.
  $F16B,$04 #HTML(Stash *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a> on the stack.)
  $F16F,$06 #HTML(Write #R$8478(#N$8378) (#R$8478) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
  $F175,$07 Set INK: *#R$5BCC.
  $F17C,$04 Write #N$03 to *#REGix+#N$05.
  $F180,$03 #REGc=*#REGix+#N$02.
  $F183,$03 #REGb=*#REGix+#N$03.
  $F186,$01 Stash #REGbc on the stack.
  $F187,$03 Call #R$E762.
  $F18A,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $F18D,$03 #REGa=*#REGix+#N$04.
  $F190,$02 #REGa+=#N$41. TODO #R$8588
  $F192,$03 Call #R$E804.
  $F195,$01 #HTML(Print to the screen using RST <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0010.html">#N$10</a>.)
  $F196,$01 Restore #REGbc from the stack.
  $F197,$01 Decrease #REGb by one.
  $F198,$03 Call #R$E762.
  $F19B,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkid.github.io/rom/asm/0DD9.html">CL_SET</a>.)
  $F19E,$02 #REGa=#R$85D0 (#N$4B).
  $F1A0,$03 Call #R$E804.
  $F1A3,$01 #HTML(Print to the screen using RST <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0010.html">#N$10</a>.)
  $F1A4,$04 #HTML(Restore the original value of *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a> from the stack.)
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
  $F1E9,$04 #REGix=*#R$5BDA.
  $F1ED,$06 Return if *#REGix+#N$00 is equal to #N$FF.
  $F1F3,$05 Return if #REGc is equal to *#REGix+#N$04.
  $F1F8,$02 #REGix+=#REGde.
  $F1FA,$02 Jump to #R$F1ED.

c $F1FC Handler: Port Hole
@ $F1FC label=Handler_PortHole
N $F1FC Set the UDG graphics pointer.
  $F1FC,$06 #HTML(Write #R$924C(#N$914C) (#R$924C) to *<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C36.html">CHARS</a>.)
N $F202 Set the attributes.
  $F202,$06 Set INK: CYAN (#N$05).
N $F208 Only action the port holes every 4th frame.
  $F208,$03 #REGa=*#R$F259.
  $F20B,$01 Increment #REGa by one.
  $F20C,$02,b$01 Ensure #REGa is a number between #N$00-#N$03.
  $F20E,$03 Write #REGa to *#R$F259.
  $F211,$01 Return if #REGa is not zero.
N $F212 The data is stored as: #TABLE(default,centre,centre)
. { =h Byte Offset | =h Data }
. { +#N$00 | Horizontal Position }
. { +#N$01 | Vertical Position }
. { +#N$02 | Frame/ Sprite ID }
. TABLE#
N $F212 Find active port holes.
  $F212,$03 #REGhl=*#R$5BDC.
N $F215 Keep looping through the table data until we reach a terminator (#N$FF).
@ $F215 label=Handler_PortHole_Loop
  $F215,$03 Fetch the horizontal and vertical position of the port hole from the port hole data pointer.
  $F218,$01 Increment the port hole data pointer by one.
N $F219 Are we done?
  $F219,$04 Return if the terminator character has been received instead of a co-ordinate (#N$FF).
N $F21D Move onto the next frame.
  $F21D,$01 Retrieve the frame/ sprite ID from the port hole data pointer.
  $F21E,$02 Add #N$04 to the current frame/ sprite ID, as the port hole graphic is made using #N$04 UDG characters.
  $F220,$04 If the frame/ sprite ID value is under #N$40 then jump to #R$F226 (the last frame/ sprite ID is #N$3C).
N $F224 Reset the sprite ID back to the first frame/ sprite ID.
  $F224,$02 #REGa=base sprite ID (#N$20).
N $F226 Update the frame reference in the data table and print the port hole to the screen.
@ $F226 label=PrintPortHole
  $F226,$01 Update the frame/ sprite ID back to the port hole data.
  $F227,$01 Increment the port hole data pointer by one.
  $F228,$04 #REGde=Set the sprite width/ height (#N$02/ #N$02).
  $F22C,$03 Call #R$EA93.
N $F22F Keeping looping around, this only finishes when a terminator is received.
  $F22F,$02 Jump to #R$F215.

g $F231 Table: Player Attributes
@ $F231 label=TablePlayerAttributes
B $F231,$01 Horizontal co-ordinate (#N$21-#N$04).
B $F232,$01 Vertical co-ordinate (#N$15-#N$06).
B $F233,$01 Horizontal position in character block (#N$00-#N$03).
B $F234,$01 Vertical position in character block (#N$00-#N$03).
B $F235,$01 Horizontal movement indicator:
. #TABLE(default,centre,centre)
. { =h Byte | =h Meaning }
. { #N$00 | Stationary }
. { #N$01 | Moving Left }
. { #N$FF | Moving Right }
. TABLE#
B $F236,$01 Vertical movement indicator:
. #TABLE(default,centre,centre)
. { =h Byte | =h Meaning }
. { #N$00 | Stationary }
. { #N$01 | Moving Up }
. { #N$FF | Moving Down }
. TABLE#
@ $F237 label=PlayerSpriteID
B $F237,$01 Sprite frame ID:
. #TABLE(default,centre,centre)
. { =h Byte | =h Meaning }
. { #R$8A78(#N$20) | Facing Right Frame 1 }
. { #R$8AA8(#N$26) | Facing Right Frame 2 }
. { #R$8AD8(#N$2C) | Facing Right Frame 3 }
. { #R$8B08(#N$32) | Facing Right Frame 4 }
. { #R$8B38(#N$38) | Facing Right Frame 5 }
. { #R$8B68(#N$3E) | Facing Right Frame 6 }
. { #R$8B98(#N$44) | Facing Right Frame 7 }
. { #R$8BC8(#N$4A) | Facing Right Frame 8 }
. { #R$8BF8(#N$50) | Facing Left Frame 1 }
. { #R$8C28(#N$56) | Facing Left Frame 2 }
. { #R$8C58(#N$5C) | Facing Left Frame 3 }
. { #R$8C88(#N$62) | Facing Left Frame 4 }
. { #R$8CB8(#N$68) | Facing Left Frame 5 }
. { #R$8CE8(#N$6E) | Facing Left Frame 6 }
. { #R$8D18(#N$74) | Facing Left Frame 7 }
. { #R$8D48(#N$7A) | Facing Left Frame 8 }
. TABLE#
B $F238,$01 Sprite width: #N$02.
B $F239,$01 Sprite height: #N$03.
B $F23A,$01 Sprite attribute: CYAN (#N$05).
B $F23B,$01
B $F23C,$01
B $F23D,$01
B $F23E,$01
B $F23F,$01
B $F240,$01
B $F241,$01 Key (in possession).
B $F242,$01
B $F243,$01
B $F244,$01

g $F245 Table: Default Player Attributes
@ $F245 label=TableDefaultPlayerAttributes
D $F245 See #R$F231.
B $F245,$01 Starting horizontal co-ordinate: #N(#PEEK(#PC)).
B $F246,$01 Starting vertical co-ordinate: #N(#PEEK(#PC)).
B $F247,$01 Starting horizontal offset: #N(#PEEK(#PC)).
B $F248,$01 Starting vertical offset: #N(#PEEK(#PC)).
B $F249,$01 Horizontal movement: #MAP(#PEEK(#PC))(?,0:stationary).
B $F24A,$01 Vertical movement: #MAP(#PEEK(#PC))(?,0:stationary).
B $F24B,$01 Starting sprite frame ID: #N(#PEEK(#PC)).
B $F24C,$01 Sprite width: #N(#PEEK(#PC)).
B $F24D,$01 Sprite height: #N(#PEEK(#PC)).
B $F24E,$01 Sprite attribute: CYAN #N(#PEEK(#PC)).
B $F24F,$01
B $F250,$01
B $F251,$01
B $F252,$01
B $F253,$01
B $F254,$01
B $F255,$01 Key (in possession): #MAP(#PEEK(#PC))(?,0:none).
B $F256,$01
B $F257,$01
B $F258,$01

g $F259 Port Hole Timer Frame Skip
@ $F259 label=TimerPortHole_FrameSkip
D $F259 This value is incremented every frame, and every 4th frame will animate the port holes (if there are any).
. See #R$F1FC.
B $F259,$01

u $F25A
B $F25A,$01

b $F25B Graphics: Extra
@ $F25B label=Graphics_Spark
  $F25B,$08 #UDGTABLE { #UDG(#PC,attr=$0F)(spark) } UDGTABLE#
@ $F263 label=Graphics_Life
  $F263,$08 #UDGTABLE { #UDG(#PC,attr=$06)(life) } UDGTABLE#
@ $F26B label=Graphics_Key
  $F26B,$10,$08 #UDGTABLE { #UDGS$02,$01,$04(key)(#UDG(#PC+$08*$x,attr=$06)(*key)key) } UDGTABLE#

b $F27B Graphics: Lifts
@ $F27B label=Graphics_Lifts
  $F27B,$08 #UDGTABLE { #UDG(#PC) } UDGTABLE#
L $F27B,$08,$08

t $F2BB Messaging: Game Status Bar
@ $F2BB label=Messaging_GameStatusBar
  $F2BB,$20 "#STR(#PC,$04,$20)".

g $F2DB Table: Bomb Sparks
@ $F2DB label=TableBombSparks
D $F2DB Used by the routines at #R$E47A (for creation) and #R$E3E0 for animation.
.
. Initial values are populated from #R$F2F9.
N $F2DB Explosion: #N($01+((#PC-$F2DB)/$06)).
B $F2DB,$01 Horizontal position.
B $F2DC,$01 Vertical position.
B $F2DD,$01 Velocity: Left.
B $F2DE,$01 Velocity: Up.
B $F2DF,$01 Velocity: Right.
B $F2E0,$01 Timer (max. #N$04).
L $F2DB,$06,$05

g $F2F9 Table: Default Bomb Sparks
@ $F2F9 label=TableDefaultBombSparks
D $F2F9 Used by the routine at #R$E47A.
.
. These default values are copied to #R$F2DB.
N $F2F9 Explosion: #N($01+((#PC-$F2F9)/$06)).
B $F2F9,$01 Horizontal position.
B $F2FA,$01 Vertical position.
B $F2FB,$01 Velocity: Left.
B $F2FC,$01 Velocity: Up.
B $F2FD,$01 Velocity: Right.
B $F2FE,$01 Timer (max. #N$04).
L $F2F9,$06,$05

b $F317

g $F31C
  $F32D
  $F32E
  $F32F
  $F330
  $F332

g $F334 Lifts/ Pirates Frame Skip
@ $F334 label=LiftsPiratesFrameSkip
D $F334 See #R$E821 and #R$F001.
B $F334,$01 Will be either #N$00 or #N$01.

g $F335 Active Sprite Width
@ $F335 label=ActiveSpriteWidth
D $F335 The width of the sprite actively being printed.
B $F335,$01

g $F336 Active Sprite ID
@ $F336 label=ActiveSpriteID
D $F336 The ID of the sprite actively being printed. Note; this starts off as
. -1 of the real value as it increments to the base sprite ID in the printing loop.
B $F336,$01

u $F337
B $F337,$03

b $F33A
  $F33C
  $F33E
  $F33F
  $F340

g $F341 Bomb Frame Skip
@ $F341 label=BombFrameSkip
D $F341 See #R$E480.
B $F341,$01 Will be either #N$00 or #N$01.

g $F342 Kempston Control
@ $F342 label=KempstonControl
B $F342,$01 Temporarily holds the action from the last time the Kempston joystick port was read.

g $F343 Random Number Seed
@ $F343 label=RandomNumberSeed
D $F343 Used by the routine at #R$E349. Not random at all!
W $F343,$02

u $F345

b $F400 Interrupt Low-Order Byte Jump Table
@ $F400 label=InterruptLowOrderByteJumpTable
D $F400 Used as the low-order byte when an interrupt is generated.
. The high-order byte is also #N$FE, meaning all interrupts jump to #R$FEFE.
.
. See #R$CD14, #R$FE69 and #R$FEFE.
  $F400,$0100

u $F500

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

c $F648 Play Note
@ $F648 label=PlayNote
R $F648 BC
R $F648 DE Duration?
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
  $F66C,$02 Stash #REGbc and #REGbc on the stack.
  $F66E,$03 Call #R$F8C0.
  $F671,$03 #REGbc=#R$FFFE.
  $F674,$03 #REGa=*#R$5BD0.
  $F677,$02 Send #REGa to port *#REGc.
  $F679,$01 Restore #REGbc from the stack.
  $F67A,$03 Call #R$F8C0.
  $F67D,$03 #REGbc=#R$FFFE.
  $F680,$03 #REGa=*#R$5BD0.
  $F683,$02,b$01 Set bit 4.
  $F685,$02 Send #REGa to port *#REGc.
  $F687,$01 Restore #REGbc from the stack.
  $F688,$01 Increment #REGbc by one.
  $F689,$01 Decrease #REGde by one.
  $F68A,$04 Jump to #R$F66C until #REGde is zero.
  $F68E,$01 Return.

c $F68F
  $F68F,$02 Stash #REGbc and #REGbc on the stack.
  $F691,$03 Call #R$F8C0.
  $F694,$03 #REGbc=#R$FFFE.
  $F697,$03 #REGa=*#R$5BD0.
  $F69A,$02 Send #REGa to port *#REGc.
  $F69C,$01 Restore #REGbc from the stack.
  $F69D,$03 Call #R$F8C0.
  $F6A0,$04 #REGbc=*#R$FFFE.
  $F6A4,$03 #REGa=*#R$5BD0.
  $F6A7,$02,b$01 Set bit 4.
  $F6A9,$02 Send #REGa to port *#REGc.
  $F6AB,$01 Restore #REGbc from the stack.
  $F6AC,$03 Decrease #REGbc by three.
  $F6AF,$01 Decrease #REGde by one.
  $F6B0,$04 Jump to #R$F68F until #REGde is zero.
  $F6B4,$01 Return.

c $F6B5
  $F6B5,$02 Stash #REGbc and #REGbc on the stack.
  $F6B7,$03 Call #R$F8C0.
  $F6BA,$03 #REGbc=#R$FFFE.
  $F6BD,$03 #REGa=*#R$5BD0.
  $F6C0,$02 Send #REGa to port *#REGc.
  $F6C2,$01 Restore #REGbc from the stack.
  $F6C3,$03 Call #R$F8C0.
  $F6C6,$03 #REGbc=#R$FFFE.
  $F6C9,$03 #REGa=*#R$5BD0.
  $F6CC,$02,b$01 Set bit 4.
  $F6CE,$02 Send #REGa to port *#REGc.
  $F6D0,$01 Restore #REGbc from the stack.
  $F6D1,$01 Decrease #REGbc by one.
  $F6D2,$03 Return if #REGbc is zero.
  $F6D5,$01 Decrease #REGde by one.
  $F6D6,$04 Jump to #R$F6B5 until #REGde is zero.
  $F6DA,$01 Return.

c $F6DB Music: Theme Tune
@ $F6DB label=MusicThemeTune
  $F6DB,$07 Jump to #R$F712 if *#R$FFF8 is equal to #N$00.
  $F6E2,$01 Stash #REGbc on the stack.
  $F6E3,$04 #REGc=*#R$FE88.
  $F6E7,$03 #REGa=*#R$FFF7.
  $F6EA,$01 Merge the bits from #REGc.
  $F6EB,$01 Restore #REGbc from the stack.
  $F6EC,$02 Jump to #R$F712 if {} is not zero.
  $F6EE,$03 Stash #REGbc, #REGde and #REGhl on the stack.
  $F6F1,$03 #REGhl=*#R$FFF9.
  $F6F4,$01 Fetch a byte of music data and store it in #REGa.
N $F6F5 Are we at the end?
  $F6F5,$05 Jump to #R$F71B if the termination character (#N$FF) has been reached.
  $F6FA,$01 #REGe=the music data byte from #REGa.
  $F6FB,$01 Increment the music data pointer by one.
  $F6FC,$02 #REGd=*#REGhl.
  $F6FE,$01 Increment music data pointer by one.
  $F6FF,$02 #REGc=*#REGhl.
  $F701,$01 Increment music data pointer by one.
  $F702,$02 #REGb=*#REGhl.
  $F704,$04 Increment the music data pointer by one and write it to *#R$FFF9 ready for the next interrupt generation.
  $F708,$04 Jump to #R$F70F if #REGde is zero.
  $F70C,$03 Call #R$F648.
@ $F70F label=MusicThemeTune_NoNote
  $F70F,$03 Restore #REGhl, #REGde and #REGbc from the stack.
@ $F712 label=MusicThemeTune_Housekeeping
  $F712,$02 Restore #REGaf and #REGaf from the stack.
  $F714,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0038.html">MASK_INT</a>.)
  $F717,$02 Restore #REGiy from the stack.
  $F719,$01 Enable interrupts.
  $F71A,$01 Return.
N $F71B Resets the theme tune pointer back to the beginning of the data.
@ $F71B label=MusicResetThemeTune
  $F71B,$06 Write #R$FA00 to *#R$FFF9.
  $F721,$02 Jump to #R$F70F.

c $F723
  $F723,$02 Stash #REGbc and #REGde on the stack.
  $F725,$03 #REGde=#N($0019,$04,$04).
  $F728,$03 #REGbc=#N($0032,$04,$04).
  $F72B,$03 Call #R$F66C.
  $F72E,$03 Restore #REGde, #REGbc and #REGaf from the stack.
  $F731,$05 Write #N$00 to *#N$FFFE.
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
  $F749,$05 Write #N$00 to *#N$FFFE.
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
  $F80D,$06 Return if *#R$FFFF is equal to #N$00.
  $F813,$05 Jump to #R$F837 if *#R$FFFF is equal to #N$02.
  $F818,$03 #REGa=*#R$FE88.
  $F81B,$02,b$01 Keep only bits 0-2.
  $F81D,$02 Jump to #R$F82E if the result is not zero.
  $F81F,$03 Stash #REGbc, #REGde and #REGhl on the stack.
  $F822,$03 #REGbc=#N($0032,$04,$04).
  $F825,$03 #REGde=#N($003C,$04,$04).
  $F828,$03 Call #R$F648.
  $F82B,$05 Restore #REGhl, #REGde, #REGbc, #REGaf and #REGaf from the stack.
  $F830,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0038.html">MASK_INT</a>.)
  $F833,$02 Restore #REGiy from the stack.
  $F835,$01 Enable interrupts.
  $F836,$01 Return.
  $F837,$03 #REGa=*#R$FE88.
  $F83A,$02,b$01 Keep only bits 0-3.
  $F83C,$03 Jump to #R$F82E if the result is not zero.
  $F83F,$02 Stash #REGbc and #REGde on the stack.
  $F841,$03 #REGde=#N($000A,$04,$04).
  $F844,$03 #REGbc=#N($000A,$04,$04).
  $F847,$03 Call #R$F648.
  $F84A,$04 Restore #REGde, #REGbc, #REGaf and #REGaf from the stack.
  $F84E,$03 #HTML(Call <a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/0038.html">MASK_INT</a>.)
  $F851,$02 Restore #REGiy from the stack.
  $F853,$01 Enable interrupts.
  $F854,$01 Return.

c $F855
  $F855,$06 Return if *#R$FFFD is equal to #N$00.
  $F85B,$05 Jump to #R$F7D8 if *#R$FFFD is equal to #N$01.
  $F860,$03 Else, jump to #R$F7F6.

c $F863
  $F863,$03 #REGa=*#R$FFFE.
  $F866,$03 Return if  #REGa is equal to #N$00.
  $F869,$05 Jump to #R$F7A4 if #REGa is equal to #N$01.
  $F86E,$05 Jump to #R$F753 if #REGa is equal to #N$02.
  $F873,$05 Jump to #R$F774 if #REGa is equal to #N$03.
  $F878,$05 Jump to #R$F78C if #REGa is equal to #N$04.
  $F87D,$05 Jump to #R$F73B if #REGa is equal to #N$05.
  $F882,$05 Jump to #R$F723 if #REGa is equal to #N$06.
  $F887,$01 Return.

c $F888
  $F888,$06 Return if *#R$FFFB is equal to #N$00.
  $F88E,$06 Return if *#R$FFFC is equal to #N$00.
  $F894,$02 Stash #REGbc and #REGde on the stack.
  $F896,$03 #REGde=#N($00C8,$04,$04).
  $F899,$03 #REGbc=#N($0064,$04,$04).
  $F89C,$03 Call #R$F66C.
  $F89F,$03 Restore #REGde, #REGbc and #REGaf from the stack.
  $F8A2,$08 Write #N$00 to: #LIST { *#R$FFFB } { *#R$FFFC } LIST#
  $F8AA,$01 Restore #REGaf from the stack.
  $F8AB,$02 Restore #REGiy from the stack.
  $F8AD,$01 Enable interrupts.
  $F8AE,$01 Return.

c $F8AF
  $F8AF,$03 #REGhl=*#R$FE86.
  $F8B2,$01 Increment #REGhl by one.
  $F8B3,$05 Jump to #R$F8BB if #REGh is not equal to #N$20.
  $F8B8,$06 Write #N($0000,$04,$04) to *#R$FE86.
  $F8BE,$01 #REGa=*#REGhl.
  $F8BF,$01 Return.

c $F8C0
  $F8C0,$01 Decrease #REGbc by one.
  $F8C1,$04 Jump to #R$F8C0 until #REGbc is zero.
  $F8C5,$01 Return.

u $F8C6

b $FA00 Melody Data: Theme Tune
@ $FA00 label=MelodyData_ThemeTune
  $FA00,$04 Note: #N($01+((#PC-$FA00)/$04)).
L $FA00,$04,$84
  $FC10,$04 Terminator.
  $FC14,$01 Extra terminator (just in case).

b $FC15

c $FE69 Handler: Interrupts
@ $FE69 label=Handler_Interrupts
  $FE69,$02 Stash #REGiy on the stack.
  $FE6B,$04 #HTML(#REGiy=<a rel="noopener nofollow" href="https://skoolkit.ca/disassemblies/rom/hex/asm/5C3A.html">ERR_NR</a>.)
  $FE6F,$01 Stash #REGaf on the stack.
  $FE70,$07 Increment *#R$FE88 by one.
  $FE77,$03 Call #R$F888.
  $FE7A,$03 Call #R$F80D.
  $FE7D,$03 Call #R$F855.
  $FE80,$03 Call #R$F863.
  $FE83,$03 Call #R$F6DB.

g $FE86

g $FE88 Interrupt Counter
@ $FE88 label=InterruptCounter
D $FE88 Increments by one on every generated interrupt.
B $FE88,$01

b $FE89

c $FEFE Alias: Interrupt Jump Dispatcher
@ $FEFE label=AliasInterruptRedirect
D $FEFE All generated interrupts jump here and then are redirected to #R$FE69.
  $FEFE,$03 Jump to #R$FE69.

b $FF01

u $FFDC
C $FFDC,$03 #REGbc=#N$02FF.
C $FFDF,$03 #REGhl=#R$5800.
C $FFE2,$02 Write #COLOUR$38 (#N$38) to *#REGhl.
C $FFE4,$01 Increment #REGhl by one.
C $FFE5,$01 Decrease #REGbc by one.
C $FFE6,$03 Return if #REGbc is zero.
C $FFE9,$02 Jump to #R$FFE2.

b $FFEB

g $FFF7

g $FFF8 Music: On/ Off
@ $FFF8 label=MusicOnOff
B $FFF8,$01

g $FFF9 Music: Theme Tune Pointer
@ $FFF9 label=MusicPointerThemeMusic
D $FFF9 Keep track of the current position of the music data. This is important
. as the theme tune uses interrupts to play, so it needs to know where to
. resume playing from.
W $FFF9,$02

b $FFFB
  $FFFC
  $FFFD
  $FFFE
  $FFFF
