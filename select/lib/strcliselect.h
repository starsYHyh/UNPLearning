#include "unp.h"


// 使用select的str_cli函数的实现，但是不支持批量输入
void str_cli01(FILE *fp, int sockfd);

// 解决了批量输入的问题
void str_cli02(FILE *fp, int sockfd);