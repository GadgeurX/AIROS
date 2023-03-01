FILE(GLOB SRC src/*.c)
FILE(GLOB SRCASM src/*.s)

include_directories(include)

set(CMAKE_C_LINK_FLAGS "-T ${CMAKE_CURRENT_SOURCE_DIR}/linker.ld -O2 -nostdlib -ffreestanding")

add_executable(intel ${SRC} ${SRCASM})
target_link_libraries(intel AIROS)