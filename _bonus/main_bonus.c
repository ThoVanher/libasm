#include <stdio.h>
int verif_base(char *b);
int is_in_base(char *base, char c);
int place_in_base(char *base, char c);
int ft_atoi_base(char *str, char *base);
int ft_strlen(char *str);

int main(int argc, char **argv)
{
if (argc == 1)
	return (0);
printf("atoi: %d\n", ft_atoi_base(argv[1], argv[2]));
//printf("is_in_base:%d\n", is_in_base(argv[1], argv[2][0]));
//printf("place_in_base:%d\n", place_in_base(argv[1], argv[2][0]));
//printf("verif_base:%d\n", verif_base(argv[1]));
return (0);
}
