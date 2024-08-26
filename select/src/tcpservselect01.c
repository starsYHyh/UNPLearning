#include "unp.h"
#include <netinet/tcp.h>

int main(int argc, char *argv[]) {
    int i, maxi, maxfd, listenfd, connfd, sockfd;
    int nready, client[FD_SETSIZE];
    ssize_t n;
    fd_set rset, allset;
    char buf[MAXLINE];
    socklen_t clilen;
    struct sockaddr_in cliaddr, servaddr;
    int optval = 1;

    listenfd = Socket(AF_INET, SOCK_STREAM, 0);

    bzero(&servaddr, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
    servaddr.sin_port = htons(SERV_PORT);

    Setsockopt(listenfd, SOL_SOCKET, SO_REUSEADDR, &optval, sizeof(optval));

    Bind(listenfd, (SA*)&servaddr, sizeof(servaddr));
    Listen(listenfd, LISTENQ);
    maxfd = listenfd;   // maxfd为最大的打开的文件描述符
    maxi = -1;  // maxi为最大已连接套接字在数组中的下标
    for (i = 0; i < FD_SETSIZE; i++) 
        client[i] = -1;
    
    FD_ZERO(&allset);
    FD_SET(listenfd, &allset);

    for (;;) {
        rset = allset;
        // 被设置为监视的文件描述符集合中有多少个文件描述符已经准备好进行 I/O 操作
        nready = Select(maxfd + 1, &rset, NULL, NULL, NULL);

        if (FD_ISSET(listenfd, &rset)) {    // 如果监听套接字可以读
            clilen = sizeof(cliaddr);
            connfd = Accept(listenfd, (SA*)&cliaddr, &clilen);
            Setsockopt(connfd, IPPROTO_TCP, TCP_NODELAY, &optval, sizeof(optval));

            for (i = 0; i < FD_SETSIZE; i++) 
                if (client[i] < 0) {
                    client[i] = connfd;
                    break;
                }
            
            if (i == FD_SETSIZE)
                err_quit("too many clients");
            
            FD_SET(connfd, &allset);    // 则将与对应客户端的连接套接字置于集合之中
            if (connfd > maxfd)
                maxfd = connfd;
            if (i > maxi)   
                maxi = i;
            if (--nready <= 0)
                continue;
        }

        for (i = 0; i <= maxi; i++) {
            if ((sockfd = client[i]) < 0)
                continue;
            if (FD_ISSET(sockfd, &rset)) {
                if ((n = Read(sockfd, buf, MAXLINE)) == 0) {    // 如果为EOF
                    // 则关闭套接字
                    Close(sockfd);
                    FD_CLR(sockfd, &allset);
                    client[i] = -1;
                } else // 如果接收到的是客户端输入的数据，则
                    Writen(sockfd, buf, n);
                
                // 满足本条件的，可能为客户端输入了正常的数据，也有可能客户端输入了EOF并shutdown了
                // 两者都需要将nready减一
                if (--nready <= 0)
                    break;
            }
        }
    }
}