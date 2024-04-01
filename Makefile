# if you type 'make' without arguments, this is the default
PROG    = mycpp
all:    $(PROG)

# Tell make about the file dependecies
HEAD	= states.h
SRC     = states.c mycpp.c
OBJ     = ${SRC:%.c=%.o}

# special libraries This can be blank
LIB     =
LIBFLAGS    = -L ./ $(LIB)

# select the compiler and flags
# you can over-ride these on the command line e.g. make DEBUG= 
CC      = gcc
DEBUG	= -ggdb
CSTD	=
WARN	= -Wall -Wextra -Werror
CDEFS	=
CFLAGS	= -I. $(DEBUG) $(WARN) $(CSTD) $(CDEFS)

$(OBJ):	$(HEAD)

# specify how to compile the target
$(PROG):	$(OBJ)
	$(CC) $(CFLAGS) $(OBJ) $(LIB) -o $@

#list of test number
LIST    = 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33

test:    $(PROG)
	./runtest $(LIST)

# remove binaries
.PHONY: clean 
clean:
	rm -f $(OBJ) $(PROG)
