#include <stdio.h>
#include <unistd.h>
#include <limits.h>
#include <dirent.h>
#include <errno.h>
#include <string.h>

#ifndef PATH_MAX
    #define PATH_MAX 256
#endif

void mls(char *ans, const char *path) {
    DIR *dirp;
    struct dirent *dp;
    // 下面有bug
    if (path == NULL)
        dirp = opendir(".");
    else 
        dirp = opendir(path);
    
    for (;;) {
        errno = 0;
        
        if ((dp = readdir(dirp)) == NULL)
            break;
        
        if (strcmp(dp->d_name, ".") == 0 || strcmp(dp->d_name, "..") == 0)
            continue;
        strcat(ans, dp->d_name);
        strcat(ans, "\t");
    }
    closedir(dirp);
    
}

int main() {

    const char *str = "/home/firefly/Codes/C/UNP/Test/";
    for (;;) {
    char ans[4096];
        mls(ans, str);

    printf("%s\n", ans);
    }

    return 0;
}
