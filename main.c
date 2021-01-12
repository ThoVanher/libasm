#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int	ft_strlen(const char *str);
int	ft_strcmp(const char *s1, const char *s2);
char *ft_strcpy(char *dest, char *src);
char *ft_strdup(const char *s1);

int main(int argc, char **argv)
{
//char dest[100];
//char dest2[100];
if (argc == 0)
	return (0);
//printf("%s\n", ft_strdup("hello world  !!!!!"));
/*printf(" dest après copy : %s\n", ft_strcpy(dest, argv[1]));
printf(" dest après copy : %s\n", strcpy(dest2, argv[1]));
printf("comparison between '%s' & '%s' = %d\n", argv[1], argv[2], ft_strcmp(argv[1], argv[2]));
printf("comparison between '%s' & '%s' = %d\n", argv[1], argv[2], strcmp(argv[1], argv[2]));*/
printf("length of '%s' = %d\n", argv[1], ft_strlen(argv[1]));
return (0);
}

