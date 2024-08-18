#include "unp.h"
#include "sum.h"

void str_cli09(FILE *fp, int sockfd)
{
    char sendline[MAXLINE];
    struct args args;
    struct result res;

    while (Fgets(sendline, MAXLINE, fp) != NULL)
    {
        // sscanf将两个参数从文本串转换为二进制数
        if (sscanf(sendline, "%ld%ld", &args.arg1, &args.arg2) != 2)
        {
            printf("invalid input: %s", sendline);
            continue;
        }
        Writen(sockfd, &args, sizeof(args));
        if (Readn(sockfd, &res, sizeof(res)) == 0)
            err_quit("str_cli: server terminated prematurely");
        printf("%ld\n", res.sum);
    }
}

int main(int argc, char *argv[])
{
    int sockfd;
    struct sockaddr_in servaddr;

    if (argc != 2)
        err_quit("usage: tcpcli <IPaddress>");
    sockfd = Socket(AF_INET, SOCK_STREAM, 0);
    bzero(&servaddr, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(SERV_PORT);
    Inet_pton(AF_INET, argv[1], &servaddr.sin_addr);
    Connect(sockfd, (SA *)&servaddr, sizeof(servaddr));
    str_cli09(stdin, sockfd);
    exit(0);
}