#ifndef _BONUS_H
 #define _BONUS_H

typedef struct	s_list
{
void			*data;
struct s_list	*next;
}				t_list;

t_list	*ft_create_elem(void *data);
int	ft_list_push_front(t_list **begin_list, void *data);

#endif
