# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dfranke <dfranke@student.42wolfsburg.de>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/25 18:24:09 by dfranke           #+#    #+#              #
#    Updated: 2022/01/11 18:56:49 by dfranke          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME 				= libft.a
CC 					= gcc -c
FLAGS				= -Wall -Werror -Wextra -c -O3
INCLUDES			= -I$(HEADER_DIR)
HEADER_FILES		= libft.h
HEADER_DIR			= ./includes/
HEADER				= $(addprefix $(HEADER_DIR), $(HEADER_FILES))
SOURCES_DIR			= ./srcs/
SOURCES_FILES		= \
			ft_memset.c \
			ft_bzero.c \
			ft_memcpy.c \
			ft_memccpy.c \
			ft_memmove.c \
			ft_memchr.c \
			ft_memcmp.c \
			ft_strlen.c \
			ft_strlcpy.c \
			ft_strlcat.c \
			ft_strchr.c \
			ft_strrchr.c \
			ft_strnstr.c \
			ft_strncmp.c \
			ft_atoi.c \
			ft_isalpha.c \
			ft_isdigit.c \
			ft_isalnum.c \
			ft_isascii.c \
			ft_isprint.c \
			ft_toupper.c \
			ft_tolower.c \
			ft_calloc.c \
			ft_strdup.c \
			ft_substr.c \
			ft_strjoin.c \
			ft_strtrim.c \
			ft_split.c \
			ft_itoa.c \
			ft_strmapi.c \
			ft_putchar_fd.c \
			ft_putstr_fd.c \
			ft_putendl_fd.c \
			ft_putnbr_fd.c \
			ft_lstnew.c \
			ft_lstadd_front.c \
			ft_lstsize.c \
			ft_lstlast.c \
			ft_lstadd_back.c \
			ft_lstdelone.c \
			ft_lstclear.c \
			ft_lstiter.c \
			ft_lstmap.c \
			get_next_line.c
SOURCES			= $(addprefix $(SOURCES_DIR), $(SOURCES_FILES))
OBJECTS_DIR		= objs/
OBJECTS_FILES	= $(patsubst %.c, %.o, $(SOURCES_FILES))
OBJECTS			= $(addprefix $(OBJECTS_DIR), $(OBJECTS_FILES))

.PHONY:		all clean fclean re

all:	$(NAME)

$(NAME): $(OBJECTS_DIR) $(OBJECTS)
	@ar rc $(NAME) $(OBJECTS)
	@ranlib $(NAME)
	@echo "\n$(NAME): obj files created"
	@echo "$(NAME): $(NAME) created"

$(OBJECTS_DIR):
	@mkdir -p $(OBJECTS_DIR)
	@echo "$(NAME): $(OBJECTS_DIR) created"
	
$(OBJECTS_DIR)%.o : $(SOURCES_DIR)%.c $(HEADER)
	@$(CC) $(FLAGS) $(INCLUDES) $< -o $@
	@echo ".\c"
	
clean:
	@rm -rf $(OBJECTS_DIR)
	@echo "$(NAME): $(OBJECTS_DIR) deleted"
	@echo "$(NAME): obj files deleted"

fclean: clean
	@rm -f $(NAME)
	@echo "$(NAME): $(NAME) deleted"

re:
	@$(MAKE) fclean
	@$(MAKE) all