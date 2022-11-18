#!/bin/bash
#
#
#

# Read the input number
read -p "Enter a number : " number
re='^[0-9]+$'

# check if the input is a number
if [[ $number =~ $re ]]; then

    # check if even or odd
    if [ $((number%2)) -eq 0 ]; then
        echo "$number is an even number"
    else
        echo "$number is an odd number "
    fi 
else
    # Error: not a number
    echo "error: Not a number"
fi
sleep 5;