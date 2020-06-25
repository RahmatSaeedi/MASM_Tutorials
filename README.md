# Setup
- CPU that supports x86-64, with Windows 10 installed
- Visual Studio Community/Enterprise Edition, with C++ toolchain installed
    - Microsoft Macro Assembler (x64), [ml64.exe](https://docs.microsoft.com/en-us/cpp/assembler/masm/masm-for-x64-ml64-exe?view=Microsoft_Macro_Assembler "Usually located at: 'C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.##.#####\bin\Hostx64\x64\ml64.exe'")
    - Microsoft Incremental Linker, [link.exe](https://docs.microsoft.com/en-us/cpp/assembler/masm/masm-for-x64-ml64-exe?view=Microsoft_Macro_Assembler "Usually located at: 'C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.##.#####\bin\Hostx64\x64\link.exe'")
    - Windows 64-bit Application Programming Interface, [kernel32.Lib](https://en.wikipedia.org/wiki/Windows_API "Usually located at: 'C:\Program Files (x86)\Windows Kits\10\Lib\10.#.#####.#\um\x64\kernel32.Lib'")
- Place a copy of `...\um\x64\kernel32.Lib` in this directory. 
- Change the PATH variable to also point to the MASM and linker folders, or edit [%pathToMASMFolder% in run.bat](run.bat) to point to the correct folder.

# Run
Run