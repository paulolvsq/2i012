#! /bin/bash
IFS='_'
for i in `ls Composition*`
do
	sed -E 'd/^(Composition)_(.*)/\2/' <<< $i
done