#include "utils.h"
#include <linux/limits.h>

void mpwd(char *ans) {
    if (getcwd(ans, PATH_MAX) == NULL) 
        err_quit(strerror(errno));
}

void mcd(char *ans, const char *path) {
    if (chdir(path) == -1)
        err_quit("error in chdir");
    snprintf(ans, MAXLINE, "changed dir to %s", path);
}