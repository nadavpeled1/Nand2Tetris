// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[3], respectively.)

// we will use a loop from R1 to 0(until equal),
//adding each time R0 to R2 and when the condition meet, we goto END

//first we need a counter i for th elooping
//i=R2 memory
//sum = 0
//LOOP:
//if (i=0) goto END
//i = i - 1
//D = D + R2
//END:

//i = R1 (we iterate until 0), init R2 to zero
@R1
D=M
@i
M=D
@R2
M=0

(LOOP)
//if (i=0) goto END
    @i
    D=M //D=i
    @END
    D;JEQ
//else: add another R1 to the mult
    @R0 //D = R1
    D=M
    @R2
    M=D+M //R2 = R2 + R1
    @i
    M=M-1 //i = i - 1
    @LOOP
    0;JMP


(END)//infinte end loop
    @END
    0;JMP