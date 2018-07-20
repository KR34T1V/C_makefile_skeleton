# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cterblan <cterblan@student.wethinkcode>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/07/17 11:24:40 by cterblan          #+#    #+#              #
#    Updated: 2018/07/20 13:33:21 by cterblan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

################################################################################
#								FILE NAME
################################################################################
NAME := {NAME}
#OUTPUT FILE NAME ^^^
################################################################################
#								DIRECTORIES
################################################################################
INC_DIR := {INC}
#INCLUDES DIRECTORY ^^^
SRC_DIR := {SRC}
#SOURCES DIRECTORY ^^^
OBJ_DIR := {OBJ}
#OBJECTS DIRECTORY ^^^
LIB_DIR := {LIB}
#LIBRARY DIRECTORY ^^^
################################################################################
#								FILES
################################################################################
#SRC:= ft_function.c
SRC :=	{FILE}
#ADD SOURCE FILES HERE ^^^
OBJ := $(addprefix $(OBJ_DIR)/, $(SRC:%.c=%.o))
################################################################################
#								LIBRARIES
################################################################################
#NAME_DIR := $(LIBDIR)/{library}
{LIBRARY}_DIR := $(LIB_DIR)/{LIBRARY}
#ADD ADDITIONAL LIBRARIES HERE ^^^
LIB_FLAG := -lft
################################################################################
#								COMPILER
################################################################################
CFLAGS := -Wall -Werror -Wextra
#ADD ADDITIONAL FLAGS HERE ^^^
CC := gcc $(CFLAGS)
################################################################################
#								RULES
################################################################################

all: $(NAME)

$(NAME): $(OBJ)
	@make all -C $(LIBFT_DIR)/
	@echo "\033[35m\t\t[COMPILING] $@\033"
#COMPILE EXECUTABLE vvv
	#$(CC) -o $@ -I $(INC_DIR) -L $(LIBFT_DIR)/ $(LIB_FLAG) $(OBJ)
#COMPILE LIBRARY vvv
	#ar rcs $(NAME) $(OBJ)
	@echo "\033[32m\t\t[COMPILED SUCCESSFULLY]\033"
	@echo "\007"
	#DON'T TOUCH ^^^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@echo "\033[36m\t\t[Building]\033[0m $@"
	@mkdir -p $(OBJ_DIR)
	@$(CC) -I $(INC_DIR) -o $@ -c $<
	@echo "\033[33m\t\t[SUCCESS]\033[0m"
	#DON'T TOUCH ^^^

clean: cleanlib
	@echo "\033[31m\t\t[CLEANING]\t$(OBJ_DIR)\033[0m"
	@rm -rf $(OBJ_DIR)
	#DON'T TOUCH ^^^

cleanlib:
	@echo "\033[31m\t\t[CLEANING]\t$(LIB_DIR)\033[0m"
	@make clean -C {LIBRARY}
	#ADD ADDITIONAL LIBRARIES HERE ^^^

fclean: clean fcleanlib
	@echo "\033[31m\t\t[FCLEAN]\t$(NAME)\033[0m"
	@rm -f $(NAME)
	#ADD ADDITIONAL NAME FILES HERE ^^^

fcleanlib:
	@echo "\033[31m\t\t[FCLEAN]\t$(LIB_DIR)]\033[0m"
	@make fclean -C {LIBRARY}
	#ADD ADDITIONAL LIBRARIES HERE ^^^

re: fclean all
################################################################################
#								SPECIAL
################################################################################

.PHONEY := all clean fclean re
#ADD PHONEY HERE ^^^

.SILENT:
#DON'T TOUCH ^^^

.PRECIOUS := author
#ADD PRECIOUS HERE ^^^
