#include "unp.h"
#include "sigchldwait.h"

// TCP回射服务器程序，为了处理僵死进程，增加信号处理函数
int main(int argc, char *argv[])
{
    int listenfd, connfd;
    pid_t childpid;
    socklen_t clilen;
    struct sockaddr_in cliaddr, servaddr;

    listenfd = Socket(AF_INET, SOCK_STREAM, 0);
    bzero(&servaddr, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
    servaddr.sin_port = htons(SERV_PORT);
    Bind(listenfd, (SA *)&servaddr, sizeof(servaddr));
    Listen(listenfd, LISTENQ);

    Signal(SIGCHLD, sig_chld);

    for (;;)
    {
        clilen = sizeof(cliaddr);
        connfd = Accept(listenfd, (SA *)&cliaddr, &clilen);
        if ((childpid = Fork()) == 0)
        {
            Close(listenfd);
            str_echo(connfd);
            exit(0); // 退出子进程
        }
        printf("child %d created\n", childpid);
        Close(connfd);
    }
}