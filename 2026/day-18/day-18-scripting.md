# Shell Scripting: Functions & Intermediate Concepts

## Basic Functions  

### Script: `functions.sh`  

```bash
#!/bin/bash
greet() {
        echo "Hello DevOps Folks.!"
}

addition() {
        num1=$1
        num2=$2
        add_values=$((num1 + num2))
        echo "Addition is: $add_values"
}
greet
addition 10 20
```
**Output:**  
```bash
Hello DevOps Folks.!
Addition is: 30
```
---  
  
## Functions with Return Values  
  
### Script: `disk_check.sh`  

```bash
#!/bin/bash
check_disk() {
        echo `df -h /`
}
check_memory() {
        echo `free -h`
}
output=$(check_disk)
echo "Disk Output: "
echo "$output"
mem_output=$(check_memory)
echo "Memory Output: "
echo "$mem_output"
```
**Output:**  
```bash
Disk Output:
Filesystem Size Used Avail Use% Mounted on /dev/root 6.8G 1.9G 4.9G 28% /
Memory Output:
total used free shared buff/cache available Mem: 914Mi 335Mi 103Mi 2.7Mi 635Mi 578Mi Swap: 0B 0B 0B
```
---  

## Strict Mode — `set -euo pipefail`   
  
### Script: `strict_demo.sh`  

```bash
#!/bin/bash
set -euo pipefail

echo $Test

ls -lrt | echo $ctest

```
**Output:**  
```bash
./strict_demo.sh: line 5: Test: unbound variable
```
---  

## Local Variables    
  
### Script: `local_demo.sh`

```bash
#!/bin/bash
functest() {
        local num1=$1
        num2=$2
}
functest 10 20
echo $num1
echo $num2
```
**Output:**  
```bash
ubuntu@ip-172-31-27-126:~$ ./local_demo.sh

20
```
---  
  
What does each flag do?
- `set -e` → Exit on any command failure.  
- `set -u` → Exit if you try to use an undefined variable.
- `set -o pipefail` → Ensures that if any command in a pipeline (e.g. cmd1 | cmd2) fails, the whole pipeline is treated as a failure.  
