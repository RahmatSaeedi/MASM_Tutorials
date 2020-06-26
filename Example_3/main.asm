includelib          ..\kernel32.lib

GetStdHandle        proto                   ; Writes I/O handels
WriteConsoleA       proto                   ; Writes to Command Window
ExitProcess         proto                   ; Returns CPU control to Windows
SetConsoleTextAttribute proto               ; Enables color coding the text & background
Console             equ     -11             ; Precompiller directive: assigns a value to a symbol
                                            ; It is the device code for console text output
                                            ; -11: The standard output device. Initially, this is the active console screen buffer, CONOUT$.
                                            ; https://docs.microsoft.com/en-us/windows/console/getstdhandle




.code                                       ; Begins code section
main        proc                            ; Start of procedure name Main
            sub         rbp, 40             ; reserve 40 bytes of Shadow space



            ; Get the handel for console display monitor I/O streams
            mov         rcx, Console        ; Sets RCX to -11
            call        GetStdHandle        ; Returns handle in register RAX
            mov         stdout, rax

            
            ; Set background and forground colour
            mov         rcx, stdout
            mov         rdx, 1fh
            call        SetConsoleTextAttribute 


            ; Displays 'Hello World'
            mov         rcx, stdout
            lea         rdx, msg
            mov         r8, lengthof msg
            lea         r9, nBytesWritten
            call        WriteConsoleA
            
            
            
            ; Resets background and forground colour
            mov         rcx, stdout
            mov         rdx, 07h
            call        SetConsoleTextAttribute 


            add         rbp, 40             ; release the 40 bytes of Shadow space
            mov         rcx, nBytesWritten  ; set the exit code to number of bytes written
            call        ExitProcess         ; Jump to ExitProcess function
main        endp                            ; End of procedure name Main


.data                                                   ; Begining of Data Section
msg             byte        " Hello World ", 0Ah, 0Dh   ; Stores the string as bytes
stdout          qword       ?                           ; Reserves space for handel to stdOut
nBytesWritten   qword       ?                           ; Reserved space for the number ob bytes actually written





                end                                     ; End of program