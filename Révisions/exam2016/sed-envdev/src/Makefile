SRC = compile.c execute.c fmt.c mbcs.c regexp.c sed.c utils.c
OBJ = $(SRC:.c=.o)
CC = gcc
CFLAGS = -g -O2
CPPFLAGS = -DHAVE_CONFIG_H -I. -I.. -I../lib -DLOCALEDIR=\"/usr/local/share/locale\"
MAKE = make
LDFLAGS = -L../lib
LDLIBs = -lsed
DESTDIR = /usr/local

all : depend sed

%.o : %.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@

depend :
	$(CC) -MM -DHAVE_CONFIG_H -I. -I.. -I../lib $(SRC) > .depend
-include .depend

../lib/libsed.a :
	cd ../lib && $(MAKE)

sed : $(OBJ) ../lib/libsed.a
	$(CC) -o sed $(OBJ) $(LDFLAGS) $(LDLIBS)

clean :
	rm -f sed .depend $(OBJ)
	rm -f *~

install : all
	mkdir -p $(DESTDIR)/bin
	cp sed $(DESTDIR)/bin

.PHONY : all depend install clean
