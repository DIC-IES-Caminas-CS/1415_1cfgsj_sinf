#!/bin/bash
convert=/usr/bin/convert
# Script to convert all image files from a directory (parameter) into png format file
# it also reduces size

# Sanity checks ?
nofinalslash=${1%/}
if [ $# -ne 2]
then
	echo "Use correctly: ./imgkonver.sh /picturepath 1|2|3"
	exit 1
fi

# Main code

ls -1 $1/*.jpg > imagefiles
cat imagefiles
while read imgfile 
do
case $2 in
	1)
	echo "IMG file: $imgfile"
	lengthname=${#imgfile}
	echo "Length: $lengthname"
	namefile=${imgfile:0:$lengthname-4}
	echo "namefile: $namefile"
	convert $imgfile -auto-gamma -resize 200x200 $namefile.png;;
	2)
	echo "IMG file: $imgfile"
	lengthname=${#imgfile}
	echo "Length: $lengthname"
	namefile=${imgfile:0:$lengthname-4}
	echo "namefile: $namefile"
	convert $imgfile -auto-gamma -resize 300x300 $namefile.png;;
	3)
	echo "IMG file: $imgfile"
	lengthname=${#imgfile}
	echo "Length: $lengthname"
	namefile=${imgfile:0:$lengthname-4}
	echo "namefile: $namefile"
	convert $imgfile -auto-gamma -resize 400x400 $namefile.png;;
	*)
	echo "Put a valid option";;
	
esac
done < imagefiles
rm imagefiles
exit 0