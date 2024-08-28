cmake_minimum_required(VERSION 3.10.0)

# 项目名称和版本
project(UDPCLISERV VERSION 1.0 LANGUAGES C)

# 设置C编译标准
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED True)

# 设置源文件目录变量
set(MLIB_DIR ${PROJECT_SOURCE_DIR}/../mylib)  # 自定义公用头文件及其链接文件所在目录
set(LOCAL_LIB_DIR ${PROJECT_SOURCE_DIR}/lib)
set(SRC_DIR ${PROJECT_SOURCE_DIR}/src)
set(LIBUNP_NAME ${MLIB_DIR}/libunp.a) # 可以把这行注释掉以节省编译时间

# 包含目录
include_directories(
    ${MLIB_DIR}
    ${LOCAL_LIB_DIR}
)

# 添加公共和私有源文件到变量
aux_source_directory(${MLIB_DIR} MLIBSRC)     # 公用
aux_source_directory(${LOCAL_LIB_DIR} LOCLIBSRC)   # 私有

# 设置可执行文件输出路径
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)   # PROJECT_SOURCE_DIR为CMakeLists.txt所在的目录

# 添加链接库
link_libraries(crypt pthread ${LIBUNP_NAME})

# 添加编译选项
add_compile_options(-g -O2 -Wall -Wextra)  # 启用所有警告、额外警告

# 将可执行文件的名字存储在变量中
set(EXE_NAME "UDPCLI01")

add_executable(${EXE_NAME}
    ${LOCLIBSRC}
    ${SRC_DIR}/udpcli01.c
)

add_definitions(-D_REENTRANT)

