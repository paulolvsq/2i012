#!/bin/bash

sommeVotesBlancs=0
ville=''
IFS=';'
sommeInscrits=0

while read var1 var2 var3 var4 var5 var6 var7 var8 var9 var10 var11 
do 
	if [[ $var1 = $1 ]] 
	then 
		sommeInscrits=$(($var5+$sommeInscrits))
		sommeVotesBlancs=$(($sommeVotesBlancs+$var10))
		ville=$var2
	fi
done < Presidentielle_2017_Resultats_Communes_Tour_2_c.csv
sommeVotesBlancs=$((($sommeVotesBlancs*100)/$sommeInscrits))
echo "$ville ($1) : $sommeVotesBlancs % de bulletins blancs" 
#echo "$ville ($1) : $sommeVotesBlancs % de bulletins blancs" > res.txt
#je l'affiche dans le terminal et je l'écris aussi dans un fichier 

