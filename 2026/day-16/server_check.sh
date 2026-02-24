#!/bin/bash
#
service_name="nginx"

echo "Do you want to check the status of the service $service_name? (y/n): "
read yesno

if [[ $yesno == "y" ]]; then
        echo "Checking status of the service $service_name..."
        output=$(systemctl status $service_name)
        echo $output
elif [[ $yesno == "n" ]]; then
        echo "Skipped..."
else
        echo "Invalid input, retry..."
fi
