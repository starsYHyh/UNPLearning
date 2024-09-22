#include <linux/limits.h>
#include "unp.h"


/*
    存放客户端传来的参数
*/
struct arguments
{
    char **argv;
    int argc;
};
