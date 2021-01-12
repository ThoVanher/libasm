#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>

int	ft_write(int fd, void *buff, size_t len);
int	ft_read(int fd, void *buff, size_t len);

extern int errno; 
int main(int argc, char **argv)
{
int ret;
int ret2;
char *str;

str = 0;
errno = 0;
if (argc == 1)
return (0);
ret = ft_write(atoi(argv[1]), argv[3], atoi(argv[2]));
printf("\n");
printf("errno = %d\n", errno);
ret2 = write(atoi(argv[1]), argv[3], atoi(argv[2]));
printf("\nerrno2 = %d\n", errno);
printf("ret = %d\n", ret);
printf("ret2 = %d\n", ret2);
//printf("myread = %d\n", ft_write(atoi(argv[1]), str, atoi(argv[2])));
//printf("hisread = %d\n", ft_write(atoi(argv[1]), str, atoi(argv[2])));

return (0);
}
