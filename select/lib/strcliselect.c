#include "strcliselect.h"

void str_cli01(FILE *fp, int sockfd) {
    int maxfpd1;
    fd_set rset;
    char sendline[MAXLINE], recvline[MAXLINE];

    FD_ZERO(&rset);

    for (;;) {
        FD_SET(fileno(fp), &rset);
        FD_SET(sockfd, &rset);
        maxfpd1 = max(fileno(fp), sockfd) + 1;
        Select(maxfpd1, &rset, NULL, NULL, NULL);   // 阻塞于此
        printf("ready to read!\n");
        if (FD_ISSET(sockfd, &rset)) {
            if (Readline(sockfd, recvline, MAXLINE) == 0)
                err_quit("str_cli: server terminated premuturely");
            Fputs(recvline, stdout);
        }

        if (FD_ISSET(fileno(fp), &rset)) {
            if (Fgets(sendline, MAXLINE, fp) == NULL)
                return;
            Writen(sockfd, sendline, strlen(sendline));
        }
    }
}

void str_cli02(FILE *fp, int sockfd) {
    int  maxfdp1, stdineof;
    fd_set rset;
    char buf[MAXLINE];
    int n;

    stdineof = 0;
    FD_ZERO(&rset);
    for (;;) {
        if (stdineof == 0)
            FD_SET(fileno(fp), &rset);
        FD_SET(sockfd, &rset);
        maxfdp1 = max(fileno(fp), sockfd) + 1;
        Select(maxfdp1, &rset, NULL, NULL, NULL);

        if (FD_ISSET(sockfd, &rset)) {
            if ((n = Read(sockfd, buf, MAXLINE)) == 0) {
                if (stdineof == 1) {
                    printf("cli input over\n");
                    return;
                }
                else 
                    err_quit("str_cli: server terminated premuturely");
            }
            printf("serv tranlate one line\n");
            Write(fileno(stdout), buf, n);
        }

        if (FD_ISSET(fileno(fp), &rset)) {
            // 用户输入了多少行，则向服务器传输多少次
            // 如果输入了ctrl+d，则为EOF，说明用户输入完了数据
            if ((n = Read(fileno(fp), buf, MAXLINE)) == 0) {    
                printf("input over\n");
                // 则关闭本方面的写入连接
                stdineof = 1;
                Shutdown(sockfd, SHUT_WR);
                FD_CLR(fileno(fp), &rset);
                continue;
            }
            Writen(sockfd, buf, n);
            // 由于网络速度的不确定性，可能cli还没传输完所有的行，就已经收到了来自服务器的回应
            printf("cli translate one line\n");
        }
    }
}