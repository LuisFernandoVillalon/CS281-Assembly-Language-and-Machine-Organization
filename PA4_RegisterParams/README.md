# Coding Assingment

## SumElements.sln
Create the SumElements solution in VS. In main.asm, call the sumElements procedure which returns the sum of the elements of a dword array. Thus, 
if the array consists of decimal integers [12, 26, 41, 52, 62, 70], then the sum of all elements is 263. Pass all necessary arguments to sumElements 
through registers. Return the sum of the elements in ebx. Preserve the registers by pushing them onto the stack before calling sumElements and popping 
after the procedures executes.

## IndexOf.sln
Create the IndexOf solution in VS. In main.asm, call the indexOf procedure which returns the index of an element of a word array. Thus, if the array 
consists of signed decimal integers [-5, 8, 13, 16, 29, 33], then a call to indexOf would return 3 if the element to search is 16. If the element is 
not in the array, then indexOf should return -1 in edx. Pass all necessary arguments to indexOf through registers. Preserve the registers by pushing 
them onto the stack before calling indexOf and popping after the procedures executes. 

## MaxValue.sln
Create the MaxValue solution in VS. In main.asm, call the maxValue procedure which returns the value of the biggest element in a byte array. Thus, 
if the array consists of signed decimal integers [-23, 7, -10, 56, 22, 45], then a call to maxValue would return 56. Pass all necessary arguments to 
maxValue through registers. Preserve the registers by pushing them onto the stack before calling maxValue and popping after the procedures executes. 

## CountChars.sln
Create the CountChars solution in VS. In main.asm, call the countChars procedure which returns the number of times a predetermined character shows 
up in a String. Thus, if a String is initialized to "Happy Halloween" and the character to look for is 'p', then countChars will return 2 in edx. 
Pass all necessary arguments to countChars through registers. Preserve the registers by pushing them onto the stack before calling countChars and 
popping after the procedures executes.
