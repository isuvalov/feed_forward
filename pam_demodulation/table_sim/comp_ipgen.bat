@rem GCCmust be from questasim or modelsim!!!!!!!!!!!!!!!!!!
del phaseerrors_pli.dll 

C:\Xilinx\questasim_6.6a\questasim-gcc-4.2.1-mingw32vc9\bin\gcc.exe  -g -c -IC:/Xilinx/questasim_6.6a/include phaseerrors_pli.c
C:\Xilinx\questasim_6.6a\questasim-gcc-4.2.1-mingw32vc9\bin\gcc.exe  -shared -LC:/Xilinx/questasim_6.6a/win32 -lmtipli -o phaseerrors_pli.dll phaseerrors_pli.o

