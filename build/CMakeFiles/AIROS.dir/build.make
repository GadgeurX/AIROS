# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/c/Users/romai/Dev/AIROS/AIROS

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/c/Users/romai/Dev/AIROS/AIROS/build

# Include any dependencies generated for this target.
include CMakeFiles/AIROS.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/AIROS.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/AIROS.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/AIROS.dir/flags.make

CMakeFiles/AIROS.dir/src/main.c.rel: CMakeFiles/AIROS.dir/flags.make
CMakeFiles/AIROS.dir/src/main.c.rel: ../src/main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/romai/Dev/AIROS/AIROS/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/AIROS.dir/src/main.c.rel"
	sdcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/AIROS.dir/src/main.c.rel -c /mnt/c/Users/romai/Dev/AIROS/AIROS/src/main.c

CMakeFiles/AIROS.dir/src/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/AIROS.dir/src/main.c.i"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_C_CREATE_PREPROCESSED_SOURCE

CMakeFiles/AIROS.dir/src/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/AIROS.dir/src/main.c.s"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_C_CREATE_ASSEMBLY_SOURCE

CMakeFiles/AIROS.dir/src/memory.c.rel: CMakeFiles/AIROS.dir/flags.make
CMakeFiles/AIROS.dir/src/memory.c.rel: ../src/memory.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/romai/Dev/AIROS/AIROS/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/AIROS.dir/src/memory.c.rel"
	sdcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/AIROS.dir/src/memory.c.rel -c /mnt/c/Users/romai/Dev/AIROS/AIROS/src/memory.c

CMakeFiles/AIROS.dir/src/memory.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/AIROS.dir/src/memory.c.i"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_C_CREATE_PREPROCESSED_SOURCE

CMakeFiles/AIROS.dir/src/memory.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/AIROS.dir/src/memory.c.s"
	$(CMAKE_COMMAND) -E cmake_unimplemented_variable CMAKE_C_CREATE_ASSEMBLY_SOURCE

# Object files for target AIROS
AIROS_OBJECTS = \
"CMakeFiles/AIROS.dir/src/main.c.rel" \
"CMakeFiles/AIROS.dir/src/memory.c.rel"

# External object files for target AIROS
AIROS_EXTERNAL_OBJECTS =

AIROS.lib: CMakeFiles/AIROS.dir/src/main.c.rel
AIROS.lib: CMakeFiles/AIROS.dir/src/memory.c.rel
AIROS.lib: CMakeFiles/AIROS.dir/build.make
AIROS.lib: CMakeFiles/AIROS.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/c/Users/romai/Dev/AIROS/AIROS/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C static library AIROS.lib"
	$(CMAKE_COMMAND) -P CMakeFiles/AIROS.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/AIROS.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/AIROS.dir/build: AIROS.lib
.PHONY : CMakeFiles/AIROS.dir/build

CMakeFiles/AIROS.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/AIROS.dir/cmake_clean.cmake
.PHONY : CMakeFiles/AIROS.dir/clean

CMakeFiles/AIROS.dir/depend:
	cd /mnt/c/Users/romai/Dev/AIROS/AIROS/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/Users/romai/Dev/AIROS/AIROS /mnt/c/Users/romai/Dev/AIROS/AIROS /mnt/c/Users/romai/Dev/AIROS/AIROS/build /mnt/c/Users/romai/Dev/AIROS/AIROS/build /mnt/c/Users/romai/Dev/AIROS/AIROS/build/CMakeFiles/AIROS.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/AIROS.dir/depend

