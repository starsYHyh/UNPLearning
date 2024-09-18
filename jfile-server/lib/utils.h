#include <dirent.h>
#include <stdbool.h>
#include "unp.h"


/* 返回当前所在目录 */
void mpwd(char *ans);

/* 打开某一目录 */
void mcd(char *ans, const char *path);

/* 展示指定目录下的文件 */
void mls(char *ans, const char *path);