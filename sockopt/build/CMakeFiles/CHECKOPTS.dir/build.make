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
CMAKE_SOURCE_DIR = /home/firefly/Codes/C/UNP/sockopt

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/firefly/Codes/C/UNP/sockopt/build

# Include any dependencies generated for this target.
include CMakeFiles/CHECKOPTS.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/CHECKOPTS.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/CHECKOPTS.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/CHECKOPTS.dir/flags.make

CMakeFiles/CHECKOPTS.dir/src/checkopts.c.o: CMakeFiles/CHECKOPTS.dir/flags.make
CMakeFiles/CHECKOPTS.dir/src/checkopts.c.o: ../src/checkopts.c
CMakeFiles/CHECKOPTS.dir/src/checkopts.c.o: CMakeFiles/CHECKOPTS.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/firefly/Codes/C/UNP/sockopt/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/CHECKOPTS.dir/src/checkopts.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/CHECKOPTS.dir/src/checkopts.c.o -MF CMakeFiles/CHECKOPTS.dir/src/checkopts.c.o.d -o CMakeFiles/CHECKOPTS.dir/src/checkopts.c.o -c /home/firefly/Codes/C/UNP/sockopt/src/checkopts.c

CMakeFiles/CHECKOPTS.dir/src/checkopts.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/CHECKOPTS.dir/src/checkopts.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/firefly/Codes/C/UNP/sockopt/src/checkopts.c > CMakeFiles/CHECKOPTS.dir/src/checkopts.c.i

CMakeFiles/CHECKOPTS.dir/src/checkopts.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/CHECKOPTS.dir/src/checkopts.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/firefly/Codes/C/UNP/sockopt/src/checkopts.c -o CMakeFiles/CHECKOPTS.dir/src/checkopts.c.s

# Object files for target CHECKOPTS
CHECKOPTS_OBJECTS = \
"CMakeFiles/CHECKOPTS.dir/src/checkopts.c.o"

# External object files for target CHECKOPTS
CHECKOPTS_EXTERNAL_OBJECTS =

../bin/CHECKOPTS: CMakeFiles/CHECKOPTS.dir/src/checkopts.c.o
../bin/CHECKOPTS: CMakeFiles/CHECKOPTS.dir/build.make
../bin/CHECKOPTS: ../../mylib/libunp.a
../bin/CHECKOPTS: CMakeFiles/CHECKOPTS.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/firefly/Codes/C/UNP/sockopt/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../bin/CHECKOPTS"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/CHECKOPTS.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/CHECKOPTS.dir/build: ../bin/CHECKOPTS
.PHONY : CMakeFiles/CHECKOPTS.dir/build

CMakeFiles/CHECKOPTS.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/CHECKOPTS.dir/cmake_clean.cmake
.PHONY : CMakeFiles/CHECKOPTS.dir/clean

CMakeFiles/CHECKOPTS.dir/depend:
	cd /home/firefly/Codes/C/UNP/sockopt/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/firefly/Codes/C/UNP/sockopt /home/firefly/Codes/C/UNP/sockopt /home/firefly/Codes/C/UNP/sockopt/build /home/firefly/Codes/C/UNP/sockopt/build /home/firefly/Codes/C/UNP/sockopt/build/CMakeFiles/CHECKOPTS.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/CHECKOPTS.dir/depend
