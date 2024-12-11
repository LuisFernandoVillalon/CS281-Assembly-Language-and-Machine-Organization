# Coding Assingment

## ExpandArray.sln
Create the ExpandArray solution in VS. In main.asm, write the x86 assembly code that takes an array of WORD elements and copies its elements to an 
array of DWORD elements. Additionally, your program takes the original array of WORD elements and copies its elements (the low byte, specifically) 
to an array of BYTE elements. Use the PTR directive and the MOVZX, appropriately, when copying to the elements to the DWORD array. Implement two loops 
to copy to the two different locations in memory.

## AddElements.sln
Create the AddElements solution in VS. In main.asm, write the x86 assembly code that traverses a "two-dimensional" array of WORD elements and adds 
all the elements. The sum of the elements is stored in memory. A two-dimensional array in assembly is data that is stored sequentially in memory. 
Thus, define two size dimensions (rows and cols) to traverse the first four elements in the array and add them, then the next four elements and add 
them to the first sum, and then the next four elements and add them to the total sum. Initialize all elements to 0F000h (leading zero is necessary 
because first digit can't be a letter) which corresponds to 61,440 decimal. The sum of all twelve elements is B4000h (notice the need for a fifth hex digit) 
which corresponds to 737,280 decimal. Use nested looping in your implementation. Move ECX to count to preserve the register for the outer loop when the 
inner loop is engaged. Additionally, use MOVZX, PTR, LOOP, OFFSET appropriately in your implementation.

## ExchangePairs.sln
Create the ExchangePairs solution in VS. In main.asm, write the x86 assembly code that swaps adjacent elements of an array in place. For example, 
an array initialized with the elements, {10h, 20h, 30h, 40h, 50h, 60h} would be transformed to the following array, {20h, 10h, 40h, 30h, 60h, 50h}. 
Such that element "i" is swapped with element "i+1", and element "i+2" is swapped with element "i+3". Implement a loop to traverse the array two elements at a time.

## ShiftElements.sln
Create the ShiftElements solution in VS. In main.asm, write the x86 assembly code that shifts the elements within an array one position downstream (in memory). 
The last element in the array wraps around to the first position in the array. For example, the array, {10Ah, 20Bh, 30Ch, 40Dh} would be shifted to the 
following array, {40Dh, 10Ah, 20Bh, 30Ch}. Implement a loop to traverse the array and perform the shift.
