```assembly
includelib ..\kernel32.lib      ;Identifies external library 'kernel32.lib' that contains Windows API

ExitProcess   proto             ;Declares 'ExitProcess' as an external procedure 
                                ;ExitProcess: Returns CPU control to Windows

.code                           ;Code Section begins
main    proc                    ;Start of procedure 'main'
        mov     rcx, 10         ;Loads exit status 10 into RCX register
        call    ExitProcess     ;Jumps to ExitProcess function 

main    endp                    ;End of procedure 'main'
        end                     ;Marks the end of program
```