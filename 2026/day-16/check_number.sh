#!/bin/bash
#
echo "Enter the number: "
read number

if [[ $number > 0 ]]; then
        echo "Positive number..."
elif [[ $number < 0 ]]; then
        echo "Negative number..."
else
        echo "Zero number..."
fi
