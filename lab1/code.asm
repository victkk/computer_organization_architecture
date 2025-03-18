	.file	1 "code.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	sumn
	.set	nomips16
	.set	nomicromips
	.ent	sumn
	.type	sumn, @function
sumn:
	.frame	$fp,16,$31		# vars= 8, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	addiu	$sp,$sp,-16
	sw	$fp,12($sp)
	move	$fp,$sp
	sw	$4,16($fp)
	sw	$5,20($fp)
	sw	$0,0($fp)
	sw	$0,4($fp)
	b	$L2
$L3:
	lw	$2,4($fp)
	sll	$2,$2,2
	lw	$3,16($fp)
	addu	$2,$3,$2
	lw	$2,0($2)
	lw	$3,0($fp)
	addu	$2,$3,$2
	sw	$2,0($fp)
	lw	$2,4($fp)
	addiu	$2,$2,1
	sw	$2,4($fp)
$L2:
	lw	$3,4($fp)
	lw	$2,20($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L3
	lw	$2,0($fp)
	move	$sp,$fp
	lw	$fp,12($sp)
	addiu	$sp,$sp,16
	j	$31
	.end	sumn
	.size	sumn, .-sumn
	.rdata
	.align	2
$LC0:
	.ascii	"The result is: %d\000"
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,80,$31		# vars= 48, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	addiu	$sp,$sp,-80
	sw	$31,76($sp)
	sw	$fp,72($sp)
	move	$fp,$sp
	.cprestore	16
	la	$2,__stack_chk_guard
	lw	$2,0($2)
	sw	$2,68($fp)
	li	$2,9			# 0x9
	sw	$2,36($fp)
	li	$2,7			# 0x7
	sw	$2,40($fp)
	li	$2,15			# 0xf
	sw	$2,44($fp)
	li	$2,19			# 0x13
	sw	$2,48($fp)
	li	$2,20			# 0x14
	sw	$2,52($fp)
	li	$2,30			# 0x1e
	sw	$2,56($fp)
	li	$2,11			# 0xb
	sw	$2,60($fp)
	li	$2,18			# 0x12
	sw	$2,64($fp)
	li	$2,8			# 0x8
	sw	$2,28($fp)
	addiu	$2,$fp,36
	lw	$5,28($fp)
	move	$4,$2
	jal	sumn
	sw	$2,32($fp)
	lw	$5,32($fp)
	la	$4,$LC0
	jal	printf
	move	$2,$0
	move	$4,$2
	la	$2,__stack_chk_guard
	lw	$3,68($fp)
	lw	$2,0($2)
	beq	$3,$2,$L7
	jal	__stack_chk_fail
$L7:
	move	$2,$4
	move	$sp,$fp
	lw	$31,76($sp)
	lw	$fp,72($sp)
	addiu	$sp,$sp,80
	j	$31
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
