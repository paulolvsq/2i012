DESTDIR = /usr/local

all : sed.info sed.pdf sed.doc

sed.info : sed.texi version.texi config.texi
	makeinfo sed.texi

sed.pdf : sed.texi version.texi config.texi
	texi2pdf sed.texi

sed.doc : sed.1
	nroff -man sed.1 > sed.doc

clean :
	rm -f sed.info sed.pdf sed.doc
	rm -f *~

install : all
	mkdir -p $(DESTDIR)/share/man/man1
	cp *.1 $(DESTDIR)/share/man/man1
	mkdir -p $(DESTDIR)/share/doc/sed
	cp sed.doc sed.pdf $(DESTDIR)/share/doc/sed
	mkdir -p $(DESTDIR)/share/info
	cp sed.info $(DESTDIR)/share/info

.PHONY : all clean
