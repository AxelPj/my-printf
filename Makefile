NAME = libmyprintf.a
CC = gcc
SRC =	conversion_utils.c \
		my_printf.c \
		my_parse_printf.c \
		string_utils.c

CFLAGS = -Wall -Wextra -Werror
OBJ = $(SRC:.c=.o)
all: $(NAME)

$(NAME): $(OBJ)
	@ar rcs $(NAME) $(OBJ)
	@ranlib $(NAME)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	@rm -f $(OBJ)

fclean: clean
	@rm -f $(NAME)

re: fclean all