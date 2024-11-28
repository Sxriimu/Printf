NAME	= libftprintf.a

SRCS    = $(shell find . -name '*.c')
OBJS	= $(SRCS:.c=.o)

CC	= gcc
RM	= rm -f
AR = ar rcs

CFLAGS	= -Wall -Wextra -Werror

DEPFLAGS = -MMD -MF $(@:.o=.d)

all:  ${NAME}

${NAME}: ${OBJS}
		$(AR) $(NAME) $(OBJS)

%.o: %.c
	$(CC) $(CFLAGS) $(DEPFLAGS) -c $< -o $@

-include $(OBJS:.o=.d)

clean:
			$(RM) $(OBJS) $(OBJS:.o=.d)

fclean: clean
	${RM} ${NAME}

re:			fclean all

.PHONY:		all clean fclean re