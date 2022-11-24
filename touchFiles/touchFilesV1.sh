#!/bin/bash
#create 25 files

n=1
until [ $n -eq 26 ];
do
        echo "creating file neethu$n"
        touch neethu$n
        ((n++))
done
echo "completed file creation"
