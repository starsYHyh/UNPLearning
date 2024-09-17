#include "utils.h"
#include <linux/limits.h>

void mpwd(char *buf) {
    if (getcwd(buf, PATH_MAX) == NULL) 
        err_quit(strerror(errno));
}