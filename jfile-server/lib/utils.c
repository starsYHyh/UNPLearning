#include "utils.h"

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
    char *path = arg->argc == 1 ? "." : arg->argv[1];
    dirp = opendir(path);
    if ((dirp = opendir(path)) == NULL)
        snprintf(ans, MAXLINE, "%s is not a directory", path);
    
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