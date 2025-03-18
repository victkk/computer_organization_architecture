    .globl fib
    .globl main

    .text

fib:
    bgt     $a0, 1, fib_recurse
    li      $v0, 1
    jr      $ra

fib_recurse:
    subu    $sp, $sp, 32
    sw      $ra, 28($sp)
    move    $t0, $a0
    sw      $t0, 20($sp)
    sub     $a0, $t0, 1
    jal     fib
    move    $t1, $v0
    lw      $t0, 20($sp)
    sw      $t1, 16($sp)
    sub     $a0, $t0, 2
    jal     fib
    move    $t2, $v0
    lw      $t1, 16($sp)
    add     $v0, $t1, $t2
    lw      $ra, 28($sp)
    addu    $sp, $sp, 32
    jr      $ra

main:
    li      $v0, 5
    syscall
    move    $a0, $v0
    jal     fib
    move    $a0, $v0
    li      $v0, 1
    syscall
    li      $v0, 10
    syscall
