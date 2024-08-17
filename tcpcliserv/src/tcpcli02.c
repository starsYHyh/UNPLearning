#include "unp.h"

/*
    调整str_cli函数，使得调用两次Writen，
    以测试SIGPIPE信号的作用
*/

void sig_pipe(int signo) {
    printf("caught SIGPIPE\n");
}

void str_cli1(FILE *fp, int sockfd) {
    char sendline[MAXLINE], recvline[MAXLINE];

	while (Fgets(sendline, MAXLINE, fp) != NULL) {

		Writen(sockfd, sendline, 1);
        sleep(1);
        Writen(sockfd, sendline + 1, strlen(sendline) - 1);

		if (Readline(sockfd, recvline, MAXLINE) == 0)
			err_quit("str_cli: server terminated prematurely");

		Fputs(recvline, stdout);
	}
}

int main(int argc, char *argv[]) {
    int sockfd;
    struct sockaddr_in servaddr;

    if (argc != 2) 
        err_quit("usage: tcpcli <IPaddress>");
    sockfd = Socket(AF_INET, SOCK_STREAM, 0);
    bzero(&servaddr, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(SERV_PORT);
    Inet_pton(AF_INET, argv[1], &servaddr.sin_addr);

    Signal(SIGPIPE, sig_pipe);

    Connect(sockfd, (SA *)&servaddr, sizeof(servaddr));
    str_cli1(stdin, sockfd);
    exit(0);
}

/*
➜  bin git:(main) ✗ ./TCPCLI02 127.0.0.1
child 100591 created
Hello
Hello
child 100591 terminated
bye
caught SIGPIPE
writen error: Broken pipe

*/