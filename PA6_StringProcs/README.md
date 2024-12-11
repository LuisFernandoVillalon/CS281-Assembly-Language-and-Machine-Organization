# Coding Assingment

## CharAt.sln
 Create the CharAt solution in VS. In main.asm, call the charAt procedure which returns the character at a specified index for a particular String. 
 Character is returned in bl.

## Contains.sln
Create the Contains solution in VS. In main.asm, call the contains procedure which returns 1 or 0, for true or false, respectively. The offset of two 
strings are passed to contains in eax and ebx. If the string pointed to by eax contains the string pointed to by ebx, then contains returns 1, else 
contains returns 0 in ecx. Do not pass the length of either string to the procedure. Instead, have contains call the stringLen procedure you wrote in 
the previous assignment. You can copy over the procedure from the StringLen solution you wrote. 

## EndsWith.sln
Create the EndsWith solution in VS. In main.asm, call the endsWith procedure which 1 or 0, for true or false, respectively. The offset of two strings 
are passed to endsWith in eax and ebx. If the string pointed to by eax ends with the substring pointed to by ebx, then endsWith returns 1, else endsWith 
returns 0 in ecx. Do not pass the length of either string to the procedure. Instead, have endsWith call the stringLen procedure you wrote in the previous 
assignment. You can copy over the procedure from the StringLen solution you wrote.
