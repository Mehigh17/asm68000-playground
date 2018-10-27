    ORG     $1000
    
START:
    LEA     message1,A1     ; Put the string address in the address register A1
    MOVE    #14,D0          ; Display task for the trap 15
    TRAP    #15             ; Call the trap 15
    
    MOVE    #4,D0           ; Read number from keyboard task for trap 15
    TRAP    #15             ; Call the trap 15
    MOVE    D1,D2           ; Store the result in register D2
    
    MOVE    #14,D0          ; Display task for the trap 15
    TRAP    #15             ; Call the trap 15
    
    MOVE    #4,D0           ; Read number from keyboard task for trap 15
    TRAP    #15             ; Call the trap 15
    MOVE    D1,D3           ; Store the result in register D3
    
LOOP:
    LEA     message4,A1     ; Put message3 address in A1 register
    MOVE    #14,D0          ; Display string pointed at address A1
    TRAP    #15             ; Call the trap 15
    
    MOVE    #5,D0           ; Ask for one ASCII character
    TRAP    #15             ; Call the trap 15
    
    CMP.B   #'-',D1         ; Compare - to D1 register
    BEQ     DISPLAYSUB      ; Branch to DISPLAYSUM if true
    CMP.B   #'+',D1         ; Compare + to D1 register
    BEQ     DISPLAYSUM      ; Brabch to DISPLAYSUB if true
    
    LEA     message5,A1     ; Put the invalid operation string in the register A1
    MOVE    #14,D0          ; Display task for the trap 15
    TRAP    #15             ; Call the trap 15
    
    BRA LOOP                ; Go back to the beginning if everything was false
    
DISPLAYSUM:
    LEA     message2,A1     ; Put the result string address in the register A1
    MOVE    #14,D0          ; Display task for the trap 15
    TRAP    #15             ; Call the trap 15
    
    ADD     D2,D3           ; Sum D2 to D3
    MOVE    D3,D1           ; Put the result in D1
    MOVE    #3,D0           ; Display number task for trap 15
    TRAP    #15             ; Call the trap 15
    SIMHALT
    
DISPLAYSUB:
    LEA     message3,A1     ; Put the result string address in the register A1
    MOVE    #14,D0          ; Display task for the trap 15
    TRAP    #15             ; Call the trap 15
    
    SUB.L   D3,D2           ; Substitute D2 to D3
    
    MOVE.L  D2,D1           ; Put the result in D1
    MOVE    #3,D0           ; Display number task for trap 15
    TRAP    #15             ; Call the trap 15
    SIMHALT

message1    DC.B    'Number: ',0
message2    DC.B    $0A,$0D,'The sum is: ',0
message3    DC.B    $0A,$0D,'The difference is: ',0
message4    DC.B    $0A,$0D,'Operation: ',0
message5    DC.B    $0A,$0D,'Invalid operation.',0

    END     START
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
