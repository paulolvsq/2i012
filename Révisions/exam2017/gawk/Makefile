MAKE = make
DESTDIR = /usr/local

all : install

clean :
	cd src && $(MAKE) clean
	cd doc && $(MAKE) clean
	rm -f *~

install :
	cd src && $(MAKE) install DESTDIR=$(DESTDIR)
	cd doc && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/share/gawk
	cp AUTHORS COPYING ChangeLog INSTALL NEWS POSIX.STD README $(DESTDIR)/share/gawk


.PHONY : all clean install
