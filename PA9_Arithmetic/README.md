# Coding Assingment

## Primes.sln
Create the Primes solution in VS. In main.asm, call the isPrime procedure various times. The isPrime procedure determined whether a number is a prime number 
or not. When a call to isPrime is placed, pass it the offset of nums and the corresponding offset of primes. If the element of nums is not a prime number, 
then set the corresponding byte in primes to zero. Thus, primes (the array) will contain a one where a prime number is situated in nums and a zero where the 
corresponding number is not a prime number.

## GCD.sln
Create the GCD solution in VS. In main.asm, call the greatestComDiv procedure once. The greatestComDiv procedure will calculate and store in memory the 
greatest common divisor between two numbers. If there is no greatest common divisor for num1 and num2, then set gcd to 1.

## Reverse.sln
Create the Reverse solution in VS. In main.asm, call the reverse procedure once. The reverse procedure will reverse a number by using the remainder when 
dividing by 10 to capture the last digit of the number. The number is then progressively reduced by dividing the number by 10 on each iteration. 
Only consider unsigned integers that DO NOT end with zero.
