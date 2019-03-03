SRC = copy-acl.c file-has-acl.c lstat.c quote.c set-mode-acl.c \
       xalloc-die.c exitfail.c localcharset.c quotearg.c regex.c \
       tempname.c xmalloc.c
OBJ = $(SRC:.c=.o)
AR = ar
ARFLAGS = cru
RANLIB = ranlib
CC = gcc
CFLAGS = -g -O2
CPPFLAGS = -DHAVE_CONFIG_H -I. -I..
DESTDIR = /usr/local

all : depend libsed.a

%.o : %.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@

depend :
	gcc -MM $(CPPFLAGS) $(SRC) > .depend
-include .depend

libsed.a : $(OBJ)
	$(AR) $(ARFLAGS) $@ $(OBJ)
	$(RANLIB) $@

clean :
	rm -f $(OBJ) .depend libsed.a
	rm -f *~

install : all
	mkdir -p $(DESTDIR)/lib
	cp libsed.a $(DESTDIR)/lib

.PHONY : all depend install clean 
