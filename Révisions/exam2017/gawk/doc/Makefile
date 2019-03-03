FIG = api-figure1.fig     api-figure3.fig     general-program.fig \
api-figure2.fig     array-elements.fig  process-flow.fig

PDF = $(FIG:.fig=.pdf)

DESTDIR = /usr/local

all : gawk.pdf gawkinet.pdf gawk.man awkcard.ps awkcard.pdf

gawk.pdf : gawk.texi $(PDF) texinfo.tex statist.pdf
	texi2pdf gawk.texi

%.pdf : %.fig
	fig2dev -Lpdf $< > $@

gawkinet.pdf : gawkinet.texi
	texi2pdf gawkinet.texi

gawk.man : gawk.1
	nroff -man gawk.1 > gawk.man

awkcard.ps :
	groff -t -Tps -U -dpaper=letter -P-pletter macros cardfonts \
	colors awkcard.tr > awkcard.ps

awkcard.pdf : awkcard.ps
	ps2pdf awkcard.ps

clean :
	rm -f gawk.pdf $(PDF) gawkinet.pdf gawk.man awkcard.ps awkcard.pdf

install : all
	mkdir -p $(DESTDIR)/share/man/man1
	mkdir -p $(DESTDIR)/share/doc/gawk
	cp gawk.1 $(DESTDIR)/share/man/man1
	cp gawk.man awkcard.pdf gawk.pdf gawkinet.pdf $(DESTDIR)/share/doc/gawk

.PHONY : all clean install
