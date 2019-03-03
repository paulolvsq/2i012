CC = gcc
CFLAGS = -O2
CPPFLAGS = -I.
AR = ar
ARFLAGS = cru
RANLIB = ranlib
LDFLAGS = -L.
LDLIBS = -ljpeg

LIB_SRC = jcapimin.c jcapistd.c jccoefct.c jccolor.c jcdctmgr.c jchuff.c \
jcinit.c jcmainct.c jcmarker.c jcmaster.c jcomapi.c jcparam.c \
jcphuff.c jcprepct.c jcsample.c jctrans.c jdapimin.c jdapistd.c \
jdatadst.c jdatasrc.c jdcoefct.c jdcolor.c jddctmgr.c jdhuff.c \
jdinput.c jdmainct.c jdmarker.c jdmaster.c jdmerge.c jdphuff.c \
jdpostct.c jdsample.c jdtrans.c jerror.c jfdctflt.c jfdctfst.c \
jfdctint.c jidctflt.c jidctfst.c jidctint.c jidctred.c jquant1.c \
jquant2.c jutils.c jmemmgr.c jmemnobs.c

CJPEG_SRC = cjpeg.c rdppm.c rdgif.c rdtarga.c rdrle.c rdbmp.c rdswitch.c cdjpeg.c
DJPEG_SRC = djpeg.c wrppm.c wrgif.c wrtarga.c wrrle.c wrbmp.c rdcolmap.c cdjpeg.c
JPEGTRAN_SRC = jpegtran.c rdswitch.c cdjpeg.c transupp.c

CJPEG_OBJ = $(CJPEG_SRC:.c=.o)
DJPEG_OBJ = $(DJPEG_SRC:.c=.o)
JPEGTRAN_OBJ = $(JPEGTRAN_SRC:.c=.o)

DESTDIR = /usr/local
#on n'a pas les droits d'accès sur ce chemin pour réaliser les tests
#tout fonctionne sur mon ordi perso avec le chemin /usr/local demandé dans le sujet
#ici aussi on aurait du initialiser différemment la variable DESTDIR comme dans le Makefile principal
#ne pas oublier non plus les mkdir -p qui créent les sous dossiers et gèrent les erreurs
#dans le cas où le dossier existe déjà ou au contraire n'existe pas 
LIB_OBJ = $(LIB_SRC:.c=.o)

all : libjpeg.a depend cjpeg djpeg jpegtran rdjpgcom wrjpgcom #cible du all
#correspond à ce que va faire le all lorsqu'on tape make

depend :
	$(CC) -MM $(LIB_SRC) $(CJPEG_SRC) $(DJPEG_SRC) $(JPEGTRAN_SRC) > .depend
-include .depend
#fichier qui contient les dépendances des .h de tous les .c on n'oublie pas de l'inclure 

%.o : %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -c $<
#règle qui compile tous les .c en .o 

jconfig.h : ckconfig.c #cible jconfig et dépend de ckconfig
	$(CC) $< -o ckconfig #commande qui compile le ckconfig
	./ckconfig #on exécute le ckconfig

libjpeg.a : jconfig.h $(LIB_OBJ) #cible librairie dépend de jconfig et des fichiers objets 
	$(AR) $(ARFLAGS) $@ $(LIB_OBJ) #on utilise les AR et ARFLAGS pour créer l'archive
	$(RANLIB) $@ #on crée la librairie à partir de l'archive

cjpeg : $(CJPEG_OBJ) libjpeg.a #commande dépend des fichiers objets et de la librairie 
	$(CC) $(LDFLAGS) $(CJPEG_OBJ) -o $@ $(LDLIBS) #on n'oublie pas de compiler en utilisant les LDFLAGS et LDLIBS
#pour indiquer à gcc qu'on veut la librairie qu'on vient de créer

djpeg : $(DJPEG_OBJ) libjpeg.a #les commentaires sont les mêmes que ceux au dessus 
	$(CC) $(LDFLAGS) $(DJPEG_OBJ) -o $@ $(LDLIBS)

jpegtran : $(JPEGTRAN_OBJ) libjpeg.a #de même 
	$(CC) $(LDFLAGS) $(JPEGTRAN_OBJ) -o $@ $(LDLIBS)

rdjpgcom: rdjpgcom.o #commande dépend de son fichier objet 
	$(CC) -o $@ rdjpgcom.o #on en crée un exécutable à partir du fichier objet 

wrjpgcom: wrjpgcom.o #mêmes commentaires
	$(CC) -o $@ wrjpgcom.o

install : all #on installe la librairie
	mkdir -p $(DESTDIR) #on gère les cas si le répertoire n'existe pas 
	mkdir -p $(DESTDIR)/include
	mkdir -p $(DESTDIR)/lib
	mkdir -p $(DESTDIR)/bin
	cp libjpeg.a $(DESTDIR)/lib #on copie l'archive dans le dossier lib 
	cp jconfig.h jpeglib.h jerror.h jpegint.h $(DESTDIR)/include #on copie les headers dans le dossier include 
	cp cjpeg djpeg jpegtran rdjpgcom wrjpgcom $(DESTDIR)/bin #on met les commandes dans le dossier bin pour les exécuter
#comme n'importe quelle autre commande 

clean : #on supprime les fichiers dont on n'a plus besoin
	rm -f *.o
	rm -f jconfig.h libjpeg.a ckconfig .depend cjpeg djpeg jpegtran rdjpgcom wrjpgcom
	rm -f *~

.PHONY : all clean depend install #on termine en indiquant les cibles virtuelles avec le .PHONY
