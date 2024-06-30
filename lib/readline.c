/* include readline */
#include "unp.h"

static int read_cnt;	// 表示缓冲区中剩余的未处理字节数，初始时为0
static char *read_ptr;	// 指向 read_buf 缓冲区中的当前读取位置
static char read_buf[MAXLINE];	// 缓冲区，用于存储从文件描述符中读取的数据，大小为 MAXLINE。

static ssize_t
my_read(int fd, char *ptr)
{
	if (read_cnt <= 0)
	{
	again:
		if ((read_cnt = read(fd, read_buf, sizeof(read_buf))) < 0)
		{
			if (errno == EINTR)
				goto again;
			return (-1);
		}
		else if (read_cnt == 0)
			return (0);
		read_ptr = read_buf;
	}

	read_cnt--;
	*ptr = *read_ptr++;
	return (1);
}

ssize_t
readline(int fd, void *vptr, size_t maxlen)
{
	ssize_t n, rc;
	char c, *ptr;

	ptr = vptr;
	for (n = 1; n < maxlen; n++)
	{
		if ((rc = my_read(fd, &c)) == 1)
		{
			*ptr++ = c;
			if (c == '\n')
				break; /* newline is stored, like fgets() */
		}
		else if (rc == 0)
		{
			*ptr = 0;
			return (n - 1); /* EOF, n - 1 bytes were read */
		}
		else
			return (-1); /* error, errno set by read() */
	}

	*ptr = 0; /* null terminate like fgets() */
	return (n);
}

ssize_t
readlinebuf(void **vptrptr)
{
	if (read_cnt)
		*vptrptr = read_ptr;
	return (read_cnt);
}
/* end readline */

ssize_t
Readline(int fd, void *ptr, size_t maxlen)
{
	ssize_t n;

	if ((n = readline(fd, ptr, maxlen)) < 0)
		err_sys("readline error");
	return (n);
}
