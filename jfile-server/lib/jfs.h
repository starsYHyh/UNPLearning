#include "unp.h"
#include "utils.h"

/*
    删除或添加结尾的\n
*/
void remove_newline(char *str, ssize_t n);

/*
    参数处理
*/
char **args_trim(char *request);

/*
    客户端发送数据
*/
void jstr_cli(FILE *fp, int sockfd);

/*
    服务器接收并回传数据
*/
void jstr_serv(int sockfd);

/*
    请求处理
*/
void request_handler(int sockfd, char *buf, ssize_t n);