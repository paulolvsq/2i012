DJPEG = ../src/djpeg
CJPEG = ../src/cjpeg
JPEGTRAN = ../src/jpegtran

FLAGS = -dct int
OUTFLAGS = -outfile

all : testout.ppm testout.bmp testout.jpg testoutp.ppm testoutp.jpg testoutt.jpg check #cible du all correspond
#à ce que va faire le all lorsqu'on tape make

check : #cible qui va vérifier si les commandes sont correctement produites
	cmp testimg.ppm testout.ppm #va comparer les séries de bits entre les images pour vérifier si elles sont identiques 
	cmp testimg.bmp testout.bmp #on le fait pour chaque image 
	cmp testimg.jpg testout.jpg
	cmp testimg.ppm testoutp.ppm
	cmp testimgp.jpg testoutp.jpg
	cmp testorig.jpg testoutt.jpg

testout.ppm : testorig.jpg #la cible testout dépend de testorig
	$(DJPEG) $(FLAGS) -ppm $(OUTFLAGS) testout.ppm testorig.jpg
#la commande est celle donnée dans le sujet avec les bons FLAGS 
testout.bmp : testorig.jpg #mêmes commentaires dans les commandes suivantes 
	$(DJPEG) $(FLAGS) -bmp -colors 256 $(OUTFLAGS) testout.bmp testorig.jpg

testout.jpg : testimg.ppm
	$(CJPEG) $(FLAGS) $(OUTFLAGS) testout.jpg testimg.ppm

testoutp.ppm : testprog.jpg
	$(DJPEG) $(FLAGS) -ppm $(OUTFLAGS) testoutp.ppm testprog.jpg

testoutp.jpg : testimg.ppm
	$(CJPEG) $(FLAGS) -progressive -opt $(OUTFLAGS) testoutp.jpg testimg.ppm

testoutt.jpg : testprog.jpg
	$(JPEGTRAN) $(OUTFLAGS) testoutt.jpg testprog.jpg

clean : #on supprime les fichiers créés dont on n'a plus besoin
	rm -f testout.ppm testout.bmp testout.jpg testoutp.ppm testoutp.jpg testoutt.jpg
	rm -f *~

.PHONY : all clean #on termine en indiquant les cibles virtuelles avec le .PHONY
