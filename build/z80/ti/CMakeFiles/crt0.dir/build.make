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

# Utility rule file for crt0.

# Include any custom commands dependencies for this target.
include z80/ti/CMakeFiles/crt0.dir/compiler_depend.make

# Include the progress variables for this target.
include z80/ti/CMakeFiles/crt0.dir/progress.make

z80/ti/CMakeFiles/crt0:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/mnt/c/Users/romai/Dev/AIROS/AIROS/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Creating crt0"
	cd /mnt/c/Users/romai/Dev/AIROS/AIROS/build/z80/ti && sdasz80 -p -g -o /mnt/c/Users/romai/Dev/AIROS/AIROS/build/z80/ti/crt0.rel /mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti/src/crt0.s

crt0: z80/ti/CMakeFiles/crt0
crt0: z80/ti/CMakeFiles/crt0.dir/build.make
.PHONY : crt0

# Rule to build all files generated by this target.
z80/ti/CMakeFiles/crt0.dir/build: crt0
.PHONY : z80/ti/CMakeFiles/crt0.dir/build

z80/ti/CMakeFiles/crt0.dir/clean:
	cd /mnt/c/Users/romai/Dev/AIROS/AIROS/build/z80/ti && $(CMAKE_COMMAND) -P CMakeFiles/crt0.dir/cmake_clean.cmake
.PHONY : z80/ti/CMakeFiles/crt0.dir/clean

z80/ti/CMakeFiles/crt0.dir/depend:
	cd /mnt/c/Users/romai/Dev/AIROS/AIROS/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/Users/romai/Dev/AIROS/AIROS /mnt/c/Users/romai/Dev/AIROS/AIROS/z80/ti /mnt/c/Users/romai/Dev/AIROS/AIROS/build /mnt/c/Users/romai/Dev/AIROS/AIROS/build/z80/ti /mnt/c/Users/romai/Dev/AIROS/AIROS/build/z80/ti/CMakeFiles/crt0.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : z80/ti/CMakeFiles/crt0.dir/depend

