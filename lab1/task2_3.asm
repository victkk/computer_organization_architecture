# File:         p1.asm
# Written by:   Larry Merkle, Dec. 4, 2002
# Modified by:  J.P. Mellor, 3 Sep. 2004
# Modified by:  J.P. Mellor, 2 Dec. 2008
#
# This file contains a MIPS assembly language program that uses only the 
# following instructions:
#
#   ori rt, rs, imm	- Puts the bitwise OR of register rs and the
#			  zero-extended immediate into register rt
#   add rd, rs, rt	- Puts the sum of registers rs and rt into register rd.
#   syscall		- Register $v0 contains the number of the system
#			  call provided by SPIM (when $v0 contains 10,
#			  this is an exit statement).
#
# It calculates 40 + 17.
#
# It is intended to help CSSE 232 students familiarize themselves with MIPS
# and SPIM.
				
	.globl main		# Make main globl so you can refer to
				# it by name in SPIM.

	.text			# Text section of the program
				# (as opposed to data).

main:				# Program starts at main.
    la $a0, quest1_msg
	li $v0, 4
	syscall
	li $v0, 5 # load syscall read_int into $v0.
	syscall # make the syscall.
	move $t2, $v0
    la $a0, quest2_msg
	li $v0, 4
	syscall
	li $v0, 5 # load syscall read_int into $v0.
	syscall # make the syscall.
	move $t3, $v0
	add	$t4, $t2, $t3	
	la $a0, answer1_msg
	li $v0, 4
	syscall
	move $a0 $t2
	li $v0, 1
	syscall
	la $a0, answer2_msg
	li $v0, 4
	syscall
	move $a0 $t3
	li $v0, 1
	syscall
	la $a0, answer3_msg
	li $v0, 4
	syscall
	move $a0 $t4
	li $v0, 1
	syscall
	la $a0, quest3_msg
	li $v0, 4
	syscall
	li $v0, 5 # load syscall read_int into $v0.
	syscall # make the syscall.
	move $t2, $v0
	beq $0 $t2 main


	ori	$0, $0, 40	# Register $0 appears to get 40 ...
	ori	$t4, $0, 0	# ... but it really doesn't
	ori	$v0, $0, 10	# Prepare to exit
	syscall			#   ... Exit.

	.data
	quest1_msg: .asciiz "Please enter 1st number: "
	quest2_msg: .asciiz "Please enter 2nd number: "
	answer1_msg: .asciiz "The result of "
	answer2_msg: .asciiz " & " 
	answer3_msg: .asciiz " is: "
	quest3_msg: .asciiz "\nDo you want to try another(0—continue/1—exit)"