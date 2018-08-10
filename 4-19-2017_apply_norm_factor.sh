#!/bin/bash

#	This script will take a log transformed count file and apply library normalization factors

#	The first read in $1 is the folder path
#	The second read in $2 is the count file
#	The third read in $3 is normalization factor file
#	The forth read in $4 is the output file


cd "$1"

filename="$3"
filelines=`cat $filename`

touch "$4"

mkdir subdir

count=2

IFS=$'\n'
for line in $filelines ; do
	factor=$(echo -e "$line" | awk -F, '{print $2}')
	echo "$count"
	column=$(cat "$2" | awk -F, -v a=$count -v b=$factor '{ $a=$a*b ; print $a }')
	echo "$column" > ./subdir/$count

	let count=count+1
done
unset IFS

cd ./subdir

paste -d, {2..91} > ../"$4"

cd ..
rm -r subdir


