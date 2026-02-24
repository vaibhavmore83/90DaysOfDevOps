# Shell Scripting Basics  

## My First Script  

What happens if you remove the shebang line?

- Ans: Even though shebang line is removed from the script, it was able to successfully able to display "Hello, DevOps!". But, as per best practice, specify the shebang line atstart of your script.
  Removing the line from the script may lose the ability for the OS to automatically determine the correct interpreter, leading to potential unexpected behavior or execution failure, especially on different systems.   

---  

## Variables  
  
Single quotes vs double quotes in echo command — what's the difference?  

- Ans: In echo command, everything inside ' ' (single quote) is interpreted literally without resolving the value of variables. Whereas everything inside " " (double quote) is interpreted by expanding values of variables specified with $ sign.
E.g.  
#!/bin/bash
name="Vaibhav"
role="DevOps Eng"
echo "Hello, I am $name and I am a $role"
echo 'Hello, I am $name and I am a $role'
  
**Output:**  
Hello, I am Vaibhav and I am a DevOps Eng  
Hello, I am $name and I am a $role  

---  

## User Input with read  

Instead assigning value to variable, the value is read from the terminal from user and store using **read <variable_name>**.  
E.g.  
echo "What is your name? "  
read name  
echo "What is your favourite tool? "  
read tool  

---  

## If-Else Conditions  

**syntax:** if [ condition ]; then ... elif ... else ... fi  

