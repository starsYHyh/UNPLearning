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
CMAKE_SOURCE_DIR = /home/firefly/Codes/C/UNP/select

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/firefly/Codes/C/UNP/select/build

# Include any dependencies generated for this target.
include CMakeFiles/TCPSERVPOLL01.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/TCPSERVPOLL01.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/TCPSERVPOLL01.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/TCPSERVPOLL01.dir/flags.make

CMakeFiles/TCPSERVPOLL01.dir/lib/strcliselect.c.o: CMakeFiles/TCPSERVPOLL01.dir/flags.make
CMakeFiles/TCPSERVPOLL01.dir/lib/strcliselect.c.o: ../lib/strcliselect.c
CMakeFiles/TCPSERVPOLL01.dir/lib/strcliselect.c.o: CMakeFiles/TCPSERVPOLL01.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/firefly/Codes/C/UNP/select/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/TCPSERVPOLL01.dir/lib/strcliselect.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/TCPSERVPOLL01.dir/lib/strcliselect.c.o -MF CMakeFiles/TCPSERVPOLL01.dir/lib/strcliselect.c.o.d -o CMakeFiles/TCPSERVPOLL01.dir/lib/strcliselect.c.o -c /home/firefly/Codes/C/UNP/select/lib/strcliselect.c

CMakeFiles/TCPSERVPOLL01.dir/lib/strcliselect.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/TCPSERVPOLL01.dir/lib/strcliselect.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/firefly/Codes/C/UNP/select/lib/strcliselect.c > CMakeFiles/TCPSERVPOLL01.dir/lib/strcliselect.c.i

CMakeFiles/TCPSERVPOLL01.dir/lib/strcliselect.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/TCPSERVPOLL01.dir/lib/strcliselect.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/firefly/Codes/C/UNP/select/lib/strcliselect.c -o CMakeFiles/TCPSERVPOLL01.dir/lib/strcliselect.c.s

CMakeFiles/TCPSERVPOLL01.dir/src/tcpservpoll01.c.o: CMakeFiles/TCPSERVPOLL01.dir/flags.make
CMakeFiles/TCPSERVPOLL01.dir/src/tcpservpoll01.c.o: ../src/tcpservpoll01.c
CMakeFiles/TCPSERVPOLL01.dir/src/tcpservpoll01.c.o: CMakeFiles/TCPSERVPOLL01.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/firefly/Codes/C/UNP/select/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/TCPSERVPOLL01.dir/src/tcpservpoll01.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/TCPSERVPOLL01.dir/src/tcpservpoll01.c.o -MF CMakeFiles/TCPSERVPOLL01.dir/src/tcpservpoll01.c.o.d -o CMakeFiles/TCPSERVPOLL01.dir/src/tcpservpoll01.c.o -c /home/firefly/Codes/C/UNP/select/src/tcpservpoll01.c

CMakeFiles/TCPSERVPOLL01.dir/src/tcpservpoll01.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/TCPSERVPOLL01.dir/src/tcpservpoll01.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/firefly/Codes/C/UNP/select/src/tcpservpoll01.c > CMakeFiles/TCPSERVPOLL01.dir/src/tcpservpoll01.c.i

CMakeFiles/TCPSERVPOLL01.dir/src/tcpservpoll01.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/TCPSERVPOLL01.dir/src/tcpservpoll01.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/firefly/Codes/C/UNP/select/src/tcpservpoll01.c -o CMakeFiles/TCPSERVPOLL01.dir/src/tcpservpoll01.c.s

# Object files for target TCPSERVPOLL01
TCPSERVPOLL01_OBJECTS = \
"CMakeFiles/TCPSERVPOLL01.dir/lib/strcliselect.c.o" \
"CMakeFiles/TCPSERVPOLL01.dir/src/tcpservpoll01.c.o"

# External object files for target TCPSERVPOLL01
TCPSERVPOLL01_EXTERNAL_OBJECTS =

../bin/TCPSERVPOLL01: CMakeFiles/TCPSERVPOLL01.dir/lib/strcliselect.c.o
../bin/TCPSERVPOLL01: CMakeFiles/TCPSERVPOLL01.dir/src/tcpservpoll01.c.o
../bin/TCPSERVPOLL01: CMakeFiles/TCPSERVPOLL01.dir/build.make
../bin/TCPSERVPOLL01: ../../mylib/libunp.a
../bin/TCPSERVPOLL01: CMakeFiles/TCPSERVPOLL01.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/firefly/Codes/C/UNP/select/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable ../bin/TCPSERVPOLL01"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/TCPSERVPOLL01.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/TCPSERVPOLL01.dir/build: ../bin/TCPSERVPOLL01
.PHONY : CMakeFiles/TCPSERVPOLL01.dir/build

CMakeFiles/TCPSERVPOLL01.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/TCPSERVPOLL01.dir/cmake_clean.cmake
.PHONY : CMakeFiles/TCPSERVPOLL01.dir/clean

CMakeFiles/TCPSERVPOLL01.dir/depend:
	cd /home/firefly/Codes/C/UNP/select/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/firefly/Codes/C/UNP/select /home/firefly/Codes/C/UNP/select /home/firefly/Codes/C/UNP/select/build /home/firefly/Codes/C/UNP/select/build /home/firefly/Codes/C/UNP/select/build/CMakeFiles/TCPSERVPOLL01.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/TCPSERVPOLL01.dir/depend

