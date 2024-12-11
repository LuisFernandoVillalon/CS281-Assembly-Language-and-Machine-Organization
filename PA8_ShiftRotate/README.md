# Coding Assingment

## RotateEncrypt.sln
Create the RotateEncrypt solution in VS. In main.asm, call the encrypt and decrypt procedures. The call to encrypt will encrypt a message using the ROL 
instruction and an array with keys (see data segment below). The first byte in the message, "t" will be ROL with the first element in the key, "6". The 
second value in message, "e" will be ROL with the second element in the key, "4". Both the String and the array of keys will be traversed simultaneously 
until the end of the String is reached. When the last key is reached, the application should move back to the first key in the array to encrypt the next 
character in the String. The call to decrypt will "decrypt" the encrypted message, such that the original message is restored in a separate location in 
memory. The same key that was used for encryption should be used for decryption. For decryption, use the ROR instruction. Note, ECX is the loop counter 
but it is also the second operand to the ROL and ROR instructions. (i.e. CL = 3, ROL BL, CL would rotate every bit in BL 3 bits to the left)

## ShiftMultiply.sln
Create the ShiftMultiply solution in VS. In main.asm, call the shiftMultiply procedure such that it returns the product of two unsigned integers. The 
integers to multiply are in EAX and EBX and their product is returned in EDX. To multiply the two integers, use SHR and SHL bitwise instructions.
