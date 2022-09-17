main:

    # print bird
    la $a0, bird
    li $v0, 4
    syscall

    # return 
    li $v0, 0
    jr	$ra
        

    data:
bird: .asciiz "  ___\n ('v')\n((___))\n ^   ^\n"
