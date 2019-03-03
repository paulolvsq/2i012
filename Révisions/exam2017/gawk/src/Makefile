YACC = bison
YFLAGS = -y
CC = gcc
CFLAGS = -I. -DNDEBUG -DDEFPATH='".:/usr/local/share/awk"'  \
                -DDEFLIBPATH="\"/usr/local/lib/gawk\"" -DSHLIBEXT="\"so"\"   \
                -DHAVE_CONFIG_H -DGAWK \
                -DLOCALEDIR='"/usr/local/share/locale"'
CPPFLAGS = -g -O2
SRC = array.c          ext.c            getopt1.c        node.c           \
builtin.c        field.c          int_array.c      profile.c        regexec.c \
cint_array.c     floatcomp.c      io.c             random.c         replace.c \
debug.c          gawkapi.c        main.c           re.c             str_array.c \
dfa.c            gawkmisc.c       mpfr.c           symbol.c \
eval.c           getopt.c         msg.c            version.c
OBJ = $(SRC:.c=.o)
LDFLAGS = -Wl,-export-dynamic
LDLIBS = -lreadline -ldl -lm

all : depend gawk 

command.c :
	$(YACC) $(YFLAGS) -p zz command.y && sed 's/parse error/syntax error/g' <y.tab.c \
           | awk -f bisonfix.awk command > command.c
	rm y.tab.c

awkgram.c :
	$(YACC) $(YFLAGS) awkgram.y && sed 's/parse error/syntax error/g' <y.tab.c \
           | awk -f bisonfix.awk awkgram > awkgram.c
	rm y.tab.c

%.o : %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -c $<

depend : command.c awkgram.c
	 gcc -MM -I. -DNDEBUG -DDEFPATH='".:/usr/local/share/awk"'        \
                -DDEFLIBPATH="\"/usr/local/lib/gawk\"" -DSHLIBEXT="\"so"\"   \
                -DHAVE_CONFIG_H -DGAWK \
                -DLOCALEDIR='"/usr/local/share/locale"' \
	$(SRC) > .depends
-include .depends

gawk : $(OBJ)
	$(CC) -o gawk $(OBJ) $(LDFLAGS) $(LDLIBS)

clean :
	rm -f .depends gawk command.c awkgram.c $(OBJ)
	rm -f *~

install : all
	mkdir -p $(DESTDIR)/bin
	cp gawk $(DESTDIR)/bin

.PHONY : all depend clean

