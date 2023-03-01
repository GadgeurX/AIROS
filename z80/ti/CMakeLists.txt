cmake_minimum_required(VERSION 3.10)

set(CMAKE_SYSTEM_NAME Generic)

set (CMAKE_ASM_INFORMATION_LOADED 1)
set(CMAKE_ASM_COMPILER sdasz80)
set(CMAKE_C_OUTPUT_EXTENSION ".rel")
set(CMAKE_ASM_OUTPUT_EXTENSION ".rel")
set(CMAKE_ASM_OUTPUT_EXTENSION_REPLACE 1)

set(CMAKE_C_FLAGS_INIT "")
set(CMAKE_ASM_FLAGS_INIT "")
set(CMAKE_EXE_LINKER_FLAGS_INIT "")
set(CMAKE_C_FLAGS "--std-sdcc99 -mz80 --opt-code-size --no-std-crt0 --data-loc 0000 --code-loc 100")
set(CMAKE_ASM_FLAGS "-p -g")
set(CMAKE_C_LINK_FLAGS "--std-sdcc99 -mz80 --opt-code-size --no-std-crt0 --data-loc 0000 --code-loc 100")
set(CMAKE_STATIC_LIBRARY_PREFIX "")
set(CMAKE_STATIC_LIBRARY_SUFFIX ".lib")
set(CMAKE_SHARED_LIBRARY_PREFIX "")          # lib
set(CMAKE_SHARED_LIBRARY_SUFFIX ".lib")          # .so
set(CMAKE_IMPORT_LIBRARY_PREFIX )
set(CMAKE_IMPORT_LIBRARY_SUFFIX )
set(CMAKE_EXECUTABLE_SUFFIX ".ihx")          # intel hex file
set(CMAKE_LINK_LIBRARY_SUFFIX ".lib")
set(CMAKE_DL_LIBS "")

set(CMAKE_C_COMPILER sdcc)
set(CMAKE_AR sdar)
set(CMAKE_AR_OPTIONS "-rc")

set(CMAKE_C_LINKER_WRAPPER_FLAG "-Wl" ",")
set(CMAKE_ASM_OUTPUT_EXTENSION_REPLACE 1)

FILE(GLOB SRC src/*.c)
FILE(GLOB SRCASM src/*.s)
include_directories(include)

add_library(z80 STATIC ${SRC} ${SRCASM})