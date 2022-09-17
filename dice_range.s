# reads the number of sides on a set of dice + how many of them are being rolled. 
# outputs the range of possible totals that these dice can produce as well as the average value.

main:
    # print first_prompt
    la   $a0, first_prompt
    li   $v0, 4
    syscall

    # store no. of sides in reg t0
    li   $v0, 5
    syscall
    move $t0, $v0
    
    # print second prompt
    la   $a0, second_prompt
    li   $v0, 4
    syscall

    # store no. of dice being rolled in reg t1
    li   $v0, 5
    syscall
    move $t1, $v0

    # goto error branch if sides == 0
    beq  $t0, 0, error

    # goto error branch if no. dice == 0
    beq  $t1, 0, error
    
    # goto error if negative
    bgez $t0, first_ok 
    b    error

first_ok:

    # goto error if negative
    bgez $t1, continue
    b    error

continue:
    # print dice range sentence
    la   $a0, range
    li   $v0, 4
    syscall

    # print smallest range
    move $a0, $t1
    li   $v0, 1
    syscall

    # print "to"
    la   $a0, to
    li   $v0, 4
    syscall

    # store max value in reg t2
    mult $t1, $t0
    mflo $t2

    # print max value
    move $a0, $t2
    li   $v0, 1
    syscall

    #print fullstop
    la   $a0, fullstop
    li   $v0, 4
    syscall

    # calculate average value ((t2 + t1)/2)
    add  $t2, $t2, $t1
    div $t2, 2
    mflo $t3

    # c prompts
    la   $a0, average
    li   $v0, 4
    syscall

    # print average value
    move $a0, $t3
    li $v0, 1
    syscall

    # print fullstop
    la   $a0, fullstop
    li   $v0, 4
    syscall

    b end

error:
    # print error
    la   $a0, error_message
    li   $v0, 4
    syscall 

    b end

end:
    # return
    li   $v0, 0
    jr.  $ra


    data:
first_prompt: .asciiz "Enter the number of sides on your dice: "
second_prompt: .asciiz "Enter the number of dice being rolled: "
range: .asciiz "Your dice range is "
to: .asciiz " to "
fullstop: .asciiz ".\n"
average: .asciiz "The average value (rounded down) is "
error_message: .asciiz "These dice will not produce a range.\n"
