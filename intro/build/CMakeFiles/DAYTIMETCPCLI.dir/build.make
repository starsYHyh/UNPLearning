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
CMAKE_SOURCE_DIR = /home/firefly/Codes/C/UNP/intro

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/firefly/Codes/C/UNP/intro/build

# Include any dependencies generated for this target.
include CMakeFiles/DAYTIMETCPCLI.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/DAYTIMETCPCLI.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/DAYTIMETCPCLI.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/DAYTIMETCPCLI.dir/flags.make

CMakeFiles/DAYTIMETCPCLI.dir/src/daytimetcpcli.c.o: CMakeFiles/DAYTIMETCPCLI.dir/flags.make
CMakeFiles/DAYTIMETCPCLI.dir/src/daytimetcpcli.c.o: ../src/daytimetcpcli.c
CMakeFiles/DAYTIMETCPCLI.dir/src/daytimetcpcli.c.o: CMakeFiles/DAYTIMETCPCLI.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/firefly/Codes/C/UNP/intro/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/DAYTIMETCPCLI.dir/src/daytimetcpcli.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/DAYTIMETCPCLI.dir/src/daytimetcpcli.c.o -MF CMakeFiles/DAYTIMETCPCLI.dir/src/daytimetcpcli.c.o.d -o CMakeFiles/DAYTIMETCPCLI.dir/src/daytimetcpcli.c.o -c /home/firefly/Codes/C/UNP/intro/src/daytimetcpcli.c

CMakeFiles/DAYTIMETCPCLI.dir/src/daytimetcpcli.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/DAYTIMETCPCLI.dir/src/daytimetcpcli.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/firefly/Codes/C/UNP/intro/src/daytimetcpcli.c > CMakeFiles/DAYTIMETCPCLI.dir/src/daytimetcpcli.c.i

CMakeFiles/DAYTIMETCPCLI.dir/src/daytimetcpcli.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/DAYTIMETCPCLI.dir/src/daytimetcpcli.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/firefly/Codes/C/UNP/intro/src/daytimetcpcli.c -o CMakeFiles/DAYTIMETCPCLI.dir/src/daytimetcpcli.c.s

# Object files for target DAYTIMETCPCLI
DAYTIMETCPCLI_OBJECTS = \
"CMakeFiles/DAYTIMETCPCLI.dir/src/daytimetcpcli.c.o"

# External object files for target DAYTIMETCPCLI
DAYTIMETCPCLI_EXTERNAL_OBJECTS =

../bin/DAYTIMETCPCLI: CMakeFiles/DAYTIMETCPCLI.dir/src/daytimetcpcli.c.o
../bin/DAYTIMETCPCLI: CMakeFiles/DAYTIMETCPCLI.dir/build.make
../bin/DAYTIMETCPCLI: ../../mylib/libunp.a
../bin/DAYTIMETCPCLI: CMakeFiles/DAYTIMETCPCLI.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/firefly/Codes/C/UNP/intro/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../bin/DAYTIMETCPCLI"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/DAYTIMETCPCLI.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/DAYTIMETCPCLI.dir/build: ../bin/DAYTIMETCPCLI
.PHONY : CMakeFiles/DAYTIMETCPCLI.dir/build

CMakeFiles/DAYTIMETCPCLI.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/DAYTIMETCPCLI.dir/cmake_clean.cmake
.PHONY : CMakeFiles/DAYTIMETCPCLI.dir/clean

CMakeFiles/DAYTIMETCPCLI.dir/depend:
	cd /home/firefly/Codes/C/UNP/intro/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/firefly/Codes/C/UNP/intro /home/firefly/Codes/C/UNP/intro /home/firefly/Codes/C/UNP/intro/build /home/firefly/Codes/C/UNP/intro/build /home/firefly/Codes/C/UNP/intro/build/CMakeFiles/DAYTIMETCPCLI.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/DAYTIMETCPCLI.dir/depend

