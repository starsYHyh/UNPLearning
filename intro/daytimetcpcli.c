#include "unp.h"

int main(int argc, char *argv[])
{
    int sockfd, n;  // 套接字
    struct sockaddr_in servaddr;    // 套接字地址
    char recvline[MAXLINE + 1];
    if (argc != 2)
        err_quit("usage: DAYTIMETCPCLI <IPaddress>");
    // if ((sockfd = socket(AF_INET, SOCK_STREAM, 0)) < 0)
    //     err_sys("socket error");
    sockfd = Socket(AF_INET, SOCK_STREAM, 0);

    bzero(&servaddr, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(9999);
    if (inet_pton(AF_INET, argv[1], &servaddr.sin_addr) <= 0)   // 将点分十进制转化为二进制值
        err_quit("inet_pton error for %s", argv[1]);

    // if (connect(sockfd, (SA *)&servaddr, sizeof(servaddr)) < 0) 
    //     err_sys("connect error");
    Connect(sockfd, (SA *)&servaddr, sizeof(servaddr));

    int count = 0;
    while ((n = read(sockfd, recvline, MAXLINE)) > 0)
    {
        recvline[n] = 0;
        if (fputs(recvline, stdout) == EOF)
            err_sys("fputs error");
        count++;
    }
    printf("COUNT = %d\n", count);
    if (n < 0)
        err_sys("read_error");

    exit(0);
}