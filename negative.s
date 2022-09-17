main:
    # load input into reg t0
    li   $v0, 5
    syscall
    move $t0, $v0

    # if 0, goto zero branch
    beq  $t0, 0, zero_branch
    
    # if >= goto positive branch
    bgez $t0, positive_branch

    # print negative 
    li  $a0, negative
    li  $v0, 4
    syscall
    
    # goto end
    b   end

positive_branch:
    # print positive
    li  $a0, positive
    li  $v0, 4
    syscall

    # goto end
    b   end

zero_branch:
    # print zero
    li  $a0, zero
    li  $v0, 4
    syscall

    # goto end
    b   end

end:
    #return
    li  $v0, 0
    jr  $ra

    data:
negative: .asciiz "Don't be so negative!\n"
zero: .asciiz "You have entered zero.\n"
positive: .asciiz "You have entered a positive number.\n"
