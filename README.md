# AIROS
Multiplatform Small Os
## AIROS

## Target
For now only target z80 ti but intel and other z80 target are short term planned

## Build instruction
mkdir build
cd build
cmake -DCMAKE_SYSTEM_NAME=Generic -DCMAKE_C_COMPILER=sdcc -DCMAKE_ASM_COMPILER=sdasz80 -DCMAKE_ASM_OUTPUT_EXTENSION=".rel" ..
make
