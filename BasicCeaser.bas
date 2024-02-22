' Encrypt function
FUNCTION Encrypt(inputString AS STRING, shiftAmount AS INTEGER) AS STRING
    DIM AS STRING cipherText
    cipherText = ""
    DIM AS INTEGER i, newChar
    FOR i = 1 TO LEN(inputString)
        DIM AS STRING ch
        ch = MID(inputString, i, 1)
        IF ch >= "A" AND ch <= "Z" THEN
            ' Encrypt the character using the specified shift amount
            newChar = (ASC(ch) - ASC("A") + shiftAmount) MOD 26 + ASC("A")
            cipherText = cipherText + CHR(newChar)
        ELSE
            cipherText = cipherText + ch
        END IF
    NEXT i
    ' Return the encrypted text
    RETURN cipherText
END FUNCTION

' Decrypt function
SUB Solve(inputString AS STRING, maxShiftValue AS INTEGER)
    DIM AS INTEGER i
    DIM AS STRING encryptedText
    ' Print the original input string with the maximum shift value
    PRINT "Caesar "; maxShiftValue; ": "; inputString
    ' Iterate through each shift
    FOR i = maxShiftValue - 1 TO 0 STEP -1
        encryptedText = Encrypt(inputString, i)
        ' Print the decrypted string with the current shift value
        PRINT "Caesar "; i; ": "; encryptedText
    NEXT i
END SUB

' Main program
DIM AS STRING inputString
inputString = "hal"
' Convert string to upper
inputString = UCASE(inputString)
' Call Solve function
Solve(inputString, 26)
