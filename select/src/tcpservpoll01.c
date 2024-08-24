#include "unp.h"
#include <limits.h>

/*
    使用poll函数的服务器端
*/
int main(int argc, char *argv[]) {
    int i, maxi, listenfd, connfd, sockfd;
    int nready;
    ssize_t n;
    char buf[MAXLINE];
    socklen_t clilen;
    // 得用FOPEN_MAX，若是使用OPEN_MAX则无法通过编译，报错为‘OPEN_MAX’ undeclared
    // https://stackoverflow.com/questions/14042824/where-is-open-max-defined-for-linux-systems
    struct pollfd client[FOPEN_MAX];    
    struct sockaddr_in cliaddr, servaddr;

    listenfd = Socket(AF_INET, SOCK_STREAM, 0);

    bzero(&servaddr, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
    servaddr.sin_port = htons(SERV_PORT);

    Bind(listenfd, (SA*)&servaddr, sizeof(servaddr));
    Listen(listenfd, LISTENQ);
    client[0].fd = listenfd;
    client[0].events = POLLRDNORM;

    for (i = 1; i < FOPEN_MAX; i++) 
        client[i].fd = -1;
    maxi = 0;

    for (;;) {
        nready = Poll(client, maxi + 1, INFTIM);

        if (client[0].revents & POLLRDNORM) {   // 如果有新的连接
            clilen = sizeof(cliaddr);
            connfd = Accept(listenfd, (SA*)&cliaddr, &clilen);

            for (i = 1; i < FOPEN_MAX; i++) // 从前往后找第一个未被利用的数组元素
                if (client[i].fd < 0) {
                    client[i].fd = connfd;
                    break;
                }
            if (i == FOPEN_MAX)
                err_quit("too many clients");
            client[i].events = POLLRDNORM;
            if (i > maxi)   // 更新最大文件描述符
                maxi = i;
            if (--nready <= 0)
                continue;
            
        }

        for (i = 1; i <= maxi; i++) {
            if ((sockfd = client[i].fd) < 0)
                continue;
            if (client[i].revents & (POLLRDNORM | POLLERR)) {   // 如果是客户连接套接字可以读
                if ((n = read(sockfd, buf, MAXLINE)) < 0) { // 这里为read而不是Read
                    if (errno == ECONNRESET) {
                        Close(sockfd);
                        client[i].fd = -1;
                    } else
                        err_sys("read error");                    
                } else if (n == 0) {    // 如果
                    Close(sockfd);
                    client[i].fd = -1;
                } else
                    Writen(sockfd, buf, n);
                
                if (--nready <= 0)
                    break;
            }
        }
    }
}