main:

    # print prompt
    li $a0, prompt
    li $v0, 4
    syscall
    
    # add first int to t0
    li $v0, 5
    syscall
    move $t0, $v0

    # add second int to t1s
    li $v0, 5
    syscall 
    move $t1, $v0 

    # print first no.
    move $a0, $t0
    li $v0, 1
    syscall

    # print plus sign
    li $a0, plus_sign
    li $v0, 4
    syscall

    # print second no.
    move $a0, $t1
    li $v0, 1
    syscall

    # print equals sign
    li $a0, equals_sign
    li $v0, 4
    syscall

    # add numbers and print
    add $t1, $t0
    move $a0, $t1
    li $v0, 1
    syscall

    # print newline
    li $a0, newline
    li $v0, 4
    syscall

    # return 
    li $v0, 0 
    jr $ra

    data:
prompt: .asciiz "Please enter the number of students and tutors: "
newline: .asciiz "\n"
plus_sign: .asciiz " + "
equals_sign: .asciiz " = " 
