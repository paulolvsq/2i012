#! /bin/bash

IFS=';'

while read var1 var2 var3 var4 var5 var6 var7 var8 var9 var10 var11 var12 var13 var14 var15 var16 var17 var18 var19 var20 var21 var22 var23 var24 var25 var26 var27 var28 var29 var30 var31 var23

do 
	
	if [ $var8 -gt 3500 ] && [ ${var24//\,*/} -ge 60 ]
	then 
		echo "Dans la ville de $var4, $var8 votants avec un pourcentage de $var21 pour $var24"
	fi

done < Presidentielle_2017_Resultats_Communes_Tour_2_c.csv
exit 0