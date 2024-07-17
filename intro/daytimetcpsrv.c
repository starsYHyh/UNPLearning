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
    // 涉及到捆绑操作的三个对象：套接字、地址、端口
    Bind(listenfd, (SA *)&servaddr, sizeof(servaddr));  // 绑定套接字与其地址
    // getsockname(listenfd, )
    Listen(listenfd, LISTENQ);  // 套接字监听

    for (;;)
    {
        connfd = Accept(listenfd, (SA *)NULL, NULL);
        // 第二个参数为客户进程的协议地址，第三个参数为实际长度，为值-结果参数
        // listenfd为监听套接字，一个服务器通常仅仅创造一个，再生命期内一直存在。
        // connfd为已连接套接字为accept的返回值，内核为每个由服务器进程接受的客户连接创建一个已连接套接字
        // 当服务器完成对某个给定客户的服务时，相应的已连接套接字就被关闭。
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