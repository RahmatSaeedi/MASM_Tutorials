# Setup
- CPU that supports x86-64, with Windows 10 installed
- Visual Studio Community/Enterprise Edition, with C++ toolchain installed
    - Microsoft Macro Assembler (x64), [ml64.exe](https://docs.microsoft.com/en-us/cpp/assembler/masm/masm-for-x64-ml64-exe?view=Microsoft_Macro_Assembler "Usually located at: 'C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.##.#####\bin\Hostx64\x64\ml64.exe'")
    - Microsoft Incremental Linker, [link.exe](https://docs.microsoft.com/en-us/cpp/assembler/masm/masm-for-x64-ml64-exe?view=Microsoft_Macro_Assembler "Usually located at: 'C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.##.#####\bin\Hostx64\x64\link.exe'")
    - Windows 64-bit Application Programming Interface, [kernel32.Lib](https://en.wikipedia.org/wiki/Windows_API "Usually located at: 'C:\Program Files (x86)\Windows Kits\10\Lib\10.#.#####.#\um\x64\kernel32.Lib'")
- Place a copy of `...\um\x64\kernel32.Lib` in this directory. 
- Change the PATH variable to also point to the MASM and linker folders, or edit [%pathToMASMFolder% in run.bat](run.bat) to point to the correct folder.

# Run
Run `run.bat` and select an example file.

# x86-64 Registers in Windows 10
|  Register |  Hardware         | Software: x64 Calling Convention |
|:----------|:------------------|:---------------------------------|
|   RAX     |Default accumulator|Return value, volatile            |
|   _RBX_   |Index              |Nonvolatile                       |
|   RCX     |Loop counter       |1st integer argument, volatile, usually exit status code|
|   RDX     |                   |2nd integer argument, volatile    |
|   _RSI_   |Source index       |Nonvolatile                       |
|   _RDI_   |Destination index  |Nonvolatile                       |
|   _RBP_   |Base pointer       |Nonvolatile                       |
|   _RSP_   |Stack pointer      |Nonvolatile                       |
|   R8, R9  |                   |3rd/4th integer argument, volatile|
|   R10, R11|                   |Volatile                          |
|  _R12-R15_|                   |Nonvolatile                       |
# Application Binary Interface
## Shadow spaces in x64
Called procedure assumes:
- stack contains room for storing four 64-bit registers, 
- RSP stack pointer is aligned on a 128-bit address boundary,
And since, CALL instruction pushes its return address (8 bytes) onto the stack, so a shadow space of 40 bytes is typically reserved on the stack before procedure calls