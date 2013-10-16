@rem GCCmust be from questasim or modelsim!!!!!!!!!!!!!!!!!!

C:\Xilinx\modelsim10.1c\gcc-4.5.0-mingw64\bin\gcc.exe -m64 -g -c -IC:/Xilinx/modelsim10.1c/include phaseerrors_pli.c
C:\Xilinx\modelsim10.1c\gcc-4.5.0-mingw64\bin\gcc.exe -m64 -shared -LC:/Xilinx/modelsim10.1c/win64  -o phaseerrors_pli.dll phaseerrors_pli.o -lmtipli



@rem C:\Xilinx\modelsim10.1c\gcc-4.5.0-mingw64\bin\
@rem C:\Xilinx\modelsim10.1c\gcc-4.5.0-mingw64\bin\