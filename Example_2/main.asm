; To perform the calculation ' 2*(8 + 12) - 10'
;   Retuns the answer as exit Status Code, RCX

includelib      ..\kernel32.lib             ; Includes external Windows 10 API library
ExitProcess     proto                       ; Declares prototype of ExitProcess function
                                            ; ExitProcess is part of kernel32.lib of Windows 10 API
                                            ; ExitProcess: Returns CPU control to Windows

.code                                       ; Code section begins 
main            proc                        ; Marks the beging of procedure 'main'
                mov     rax, 1000b          ; Store binary 1000b = decimal 8 in register RAX
                add     rax, 14o            ; Adds octal 14o = decimal 12 to value in Register RAX
                mov     rcx, 2d             ; Stores decimal 2 in register RCX
                mul     rcx                 ; Multiplies RAX by RCX and stores the result in registers RDX:RAX, with RAX containing low, and RDX contanng the high bits
                sub     rax, 0Ah            ; Subtracts hexadecimal 0xA = decimal 10 from RAX
                mov     rcx, rax            ; Stores the result as 

                call    ExitProcess         ; Jumps to function 'ExitProcess'
main            endp                        ; Marks the end of procedure 'main'
                end                         ; Marks the end of program