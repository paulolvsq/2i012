DESTDIR = /usr/local
#on n'a pas les droits d'acc�s sur ce chemin pour r�aliser les tests
#tout fonctionne sur mon ordi perso avec le chemin /usr/local demand� dans le sujet
#pour que tout fonctionne sur les ordis de la fac, on peut initialiser
#DESTDIR = /folder par exemple et on n'oublie pas de faire un mkdir -p dans le install 
#pour bien traiter le cas o� le r�pertoire n'existe pas ou au contraire existe d�j�
MAKE = make

all : install #on d�l�gue les cibles virtuelles aux autres Makefile 
	cd tests && $(MAKE) #cr�e les commandes et r�alise les tests et on installe

clean : #on d�l�gue les cibles virtuelles aux autres Makefile 
	cd src && $(MAKE) clean #on se place dans les bons r�pertoires 
	cd tests && $(MAKE) clean
	rm -f *~

install : #on fait les copies n�cessaires et on appelle les cibles virtuelles install des autres Makefile
	cd src && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/share/man/man1
	cd man && cp *.1 $(DESTDIR)/share/man/man1
	mkdir -p $(DESTDIR)/share/doc/jpeg-6b
	cd doc && cp *.doc $(DESTDIR)/share/doc/jpeg-6b
	cd $(DESTDIR)/share/doc/jpeg-6b && gzip -f *.doc
	mkdir -p $(DESTDIR)/share/jpeg-6b
	cp change.log README $(DESTDIR)/share/jpeg-6b

.PHONY : all clean install
