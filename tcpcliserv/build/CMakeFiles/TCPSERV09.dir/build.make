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
CMAKE_SOURCE_DIR = /home/firefly/Codes/C/UNP/tcpcliserv

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/firefly/Codes/C/UNP/tcpcliserv/build

# Include any dependencies generated for this target.
include CMakeFiles/TCPSERV09.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/TCPSERV09.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/TCPSERV09.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/TCPSERV09.dir/flags.make

CMakeFiles/TCPSERV09.dir/lib/sigchldwait.c.o: CMakeFiles/TCPSERV09.dir/flags.make
CMakeFiles/TCPSERV09.dir/lib/sigchldwait.c.o: ../lib/sigchldwait.c
CMakeFiles/TCPSERV09.dir/lib/sigchldwait.c.o: CMakeFiles/TCPSERV09.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/firefly/Codes/C/UNP/tcpcliserv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/TCPSERV09.dir/lib/sigchldwait.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/TCPSERV09.dir/lib/sigchldwait.c.o -MF CMakeFiles/TCPSERV09.dir/lib/sigchldwait.c.o.d -o CMakeFiles/TCPSERV09.dir/lib/sigchldwait.c.o -c /home/firefly/Codes/C/UNP/tcpcliserv/lib/sigchldwait.c

CMakeFiles/TCPSERV09.dir/lib/sigchldwait.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/TCPSERV09.dir/lib/sigchldwait.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/firefly/Codes/C/UNP/tcpcliserv/lib/sigchldwait.c > CMakeFiles/TCPSERV09.dir/lib/sigchldwait.c.i

CMakeFiles/TCPSERV09.dir/lib/sigchldwait.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/TCPSERV09.dir/lib/sigchldwait.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/firefly/Codes/C/UNP/tcpcliserv/lib/sigchldwait.c -o CMakeFiles/TCPSERV09.dir/lib/sigchldwait.c.s

CMakeFiles/TCPSERV09.dir/src/tcpserv09.c.o: CMakeFiles/TCPSERV09.dir/flags.make
CMakeFiles/TCPSERV09.dir/src/tcpserv09.c.o: ../src/tcpserv09.c
CMakeFiles/TCPSERV09.dir/src/tcpserv09.c.o: CMakeFiles/TCPSERV09.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/firefly/Codes/C/UNP/tcpcliserv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/TCPSERV09.dir/src/tcpserv09.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/TCPSERV09.dir/src/tcpserv09.c.o -MF CMakeFiles/TCPSERV09.dir/src/tcpserv09.c.o.d -o CMakeFiles/TCPSERV09.dir/src/tcpserv09.c.o -c /home/firefly/Codes/C/UNP/tcpcliserv/src/tcpserv09.c

CMakeFiles/TCPSERV09.dir/src/tcpserv09.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/TCPSERV09.dir/src/tcpserv09.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/firefly/Codes/C/UNP/tcpcliserv/src/tcpserv09.c > CMakeFiles/TCPSERV09.dir/src/tcpserv09.c.i

CMakeFiles/TCPSERV09.dir/src/tcpserv09.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/TCPSERV09.dir/src/tcpserv09.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/firefly/Codes/C/UNP/tcpcliserv/src/tcpserv09.c -o CMakeFiles/TCPSERV09.dir/src/tcpserv09.c.s

# Object files for target TCPSERV09
TCPSERV09_OBJECTS = \
"CMakeFiles/TCPSERV09.dir/lib/sigchldwait.c.o" \
"CMakeFiles/TCPSERV09.dir/src/tcpserv09.c.o"

# External object files for target TCPSERV09
TCPSERV09_EXTERNAL_OBJECTS =

../bin/TCPSERV09: CMakeFiles/TCPSERV09.dir/lib/sigchldwait.c.o
../bin/TCPSERV09: CMakeFiles/TCPSERV09.dir/src/tcpserv09.c.o
../bin/TCPSERV09: CMakeFiles/TCPSERV09.dir/build.make
../bin/TCPSERV09: ../../mylib/libunp.a
../bin/TCPSERV09: CMakeFiles/TCPSERV09.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/firefly/Codes/C/UNP/tcpcliserv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable ../bin/TCPSERV09"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/TCPSERV09.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/TCPSERV09.dir/build: ../bin/TCPSERV09
.PHONY : CMakeFiles/TCPSERV09.dir/build

CMakeFiles/TCPSERV09.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/TCPSERV09.dir/cmake_clean.cmake
.PHONY : CMakeFiles/TCPSERV09.dir/clean

CMakeFiles/TCPSERV09.dir/depend:
	cd /home/firefly/Codes/C/UNP/tcpcliserv/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/firefly/Codes/C/UNP/tcpcliserv /home/firefly/Codes/C/UNP/tcpcliserv /home/firefly/Codes/C/UNP/tcpcliserv/build /home/firefly/Codes/C/UNP/tcpcliserv/build /home/firefly/Codes/C/UNP/tcpcliserv/build/CMakeFiles/TCPSERV09.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/TCPSERV09.dir/depend

