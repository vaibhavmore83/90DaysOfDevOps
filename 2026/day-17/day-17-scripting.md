# Shell Scripting: Loops, Arguments & Error Handling

## For Loop

### Script: `for_loop.sh`

```bash
#!/bin/bash
fruits_list=("apple" "banana" "orange" "kiwi" "papaya")

for fruit in "${fruits_list[@]}"; do
    echo $fruit
done
```
**Output:**  
```bash
apple
banana
orange
kiwi
papaya
```
---  
  
## While Loop  
  
### Script: `countdown.sh`

```bash
#!/bin/bash
read -p "Enter the number to countdown: " number

while [ $number -gt 0 ]; do
        echo $number
        ((number--))
done
echo "Done!"
```
**Output:**  
```bash
Enter the number to countdown: 5
5
4
3
2
1
Done!
```
---  

## Command-Line Arguments  
  
### Script: `greet.sh`

```bash
#!/bin/bash
if [[ $# -eq 0 ]]; then
        echo "Usage: $0 <your_name>"
        exit 1
else
        echo "Reading the name from the script argument..."
        echo "Hello, $1!"
fi
```
**Output:**  

Without Argument
```bash
ubuntu@ip-172-31-27-126:~$ ./greet.sh
Usage: ./greet.sh <your_name>
```
With Argument
```bash
ubuntu@ip-172-31-27-126:~$ ./greet.sh Vaibhav
Reading the name from the script argument...
Hello, Vaibhav!
```
---  

## Install Packages via Script  
  
### Script: `install_packages.sh`

```bash
#!/bin/bash
packagelist=("nginx" "curl" "xmlcore")
for package in "${packagelist[@]}"; do
        if dpkg -s $package > /dev/null 2>&1; then
                echo "Package $package is already installed..."
        else
                echo "Package $package needs to be installed..."
        fi
done
```
**Output:**  
```bash
Package nginx needs to be installed...
Package curl is already installed...
Package xmlcore needs to be installed...
```
---  

## Error Handling  
  
### Script: `safe_script.sh`

```bash
#!/bin/bash
set -e

mkdir test || echo "Directory already exists"

echo "This line is printed"
```
**Output:**  
1st Run -
```bash
This line is printed
```
2nd Run -
```bash
mkdir: cannot create directory ‘test’: File exists
Directory already exists
This line is printed
```
