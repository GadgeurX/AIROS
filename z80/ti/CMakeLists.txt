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

set(CRT0_PATH ${CMAKE_CURRENT_BINARY_DIR}/crt0.rel)

add_custom_target(crt0 ALL
    COMMAND sdasz80 -p -g -o ${CRT0_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/src/crt0.s
    COMMENT "Creating crt0"
)

add_executable(z80 ${SRC})
target_link_libraries(z80 ${CRT0_PATH} AIROS)
add_dependencies(z80 crt0)

add_custom_target(AIROS.8xu ALL
        DEPENDS AIROS
        COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/../tools/multihex 00 z80.ihx > multihex.ihx
        COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/../tools/packxxu2 multihex.ihx -o AIROS.8xu -t 83p -q 0A -v 0.01 -h 255 -p 1
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
        COMMENT "Creating 8xu"
    )