// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// initialize stopping point for fill screen loop
@SCREEN
D=A
@8192
D=D+A
@stop
M=D

(START)
@KBD
D=M
// jump to white screen logic if there is no key pressed
// otherwise it will run black logic
@WHITE
D;JEQ

(BLACK)
// set fill bit to -1 to make black screen
@0
D=A
@1
D=D-A
@fill
M=D
@FILLSCRN
0;JMP

(WHITE)
// set fill bit to 0 to make black screen
@0
D=A
@fill
M=D
@FILLSCRN
0;JMP

(FILLSCRN)
// fill in the screen with whatever value is currently set in D
// initialize current addr to screen start
@SCREEN
D=A
@addr
M=D
(LOOP)
// fill current addr with fill value
@fill
D=M
@addr
A=M
M=D
// increment addr by 1
D=A
@1
D=D+A
@addr
M=D
//check for stop condition
@stop
D=M
@addr
D=D-M
@LOOP
D;JGT

@START
0;JMP

