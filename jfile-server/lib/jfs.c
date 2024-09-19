#include "jfs.h"

#ifndef PATH_MAX
    #define PATH_MAX 256
#endif


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

struct arg *argv_trim(char *request, ssize_t n) {
    char **argv = malloc(sizeof(char *) * n);
    ssize_t a = 0;
    ssize_t b = 0;
    int argc = 0;
    for (;;) {
        while (request[b] == ' ' && request[b] != '\n') {
            a++;
            b++;
        }
        if (request[b] == '\n')
            break;
        while (request[b] != ' ' && request[b] != '\n') {
            b++;
        }
        argv[argc] = malloc(sizeof(char) * (b - a));
        bzero(argv[argc], b - a);
        memcpy(argv[argc], request + a, b - a);
        a = b;
        argc++;
    }
    struct arg *arg = malloc(sizeof(struct arg));
    arg->argc = argc;
    arg->argv = argv;
    arg->argv = realloc(argv, sizeof(char *) * argc);
    return arg;
}


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
    struct arg *arg = argv_trim(buf, n);
    char **argv = arg->argv;
    int argc = arg->argc;
    char ans[MAXLINE];

    
    if (strcmp(argv[0], "pwd") == 0) {
        mpwd(ans);
    } else if (strcmp(argv[0], "cd") == 0) {
        // char *path;
        mcd(ans, argv[1]);
    } else if (strcmp(argv[0], "ls") == 0) {
        mls(ans, argv[1]);
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