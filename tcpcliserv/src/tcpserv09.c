#include "unp.h"
#include "sigchldwait.h"
#include "sum.h"

/*
    对两个二进制整数进行求和，并简化结果返还给客户
*/
void str_echo09(int sockfd)
{
    ssize_t n;
    struct args args;
    struct result res;

    for (;;)
    {
        if ((n = Readn(sockfd, &args, sizeof(args))) == 0)
            return;
        res.sum = args.arg1 + args.arg2;
        Writen(sockfd, &res, sizeof(res));
    }
}

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

        if ((connfd = accept(listenfd, (SA *)&cliaddr, &clilen)) < 0)
        {
            if (errno == EINTR)
                continue;
            else
                err_sys("accept error");
        }

        if ((childpid = Fork()) == 0)
        {
            Close(listenfd);
            str_echo09(connfd);
            exit(0);
        }
        printf("child %d created\n", childpid);
        Close(connfd);
    }
}