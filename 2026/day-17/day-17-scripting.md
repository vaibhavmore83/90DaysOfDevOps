# Shell Scripting: Loops, Arguments & Error Handling  

## For Loop  

**for_loop.sh**  
  
#!/bin/bash  
fruits_list=("apple" "banana" "orange" "kiwi" "papaya")  

for fruit in "${fruits_list[@]}"; do  
        echo $fruit  
done  

OUTPUT:  
apple
banana
orange
kiwi
papaya
