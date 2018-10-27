    ORG     $1000
    
START:
    LEA     message1,A1     ; Put the string address in the address register A1
    MOVE    #14,D0          ; Display task for the trap 15
    TRAP    #15             ; Call the trap 15
    
    MOVE    #4,D0           ; Read number from keyboard task for trap 15
    TRAP    #15             ; Call the trap 15
    MOVE.L  D1,D2           ; Store the result in register D2
    
    MOVE    #14,D0          ; Display task for the trap 15
    TRAP    #15             ; Call the trap 15
    
    MOVE    #4,D0           ; Read number from keyboard task for trap 15
    TRAP    #15             ; Call the trap 15
    MOVE.L  D1,D3           ; Store the result in register D3
    
    LEA     message2,A1     ; Put the result string address in the register A1
    MOVE    #14,D0          ; Display task for the trap 15
    TRAP    #15             ; Call the trap 15
    
    ADD     D2,D3           ; Sum D2 to D3
    MOVE.L  D3,D1           ; Put the result in D1
    MOVE    #3,D0           ; Display number task for trap 15
    TRAP    #15             ; Call the trap 15
    
    SIMHALT                 ; Halt the simulator
    
message1    DC.B    'Number: ',0
message2    DC.B    'The sum is: ',0
    
    END     START

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
