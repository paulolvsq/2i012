#Exercice 5
sed -r -n '5 p'
sed -n -r '10,15 p'
sed -n -r '$ p'
sed -n -r '20,$ p'
sed -r -n '/^r/ p'
sed -r -n '/^daemon/,/^voice/ p'

sed -re '10,15 d ; 8,9 p'

#Exercice 6
sed -r '5 d'
sed -r '10,15 d'
sed -r '$ d'
sed -r '20,$ d'
sed -r '/^r/ d'
sed -r '/^daemon/,/^voice/ d'
#méthode 1
sed -r '/^$/ d' 
#méthode 2
sed -r '/^[[:blank:]]*$/ d' 

#Exercice 7
sed -r 's /:/ /'
sed -r 's /:/ / g'
sed -r 's /(todo | TODO)/A faire/ g' 
sed -r 's /todo/A faire/ g' | sed -r 's /TODO/A faire/ g'
sed -re 's /todo/A faire/ g ; s /TODO/A faire/ g'

who | sed '/^([[:alnum:]]*) /\1/ p'

sed 's/^(.):([[:alpha:]]):([[:digit:]]*):([0-9]*):(.*):(.*):(.*)$/\1 se trouve à \7/'
sed 's/^([^:]*):(.*)$/\1/'

sed 's/^([0-9]*);(.*)$/\1/'