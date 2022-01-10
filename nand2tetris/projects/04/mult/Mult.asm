// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

// initialize i to be 0
@i
M=0

// initialize sum to be 0
@sum
M=0

(LOOP)
// check if i is greater than R1
@i
D=M
@R1
D=D-M
// if so jump to end
@STOP
D;JEQ

// access R0
@R0
D=M
// add R0 to current sum
@sum
D=D+M
// store new sum in memory
M=D
// increment counter
@i
M=M+1
// jump to start of loop to begin again
@LOOP
0;JMP

(STOP)
// load sum into R2
@sum
D=M
@R2
M=D

(END)
@END
0;JMP