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
|   RBX     |Index              |Nonvolatile                       |
|   RCX     |Loop counter       |1st integer argument, volatile    |
|   RDX     |                   |2nd integer argument, volatile    |
|   RSI     |Source index       |Nonvolatile                       |
|   RDI     |Destination index  |Nonvolatile                       |
|   RBP     |Base pointer       |Nonvolatile                       |
|   RSP     |Stack pointer      |Nonvolatile                       |
|   R10, R11|                   |Volatile                          |
|   R12-R15 |                   |Nonvolatile                       |
