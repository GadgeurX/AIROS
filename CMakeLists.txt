cmake_minimum_required(VERSION 3.10)
set(CMAKE_SYSTEM_NAME Generic)
project(AIROS C)

set(CMAKE_C_OUTPUT_EXTENSION ".rel")

set(CMAKE_C_FLAGS_INIT "")
set(CMAKE_EXE_LINKER_FLAGS_INIT "")
set(CMAKE_C_FLAGS "--std-sdcc99 -mz80 --opt-code-size --no-std-crt0 --data-loc 0000 --code-loc 120")
set(CMAKE_C_LINK_FLAGS "--std-sdcc99 -mz80 --opt-code-size --no-std-crt0 --data-loc 0000 --code-loc 120")
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


# compile a C file into an object file
set(CMAKE_C_COMPILE_OBJECT  "<CMAKE_C_COMPILER> <DEFINES> <INCLUDES> <FLAGS> -o <OBJECT> -c <SOURCE>")
set(CMAKE_ASM_COMPILE_OBJECT  "<CMAKE_ASM_COMPILER> -p -g -o <OBJECT> -c <SOURCE>")

# link object files to an executable
set(CMAKE_C_LINK_EXECUTABLE "<CMAKE_C_COMPILER> <FLAGS> <OBJECTS> -o <TARGET> <CMAKE_C_LINK_FLAGS> <LINK_FLAGS> <LINK_LIBRARIES>")

# needs sdcc + sdar/sdcclib
set(CMAKE_C_CREATE_STATIC_LIBRARY
      "\"${CMAKE_COMMAND}\" -E remove <TARGET>"
      "<CMAKE_AR> ${CMAKE_AR_OPTIONS} <TARGET> <LINK_FLAGS> <OBJECTS> ")

# not supported by sdcc
set(CMAKE_C_CREATE_SHARED_LIBRARY "")
set(CMAKE_C_CREATE_MODULE_LIBRARY "")



FILE(GLOB SRC src/*.c)
include_directories(include)

add_subdirectory(z80)
#add_subdirectory(intel)

add_executable(AIROS ${SRC})
target_link_libraries(AIROS z80)

add_custom_target(AIROS.8xu ALL
    DEPENDS AIROS
    COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/z80/tools/multihex 00 AIROS.ihx > multihex.ihx
    COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/z80/tools/packxxu2 multihex.ihx -o AIROS.8xu -t 83p -q 0A -v 0.01 -h 255 -p 1
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
    COMMENT "Creating 8xu"
)