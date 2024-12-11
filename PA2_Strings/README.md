# Coding Assingment

## CopyString.sln
Create the CopyString solution in VS. In main.asm, write the x86 assembly code that copies a null-terminated String in memory to another location in memory. 
The String is an array of byte elements consisting of characters and symbols that is null-terminated. Use the loop instruction to traverse the array of bytes 
as you're copying one String from memory to register, and then from register back to memory (1 byte at a time). Consider using a symbolic constant and the 
current location counter to capture the length of the String to be copied (str1). Additionally, consider using the DUP operator to initialize the second 
array (str2) in memory to an adequate number of bytes.

## ReverseString.sln
Create the ReverseString solution in VS. In main.asm, write the x86 assembly code that copies a null-terminated String in memory to another location in 
memory in reverse order. The String is an array of byte elements consisting of characters and symbols that is null-terminated. Use the loop instruction 
to traverse the array of bytes as you're copying one String from memory to register, and then from register back to memory (1 byte at a time). Consider 
using a symbolic constant and the current location counter to capture the length of the String to be copied (str1). Additionally, consider using the DUP
operator to initialize the second array (str2) in memory to an adequate number of bytes. 

## ConvertString.sln
Create the ConvertString solution in VS. In main.asm, write the x86 assembly code that traverses a null-terminated String of bytes whose elements are 
numeric characters (i.e. "1499502445"). The code then copies the String array to a separate array whose elements are byte integer elements whose values 
correspond to the numeric characters (i.e. 1, 4, 9, 9, 5, 0, 2, 4, 4, 5). Use the loop instruction to traverse the array of bytes as you're copying one 
String from memory to register, then subtract the appropriate hexadecimal value to convert "4" to 4 before copying the byte back to memory. Look at the 
ASCII tableLinks to an external site. to see what numeric characters are encoded to. Consider using a symbolic constant and the current location counter 
to capture the length of the String to be converted (str1). Additionally, consider using the DUP operator to initialize the second array (arr1) in memory 
to an adequate number of bytes.

## CapString.sln
Create the CapString solution in VS. In main.asm, write the x86 assembly code that traverses a null-terminated String of bytes whose elements are lower 
case letters. The program will capitalize each letter of the String in place. Use the loop instruction to traverse the array of bytes as you're copying 
one byte from memory to register, then subtract the appropriate hexadecimal value to convert "a" to "A" before copying the byte back to memory. Look at 
the ASCII tableLinks to an external site. to see what alphabetical characters are encoded to. Consider using a symbolic constant and the current location 
counter to capture the length of the String to be capitalized (str1).
