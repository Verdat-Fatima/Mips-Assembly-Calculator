.data
result: .asciiz "Result :"
choice: .asciiz "Enter your choice:"
num1: .asciiz "Enter first number:"
num2: .asciiz "Enter second number:"
prompt:.asciiz "--- Calculator ---\n 1. Add\n 2. Subtract\n 3. Multiply\n 4. Divide\n 5. Exit\n"
.text
#display prompt
li $v0,4
la $a0,prompt
syscall

#display choice
li $v0,4
la $a0,choice
syscall

#input choice
li $v0,5
syscall
move $t0,$v0 #store choice in $t0

beq $t0,5,EXIT #if $t0=5 goto EXIT no need to run rest of program
#Else run rest of program

#display num1
li $v0,4
la $a0,num1
syscall

#input num1
li $v0,5
syscall
move $t1,$v0 #store num1 in $t1

#display num2
li $v0,4
la $a0,num2
syscall

#input num2
li $v0,5
syscall
move $t2,$v0 #store num2 in $t2

check:
beq $t0,1,ADD #if $t0=1 goto ADD
beq $t0,2,SUB #if $t0=2 goto SUB
beq $t0,3,MUL #if $t0=3 goto MUL
beq $t0,4,DIV #if $t0=4 goto DIV
beq $t0,5,EXIT #if $t0=5 goto EXIT

ADD:
add $t3,$t2,$t1 #add num1 and num2 and store in $t3

#Display result
li $v0,4
la $a0,result
syscall

li $v0,1
move $a0,$t3
syscall

j EXIT

SUB:
sub $t3,$t2,$t1 #sub num1 and num2 and store in $t3

#Display result
li $v0,4
la $a0,result
syscall

li $v0,1
move $a0,$t3
syscall

j EXIT

MUL:
mul  $t3,$t2,$t1 #mul num1 and num2 and store in $t3

#Display result
li $v0,4
la $a0,result
syscall

li $v0,1
move $a0,$t3
syscall

j EXIT

DIV:
div $t3,$t1,$t2 #div num1 and num2 and store in $t3

#Display result
li $v0,4
la $a0,result
syscall

li $v0,1
move $a0,$t3
syscall

j EXIT

EXIT:
li $v0,10
syscall