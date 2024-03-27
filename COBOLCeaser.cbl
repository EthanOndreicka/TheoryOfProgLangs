PROGRAM-ID. CaesarCipher.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 Input-String           PIC X(100) VALUE "operation daybreak".
01 Max-Shift-Value        PIC 9(3) VALUE 26.
01 Shift-Value            PIC 9(3) VALUE 0.
01 Output-String          PIC X(100) VALUE SPACES.
01 Indexes                PIC 9(3).
01 Current-Char           PIC X.
01 Char-Value             PIC 9(3).

PROCEDURE DIVISION.
MAIN-LOGIC.
    STRING FUNCTION UPPER-CASE(Input-String) DELIMITED BY SIZE INTO Input-String

    PERFORM VARYING Shift-Value FROM 0 BY 1 UNTIL Shift-Value > Max-Shift-Value
        MOVE SPACES TO Output-String
        PERFORM VARYING Indexes FROM 1 BY 1 UNTIL Indexes > LENGTH OF Input-String
            MOVE Input-String(Indexes:1) TO Current-Char
            IF Current-Char IS ALPHABETIC
                IF Current-Char >= "A" AND Current-Char <= "Z"
                    COMPUTE Char-Value = FUNCTION MOD(((FUNCTION ORD(Current-Char) + Shift-Value - FUNCTION ORD("A"))), 26) + FUNCTION ORD("A")
                    MOVE FUNCTION CHAR(Char-Value) TO Current-Char
                END-IF
            END-IF
            MOVE Current-Char TO Output-String(Indexes:1)
        END-PERFORM
        DISPLAY "Caesar " Shift-Value " : " Output-String
    END-PERFORM

    STOP RUN.
