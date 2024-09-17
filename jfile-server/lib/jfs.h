#include "unp.h"
#include "utils.h"

void remove_newline(char *str, ssize_t n);

void jstr_cli(FILE *fp, int sockfd);

void jstr_serv(int sockfd);

void request_handler(int sockfd, char *buf, ssize_t n);