#include "utils.h"
#include "jfs.h"
#include <linux/limits.h>

void mpwd(char *ans) {
    if (getcwd(ans, PATH_MAX) == NULL) 
        err_quit(strerror(errno));
}

void mcd(char *ans, const char *path) {
    if (path == NULL)
        snprintf(ans, MAXLINE, "please input right directory");
    else if (chdir(path) == -1)
        err_quit("error in chdir");
    snprintf(ans, MAXLINE, "changed dir to %s", path);
}

void mls(char *ans, struct arguments *arg) {
    DIR *dirp;
    struct dirent *dp;
    int count = arg->argc;

    if (count == 1) {
        dirp = opendir(".");
    } else {
        dirp = 
    }

    // 下面有bug
    if (path == NULL)
        dirp = opendir(".");
    else 
        dirp = opendir(path);
    if (dirp == NULL) 
        err_quit("opendir failed");
    
    for (;;) {
        errno = 0;
        if ((dp = readdir(dirp)) == NULL)
            break;
        
        if (strcmp(dp->d_name, ".") == 0 || strcmp(dp->d_name, "..") == 0)
            continue;
        strcat(ans, dp->d_name);
        strcat(ans, "\t");
    }
    if (errno != 0) 
        err_quit("readdir");
    if (closedir(dirp) == -1)
        err_quit("closedir");
    
}