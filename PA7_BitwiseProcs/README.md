# Coding Assingment

## Encrypt.sln
Create the Encrypt solution in VS. In main.asm, call the encrypt procedure twice. The first call to encrypt will encrypt a message using the XOR 
instruction and an array with keys (see data segment below). The first byte in the message, "b" will be XORed with the first element in the key, 12h. 
The second value in message, "i" will be XORed with the second element in the key, 34h. Both the String and the array of keys will be traversed simultaneously 
until the end of the String is reached. When the last key is reached, the application should move back to the first key in the array to encrypt the next character 
in the String. The second call to encrypt will "decrypt" the encrypted message, such that the original message is restored in a separate location in memory. 
The same key that was used for encryption should be used for decryption.

## ChangeCase.sln
Create the ChangeCase solution in VS. In main.asm, call the toLowerCase and toUpperCase procedures such that the alphabetical characters in a String are 
converted to lower case letters and upper case letters, respectively. Use OR bitwise instruction when converting a letter from uppercase to lowercase. 
Use the AND bitwise instruction when converting a letter from lowercase to uppercase. The data segment is shown below. 

## AbsoluteValue.sln
Create the AbsoluteValue solution in VS. In main.asm, call the absoluteValue procedure traverses an array and replaces every element with its absolute value. 
Use the NOT bitwise instruction to convert a number from negative to positive.
