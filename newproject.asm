.data
arr1: .byte '1','|','2','|','3','!'
arr2: .byte '4','|','5','|','6','!'
arr3: .byte '7','|','8','|','9','!'
arrhash: .asciiz  "-+-+-"
arrspace: .asciiz "\n"

.text
	####################################################################################
	######################################## print begins ################################
	######################################################################################
la    $s0, arr1 
la $s1, arr1
addi $s1,$s1, 5

la    $s2, arr2 
la $s3, arr2
addi $s3,$s3, 5

la    $s4, arr3
la $s5, arr3 
addi $s5,$s5, 5

loop1:

beq $s0, $s1, newline1
       
lb    $a0, ($s0)   # hexdigits[10] (which is '0')
li    $v0, 11                 # I will assume syscall 11 is printchar (most simulators support it)
syscall                       # issue a system call
addi $s0, $s0, 1               #increase index i by one
j     loop1

newline1: la $a0, arrspace
		li $v0, 4
		syscall
j hash1

hash1: la $a0, arrhash
	li $v0, 4
		syscall
	j newline2

newline2: la $a0, arrspace
		li $v0, 4
		syscall
j loop2	

loop2:

beq $s2, $s3, newline3
       
lb    $a0, ($s2)   # hexdigits[10] (which is '0')
li    $v0, 11                 # I will assume syscall 11 is printchar (most simulators support it)
syscall                       # issue a system call
addi $s2, $s2, 1               #increase index i by one
j     loop2


newline3: la $a0, arrspace
		li $v0, 4
		syscall
j hash2

hash2: la $a0, arrhash
	li $v0, 4
		syscall
	j newline4

newline4: la $a0, arrspace
		li $v0, 4
		syscall
j loop3	

loop3:
beq $s4, $s5, exit
       
lb    $a0, ($s4)   # hexdigits[10] (which is '0')
li    $v0, 11                 # I will assume syscall 11 is printchar (most simulators support it)
syscall                       # issue a system call
addi $s4, $s4, 1               #increase index i by one
j loop3

exit: li $v0,10
syscall

	####################################################################################
	######################################## print ends ################################
	######################################################################################
