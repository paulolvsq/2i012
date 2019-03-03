DESTDIR = /usr/local
MAKE = make

all : install

clean :
	cd lib && $(MAKE) clean
	cd src && $(MAKE) clean
	cd doc && $(MAKE) clean
	rm -f *~

install : 
	cd lib && $(MAKE) install DESTDIR=$(DESTDIR)
	cd src && $(MAKE) install DESTDIR=$(DESTDIR)
	cd doc && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/share/doc/sed
	cp README AUTHORS BUGS COPYING NEWS THANKS $(DESTDIR)/share/doc/sed

.PHONY : all clean install
