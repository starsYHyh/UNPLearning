#include "unp.h"
#include "sigchldwait.h"

/*
    对读取到的客户端发送的两个数进行求和，并简化结果返还给客户
*/
void str_echo08(int sockfd) {
    long arg1, arg2;
    ssize_t n;
    char line[MAXLINE];

    for(;;) {
        if ((n = Readline(sockfd, line, MAXLINE)) == 0)
            return;
        if (sscanf(line, "%ld%ld", &arg1, &arg2) == 2)  // 返回值是一个整数，表示成功读取并转换的输入项的数量。
            snprintf(line, sizeof(line), "%ld\n", arg1 + arg2);
        else
            snprintf(line, sizeof(line), "input error\n");
        n = strlen(line);
        Writen(sockfd, line, n);
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
            str_echo08(connfd); 
            exit(0);
        }
        printf("child %d created\n", childpid);
        Close(connfd); 
    }
}