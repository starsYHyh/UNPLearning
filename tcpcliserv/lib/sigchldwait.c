#include "sigchldwait.h"

void sig_chld(int signo) {
    pid_t pid;
    int stat;

    // wait()是为了清理僵死进程
    /*
        wait()版本：
        若服务器和客户端在同一主机上，则该信号处理函数只执行过一次，对于客户与服务器之间的五个连接
    */
    // pid = wait(&stat);
    // printf("child %d terminated\n", pid);

    while ((pid = waitpid(-1, &stat, WNOHANG)) > 0) 
        printf("child %d terminated\n", pid);
    return;
}