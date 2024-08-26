#include "unp.h"
#include "strcliselect.h"
#include <netinet/tcp.h>

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
    // Setsockopt(sockfd, IPPROTO_TCP, TCP_NODELAY, 1, sizeof(int));
    Connect(sockfd, (SA *)&servaddr, sizeof(servaddr));
    str_cli02(stdin, sockfd);
    exit(0);
// sentence1
// sentence2
// sentence3
// sentence1
// sentence2
// sentence3
// sentence1
// sentence2
// sentence3
// sentence1
// sentence2
// sentence3
// sentence1
// sentence2
// sentence3


}