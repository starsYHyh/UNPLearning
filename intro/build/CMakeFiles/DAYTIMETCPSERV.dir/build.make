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
include CMakeFiles/DAYTIMETCPSERV.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/DAYTIMETCPSERV.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/DAYTIMETCPSERV.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/DAYTIMETCPSERV.dir/flags.make

CMakeFiles/DAYTIMETCPSERV.dir/src/daytimetcpserv.c.o: CMakeFiles/DAYTIMETCPSERV.dir/flags.make
CMakeFiles/DAYTIMETCPSERV.dir/src/daytimetcpserv.c.o: ../src/daytimetcpserv.c
CMakeFiles/DAYTIMETCPSERV.dir/src/daytimetcpserv.c.o: CMakeFiles/DAYTIMETCPSERV.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/firefly/Codes/C/UNP/intro/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/DAYTIMETCPSERV.dir/src/daytimetcpserv.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/DAYTIMETCPSERV.dir/src/daytimetcpserv.c.o -MF CMakeFiles/DAYTIMETCPSERV.dir/src/daytimetcpserv.c.o.d -o CMakeFiles/DAYTIMETCPSERV.dir/src/daytimetcpserv.c.o -c /home/firefly/Codes/C/UNP/intro/src/daytimetcpserv.c

CMakeFiles/DAYTIMETCPSERV.dir/src/daytimetcpserv.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/DAYTIMETCPSERV.dir/src/daytimetcpserv.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/firefly/Codes/C/UNP/intro/src/daytimetcpserv.c > CMakeFiles/DAYTIMETCPSERV.dir/src/daytimetcpserv.c.i

CMakeFiles/DAYTIMETCPSERV.dir/src/daytimetcpserv.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/DAYTIMETCPSERV.dir/src/daytimetcpserv.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/firefly/Codes/C/UNP/intro/src/daytimetcpserv.c -o CMakeFiles/DAYTIMETCPSERV.dir/src/daytimetcpserv.c.s

# Object files for target DAYTIMETCPSERV
DAYTIMETCPSERV_OBJECTS = \
"CMakeFiles/DAYTIMETCPSERV.dir/src/daytimetcpserv.c.o"

# External object files for target DAYTIMETCPSERV
DAYTIMETCPSERV_EXTERNAL_OBJECTS =

../bin/DAYTIMETCPSERV: CMakeFiles/DAYTIMETCPSERV.dir/src/daytimetcpserv.c.o
../bin/DAYTIMETCPSERV: CMakeFiles/DAYTIMETCPSERV.dir/build.make
../bin/DAYTIMETCPSERV: ../../mylib/libunp.a
../bin/DAYTIMETCPSERV: CMakeFiles/DAYTIMETCPSERV.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/firefly/Codes/C/UNP/intro/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../bin/DAYTIMETCPSERV"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/DAYTIMETCPSERV.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/DAYTIMETCPSERV.dir/build: ../bin/DAYTIMETCPSERV
.PHONY : CMakeFiles/DAYTIMETCPSERV.dir/build

CMakeFiles/DAYTIMETCPSERV.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/DAYTIMETCPSERV.dir/cmake_clean.cmake
.PHONY : CMakeFiles/DAYTIMETCPSERV.dir/clean

CMakeFiles/DAYTIMETCPSERV.dir/depend:
	cd /home/firefly/Codes/C/UNP/intro/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/firefly/Codes/C/UNP/intro /home/firefly/Codes/C/UNP/intro /home/firefly/Codes/C/UNP/intro/build /home/firefly/Codes/C/UNP/intro/build /home/firefly/Codes/C/UNP/intro/build/CMakeFiles/DAYTIMETCPSERV.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/DAYTIMETCPSERV.dir/depend

