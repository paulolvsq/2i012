#!/bin/bash
#je déclare les variables dont je vais avoir besoin
sommeVotesBlancs=0
ville=''
IFS=";"
sommeInscrits=0
#je fais un tri au préalable que je stocke dans un fichier temporaire
grep -e ^$1 $2 | cut -d ";" -f1,2,5,10 | cat > tmp.txt #je ne prends que les champs dont j'ai besoin
#je lis les variables dans mon fichier temporaire
while read var1 var2 var3 var4  
do 
	sommeVotesBlancs=$(($sommeVotesBlancs+$var4)) #je fais la somme des votes blancs
	sommeInscrits=$(($sommeInscrits+$var3)) #je fais la somme des inscrits
	ville=$var2 #je stocke la ville 
done < tmp.txt #j'indique bien que je dois lire dans le fichier temporaire 

sommeVotesBlancs=$((($sommeVotesBlancs*100)/$sommeInscrits)) #je calcule le pourcentage total
echo "$ville ($1) : $sommeVotesBlancs % de bulletins blancs" #j'affiche mon résultat
#echo "$ville ($1) : $sommeVotesBlancs % de bulletins blancs" > res.txt #je le stocke dans un fichier

rm tmp.txt #je supprime le fichier temporaire