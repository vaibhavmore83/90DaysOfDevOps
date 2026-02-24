# Shell Scripting: Loops, Arguments & Error Handling

## For Loop

### Script: `for_loop.sh`

```bash
#!/bin/bash
fruits_list=("apple" "banana" "orange" "kiwi" "papaya")

for fruit in "${fruits_list[@]}"; do
    echo $fruit
done

Output:

apple
banana
orange
kiwi
papaya
