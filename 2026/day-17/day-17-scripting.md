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
  
### Script: `count.sh`

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
