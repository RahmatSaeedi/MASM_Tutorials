includelib          ..\kernel32.lib

GetStdHandle        proto                   ; Writes I/O handels
WriteConsoleA       proto                   ; Writes to Command Window
ExitProcess         proto                   ; Returns CPU control to Windows
SetConsoleTextAttribute proto               ; Enables color coding the text & background
Console             equ     -11             ; Precompiller directive: assigns a value to a symbol
                                            ; It is the device code for console text output
                                            ; -11: The standard output device. Initially, this is the active console screen buffer, CONOUT$.
                                            ; https://docs.microsoft.com/en-us/windows/console/getstdhandle




.code                                                   ; Begins code section
main        proc                                        ; Start of procedure name Main
            sub         rbp, 40                         ; reserve 40 bytes of Shadow space



            ; Get the handel for console display monitor I/O streams
            mov         rcx, Console                    ; Sets RCX to -11
            call        GetStdHandle                    ; Returns handle in register RAX
            mov         stdout, rax                     ; Store the handel in memory location named 'stdout'

            
            ; Set background and forground color
            mov         rcx, stdout                     ; Pass the handel stored ate memory location named 'stdout' as first argument
            mov         rdx, 1fh                        ; Pass the desired color code, Background = 0x1 = Blue, forground =0xf=Bright white
            call        SetConsoleTextAttribute         


            ; Displays 'Hello World'
            mov         rcx, stdout                     ; Pass the handel as first argument
            lea         rdx, msg                        ; Message location as the second argument
            mov         r8, lengthof msg                ; Length of message as the third argument
            lea         r9, nBytesWritten               ; return value storage location as the forth argument
            call        WriteConsoleA
            
            
            
            ; Resets background and forground color
            mov         rcx, stdout                     ; Pass handel as the first argument
            mov         rdx, 07h                        ; Pass the color as the second argument
            call        SetConsoleTextAttribute 


            add         rbp, 40                         ; release the 40 bytes of Shadow space
            mov         rax, nBytesWritten              ; set the return code to number of bytes written
            mov         rcx, 0                          ; set the exit code 0
            call        ExitProcess                     ; Jump to ExitProcess function
main        endp                                        ; End of procedure name Main


.data                                                   ; Begining of Data Section
msg             byte        " Hello World ", 0Ah, 0Dh   ; Stores the string as bytes
stdout          qword       ?                           ; Reserves space for handel to stdOut
nBytesWritten   qword       ?                           ; Reserved space for the number ob bytes actually written





                end                                     ; End of program