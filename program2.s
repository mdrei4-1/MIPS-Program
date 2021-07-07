.data
.strA:	.asciiz "Please enter your choice to skip numbers (1-4)\n"
Numbers:	.byte 100, -7, 11, 25, -66, 99, -1, 34, 12, 22, -2, -7, 100, 11, 4, 67, 2, -90, 22, 2, 56, 3, -89, 12, -10, 21, 10, -25, -6, 9, 111, 34, 12, 22, -2, -17, 100, 111, -4, 7, 14, -19, -2, 29, 36, 31, -79, 2

.text
main: # Your fully commented program starts here.
        # Initial variables defined:
        addi $v1, $0, 0 #variable that controls current position in Numbers
        addi $t1, $0, 0 #variable that controls current total value
        addi $t0, $0, 0 #variable that controls current value in Numbers
        # Set up initial user input:
loop1:  li $v0, 4 #set up syscall for print string
        la $a0, .strA #string to print
        syscall
        li $v0, 5 #set up syscall for user input
        syscall
        bgt $v0, 4, loop1 #loop back if >4
        blt $v0, 1, loop1 #loop back if <1
        # BEGIN MAIN LOOP
loop2:	lb $t0, Numbers($v1) #grab the current value in Numbers
	add $t1, $t1, $t0 #add the current value to the total value
	add $v1, $v1, $v0 #add the skip value to the current position
	blt $v1, 48, loop2 #loop back if <48
	#end of program stuff
	li $v0, 1 #set up syscall for printing final int
        la $a0, ($t1) #int to print
        syscall
        li $v0, 10 #set up syscall to end program
        syscall
