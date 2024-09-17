#include "jfs.h"

void remove_newline(char *buf, ssize_t n) {
    if (buf[n - 1] == '\n') {
        buf[n - 1] = '\0';
    }
}

void jstr_cli(FILE *fp, int sockfd) {
    // 发送数组，接受数组
    char sendline[MAXLINE], recvline[MAXLINE];

    // 从文件指针中读取一行
    while (Fgets(sendline, MAXLINE, fp) != NULL) {
        // 将内容写入发送数组中
        Writen(sockfd, sendline, strlen(sendline));


        // Readline会读到换行符或EOF或超过指定字节数为止，如果服务器发送过来的数据没有换行符，则Fgets无法正常结束
        // 且只读一行，若server一次回答发送了多行，则只有第一行会读入，后续的行需要再次调用 Readline() 才能读取。
        if (Readline(sockfd, recvline, MAXLINE) == 0)
            err_quit("str_cli: server terminated prematurely");
        Fputs(recvline, stdout);
        Readline(sockfd, recvline, MAXLINE);
        Fputs(recvline, stdout);
    }
}

void request_handler(int sockfd, char *buf, ssize_t n) {
    // remove_newline(buf, n);
    Writen(sockfd, buf, n);
}

void jstr_serv(int sockfd) {
    ssize_t n;
    char buf[MAXLINE];

again:
    while ((n = read(sockfd, buf, MAXLINE)) > 0) {
        
        request_handler(sockfd, buf, n);
    }
    
    if (n < 0 && errno == EINTR)
        goto again;
    else if (n < 0)
        err_sys("jstr_serv: read error");

}