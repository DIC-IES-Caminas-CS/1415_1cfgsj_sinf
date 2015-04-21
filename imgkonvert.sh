#!/bin/bash
convert=/usr/bin/convert
# Script to convert all mage files from a directory (parameter) into png format file
# it also reduces size
# @author Aitor Quinza Garcia
# Sanity checks ?
# ...

# Main code

ls -1 $1/*.jpg > imagefiles
cat imagefiles
while read imgfile 
do
    echo "IMG file: $imgfile"
    lengthname=${#imgfile}
    echo "Length: $lengthname"
    namefile=${imgfile:0:$lengthname-4}
    echo "namefile: $namefile"
    convert $imgfile -resize 200x200 $namefile.png    

done < imagefiles
rm imagefiles
exit 0