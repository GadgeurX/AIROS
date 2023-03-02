FILE(GLOB SRC src/*.c)
FILE(GLOB SRCASM src/*.s)

include_directories(include)

set(CMAKE_C_LINK_FLAGS "-T ${CMAKE_CURRENT_SOURCE_DIR}/linker.ld -O2 -nostdlib -ffreestanding")

add_executable(intel ${SRC} ${SRCASM})
target_link_libraries(intel AIROS)

add_custom_target(AIROS.iso ALL
        DEPENDS intel
        COMMAND cp ${CMAKE_CURRENT_BINARY_DIR}/intel ${CMAKE_CURRENT_SOURCE_DIR}/iso/boot/intel.bin
        COMMAND grub-mkrescue -o AIROS.iso ${CMAKE_CURRENT_SOURCE_DIR}/iso
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
        COMMENT "Creating iso"
    )