#include "unp.h"
#include "sigchldwait.h"

// TCP回射服务器程序
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
        /*
            accept()函数为慢系统调用函数，调用有可能永远无法返回，
            例如，如果没有客户连接到服务器上，那么服务器的accept就没有返回的保证
            当阻塞与某个慢系统调用的一个进程捕获某个信号且相应信号处理函数返回时，
            该系统调用可能返回一个EINTR错误。
            因为部分系统并不会在这之后重启慢系统调用函数，因此为了移植性，我们需要自己处理该函数的失败情况以重启该函数
        */
        if ((connfd = accept(listenfd, (SA *)&cliaddr, &clilen)) < 0)
        {
            if (errno == EINTR)
                continue; /* back to for() */
            else
                err_sys("accept error");
        }

        if ((childpid = Fork()) == 0)
        {                     /* child process */
            Close(listenfd);  /* close listening socket */
            str_echo(connfd); /* process the request */
            exit(0);
        }
        Close(connfd); /* parent closes connected socket */
    }
}