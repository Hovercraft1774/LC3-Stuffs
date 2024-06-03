;read string from memory and write to screen

Initialization
    .ORIG x3000 0B AND R2,R2,#0 ;R2 is counter, initialize to 0
    LD R3,PTR ;R3 is pointer to characters 
    TRAP x23 ;R0 gets character input
    LDR R1,R3,#0 ;R1 gets the next character 

Test    ADD     R4,R1,#-4       ;Test for EOT
        BRz     OUTPUT          ;If done, prepare the output

OUTPUT LD   R0, ASCII
    ADD R0,R0,R2    ;convert binary to ASCII
    TRAP x21        ; ASCII code in R0 is displayed 
    
    LEA R0, OTSTR   ;Load address to output message string
    PUTS            ;output string (TRAP x22)
    
    LD  R0, PTR     ;load ptr to data string
    PUTS            ;Display origional data string
    TRAP    x25     ;Halt Machine (Halt)
    
    
    
    
    
    .ORIG x4000
HELLO .STRINGZ    "I hate this"



