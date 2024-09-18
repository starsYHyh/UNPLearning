#include "jfs.h"

#ifndef PATH_MAX
    #define PATH_MAX 256
#endif

/*
    删除或添加结尾的\n
*/
void rmad_newline(char *buf, ssize_t *n, int flag) {
    ssize_t len = *n;

    if (!flag && buf[len - 1] == '\n') {
        buf[len - 1] = '\0';
        len--;
    } else if (flag && buf[len - 1] != '\n') {
        buf[len] = '\n';
        len++;
    }
    (*n) = len;
}

/*
    客户端发送数据
*/
void jstr_cli(FILE *fp, int sockfd) {
    // 发送数组，接受数组
    char sendline[MAXLINE], recvline[MAXLINE];

    // 从文件指针中读取一行
    while (write(STDOUT_FILENO, ">>> ", 4) && Fgets(sendline, MAXLINE, fp) != NULL) {
        // 将内容写入发送数组中
        Writen(sockfd, sendline, strlen(sendline));


        // Readline会读到换行符或EOF或超过指定字节数为止，如果服务器发送过来的数据没有换行符，则Fgets无法正常结束
        // 且只读一行，若server一次回答发送了多行，则只有第一行会读入，后续的行需要再次调用 Readline() 才能读取。
        if (Readline(sockfd, recvline, MAXLINE) == 0)
            err_quit("str_cli: server terminated prematurely");
        Fputs(recvline, stdout);
    }
}

void request_handler(int sockfd, char *buf, ssize_t n) {
    rmad_newline(buf, &n, 0);
    char ans[MAXLINE];
    if (strcmp(buf, "pwd") == 0) {
        mpwd(ans);
    } else if (strcmp(buf, "cd") == 0) {
        mcd("/home/ubuntu/Documents/C/UNPLearning/jfile-server/");
    }

    else {
        strcpy(ans, "Wrong request!\n");
    }

    ssize_t anslen = strlen(ans);
    rmad_newline(ans, &anslen, 1);
    Writen(sockfd, ans, anslen);
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