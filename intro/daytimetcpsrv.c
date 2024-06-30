#include "unp.h"
#include <time.h>

int main(int argc, char *argv[])
{
    int listenfd, connfd;   // 套接字
    struct sockaddr_in servaddr;    // 套接字地址
    char buff[MAXLINE];
    time_t ticks;
    listenfd = Socket(AF_INET, SOCK_STREAM, 0); // 创建套接字，IPv4+字节流套接字，默认protocol

    bzero(&servaddr, sizeof(servaddr)); 
    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(9999);    // 设置端口号为9999，且为网络字节序
    servaddr.sin_addr.s_addr = htonl(INADDR_ANY);   // 主机字节流转网络字节流，长整数类型，INADDR_ANY说明，若为多宿主机，则选择任意一个网络地址

    Bind(listenfd, (SA *)&servaddr, sizeof(servaddr));  // 绑定套接字与其地址
    Listen(listenfd, LISTENQ);  // 套接字监听

    for (;;)
    {
        connfd = Accept(listenfd, (SA *)NULL, NULL);
        ticks = time(NULL);
        snprintf(buff, sizeof(buff), "%.24s\r\n", ctime(&ticks));
        // int len = strlen(buff), count = 0;
        // while (count < len) {
        //     Write(connfd, buff + count, 1);
        //     count++;
        // }
        Write(connfd, buff, strlen(buff));

        Close(connfd);
    }
}