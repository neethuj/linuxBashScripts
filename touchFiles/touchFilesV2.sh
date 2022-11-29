#!/bin/bash

#####################################################
# This script creates 25 files with a defined prefix.
# Each time you run it, it creates the next batch of 
# 25 files with increasing numbers starting with the
# last or maximum number that already exists.
# Author: Neethu
# Date: 11/25/2022
# Usage: ./touchFilesV2.sh
#####################################################


#filePrefix="neethu"
read -p "Enter your file prefix: " filePrefix
echo "checking if files with prefix $filePrefix exist"
fileCount=`ls -l $filePrefix* 2>/dev/null | wc -l`
if [[ $fileCount -eq 0 ]]; then
        echo "files with prefix $filePrefix do not exist"
        startIndex=1
        endIndex=26
else
        echo "a few files with prefix $filePrefix exist"
        ## Find the start Index
        lastIndex=`ls -l $filePrefix* | awk {'print $9'} | sed s/neethu// | sort -n | tail -1`
        startIndex=$((lastIndex+1)) 
        endIndex=$((startIndex+25))
fi

echo "first file to be created $filePrefix$startIndex"
echo "last file to be created $filePrefix$((endIndex-1))"

until [ $startIndex -eq $endIndex ];
do
        echo "creating file $filePrefix$startIndex"
        touch $filePrefix$startIndex
        ((startIndex++))
done
echo "completed file creation"

