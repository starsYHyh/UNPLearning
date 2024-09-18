#include "utils.h"
#include <linux/limits.h>

void mpwd(char *buf) {
    if (getcwd(buf, PATH_MAX) == NULL) 
        err_quit(strerror(errno));
}

void mcd(char *buf) {
    if (chdir(buf) == -1)
        err_quit("error in chdir");
}