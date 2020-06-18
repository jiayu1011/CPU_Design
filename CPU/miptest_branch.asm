# following code test blez instruction          addr     machine
blez:   addi $2, $0, 1      # initialize $2 = 1   0     20020001
        addi $3, $0, 1      # initialize $3 = 1   4     20030001
        addi $7, $0, 3      # initialize $7 = 3   8     20070003
loop1:  add  $8, $2, $3	    # $8 <= $2 + $3       c     00434020
	add  $2, $0, $3     # $2 <= $3            10    00031020
	add  $3, $0, $8     # $3 <= $8            14    00081820
	addi $7, $7, 1      # $7 <= $7 + 1        18    20e70001
	addi $6, $7, -10     #                    1c    20e6fff6
	blez $6, loop1       #                    20    18c0fffa
# the result after sw should be $8 = 0x37

# following code test bgez instruction
bgez:   addi $2, $0, 1      # initialize $2 = 1  24     20020001
        addi $3, $0, 1      # initialize $3 = 1  28     20030001
        addi $7, $0, 10     # initialize $7 = 10 2c     2007000a
loop2:  add  $8, $2, $3	    # $8 <= $2 + $3      30     00434020
	add  $2, $0, $3     # $2 <= $3           34     00031020
	add  $3, $0, $8     # $3 <= $8           38     00081820
	addi $7, $7, -1     # $7 <= $7 - 1       3c     20e7ffff
	addi $6, $7, -3     #                    40     20e6fffd          
	bgez $6, loop2      #                    44     04c1fffa
# the result after sw should be $8 = 0x37

# following code test bgtz instruction
bgtz:   addi $2, $0, 1      # initialize $2 = 1  48     20020001
        addi $3, $0, 1      # initialize $3 = 1  4c     20030001
        addi $7, $0, 11     # initialize $7 = 11 50     2007000b
loop3:  add  $8, $2, $3	    # $8 <= $2 + $3      54     00434020
	add  $2, $0, $3     # $2 <= $3           58     00031020
	add  $3, $0, $8     # $3 <= $8           5c     00081820
	addi $7, $7, -1     # $7 <= $7 - 1       60     20e7ffff
	addi $6, $7, -3     #                    64     20e6fffd
	bgtz $6, loop3      #                    68     1cc0fffa
# the result after sw should be $8 = 0x37

# following code test blez instruction
bltz:   addi $2, $0, 1      # initialize $2 = 1  6c     20020001
        addi $3, $0, 1      # initialize $3 = 1  70     20030001
        addi $7, $0, 3      # initialize $7 = 1  74     20070003
loop4:  add  $8, $2, $3	    # $8 <= $2 + $3      78     00434020
	add  $2, $0, $3     # $2 <= $3           7c     00031020
	add  $3, $0, $8     # $3 <= $8           80     00081820
	addi $7, $7, 1      # $7 <= $7 + 1       84     20e70001
	addi $6, $7, -11    #                    88     20e6fff5
	bltz $6, loop4      #                    8c     04c0fffa
# the result after sw should be $8 = 0x37    

end:	addi $8, $0, -1     # end                90     2008ffff

