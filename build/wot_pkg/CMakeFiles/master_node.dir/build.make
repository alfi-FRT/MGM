# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/gujgidani20/MGM/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/gujgidani20/MGM/build

# Include any dependencies generated for this target.
include wot_pkg/CMakeFiles/master_node.dir/depend.make

# Include the progress variables for this target.
include wot_pkg/CMakeFiles/master_node.dir/progress.make

# Include the compile flags for this target's objects.
include wot_pkg/CMakeFiles/master_node.dir/flags.make

wot_pkg/CMakeFiles/master_node.dir/src/master_node.cpp.o: wot_pkg/CMakeFiles/master_node.dir/flags.make
wot_pkg/CMakeFiles/master_node.dir/src/master_node.cpp.o: /home/gujgidani20/MGM/src/wot_pkg/src/master_node.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/gujgidani20/MGM/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object wot_pkg/CMakeFiles/master_node.dir/src/master_node.cpp.o"
	cd /home/gujgidani20/MGM/build/wot_pkg && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/master_node.dir/src/master_node.cpp.o -c /home/gujgidani20/MGM/src/wot_pkg/src/master_node.cpp

wot_pkg/CMakeFiles/master_node.dir/src/master_node.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/master_node.dir/src/master_node.cpp.i"
	cd /home/gujgidani20/MGM/build/wot_pkg && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/gujgidani20/MGM/src/wot_pkg/src/master_node.cpp > CMakeFiles/master_node.dir/src/master_node.cpp.i

wot_pkg/CMakeFiles/master_node.dir/src/master_node.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/master_node.dir/src/master_node.cpp.s"
	cd /home/gujgidani20/MGM/build/wot_pkg && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/gujgidani20/MGM/src/wot_pkg/src/master_node.cpp -o CMakeFiles/master_node.dir/src/master_node.cpp.s

# Object files for target master_node
master_node_OBJECTS = \
"CMakeFiles/master_node.dir/src/master_node.cpp.o"

# External object files for target master_node
master_node_EXTERNAL_OBJECTS =

/home/gujgidani20/MGM/devel/lib/wot_pkg/master_node: wot_pkg/CMakeFiles/master_node.dir/src/master_node.cpp.o
/home/gujgidani20/MGM/devel/lib/wot_pkg/master_node: wot_pkg/CMakeFiles/master_node.dir/build.make
/home/gujgidani20/MGM/devel/lib/wot_pkg/master_node: /opt/ros/noetic/lib/libroscpp.so
/home/gujgidani20/MGM/devel/lib/wot_pkg/master_node: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/gujgidani20/MGM/devel/lib/wot_pkg/master_node: /usr/lib/x86_64-linux-gnu/libboost_chrono.so.1.71.0
/home/gujgidani20/MGM/devel/lib/wot_pkg/master_node: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so.1.71.0
/home/gujgidani20/MGM/devel/lib/wot_pkg/master_node: /opt/ros/noetic/lib/librosconsole.so
/home/gujgidani20/MGM/devel/lib/wot_pkg/master_node: /opt/ros/noetic/lib/librosconsole_log4cxx.so
/home/gujgidani20/MGM/devel/lib/wot_pkg/master_node: /opt/ros/noetic/lib/librosconsole_backend_interface.so
/home/gujgidani20/MGM/devel/lib/wot_pkg/master_node: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/gujgidani20/MGM/devel/lib/wot_pkg/master_node: /usr/lib/x86_64-linux-gnu/libboost_regex.so.1.71.0
/home/gujgidani20/MGM/devel/lib/wot_pkg/master_node: /opt/ros/noetic/lib/libxmlrpcpp.so
/home/gujgidani20/MGM/devel/lib/wot_pkg/master_node: /opt/ros/noetic/lib/libroscpp_serialization.so
/home/gujgidani20/MGM/devel/lib/wot_pkg/master_node: /opt/ros/noetic/lib/librostime.so
/home/gujgidani20/MGM/devel/lib/wot_pkg/master_node: /usr/lib/x86_64-linux-gnu/libboost_date_time.so.1.71.0
/home/gujgidani20/MGM/devel/lib/wot_pkg/master_node: /opt/ros/noetic/lib/libcpp_common.so
/home/gujgidani20/MGM/devel/lib/wot_pkg/master_node: /usr/lib/x86_64-linux-gnu/libboost_system.so.1.71.0
/home/gujgidani20/MGM/devel/lib/wot_pkg/master_node: /usr/lib/x86_64-linux-gnu/libboost_thread.so.1.71.0
/home/gujgidani20/MGM/devel/lib/wot_pkg/master_node: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
/home/gujgidani20/MGM/devel/lib/wot_pkg/master_node: wot_pkg/CMakeFiles/master_node.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/gujgidani20/MGM/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/gujgidani20/MGM/devel/lib/wot_pkg/master_node"
	cd /home/gujgidani20/MGM/build/wot_pkg && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/master_node.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
wot_pkg/CMakeFiles/master_node.dir/build: /home/gujgidani20/MGM/devel/lib/wot_pkg/master_node

.PHONY : wot_pkg/CMakeFiles/master_node.dir/build

wot_pkg/CMakeFiles/master_node.dir/clean:
	cd /home/gujgidani20/MGM/build/wot_pkg && $(CMAKE_COMMAND) -P CMakeFiles/master_node.dir/cmake_clean.cmake
.PHONY : wot_pkg/CMakeFiles/master_node.dir/clean

wot_pkg/CMakeFiles/master_node.dir/depend:
	cd /home/gujgidani20/MGM/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/gujgidani20/MGM/src /home/gujgidani20/MGM/src/wot_pkg /home/gujgidani20/MGM/build /home/gujgidani20/MGM/build/wot_pkg /home/gujgidani20/MGM/build/wot_pkg/CMakeFiles/master_node.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : wot_pkg/CMakeFiles/master_node.dir/depend
