# Linux Fundamentals: Read and Write Text Files

## Command Flow  

$ touch notes.txt  
  - Create an empty file **notes.txt** in current working directory

$ echo "This is the first line of new file" > notes.txt  
  - First line is inserted to newly create empty file **notes.txt** with **>**

$ echo "This is the second line of new file" >> notes.txt  
  - Second line is appended to existing **notes.txt** with **>>**

$ echo "This is the third line of new file" | tee -a notes.txt  
This is the third line of new file  
  - Third line is appeneded to existing **notes.txt** as well as display as output with **tee -a**

$ cat notes.txt  
This is the first line of new file  
This is the second line of new file  
This is the third line of new file  
  - Displays the content of **notes.txt** with **cat**

$ head -n 2 notes.txt  
This is the first line of new file  
This is the second line of new file  
  - Displays first 2 lines of **notes.txt** with **head -n 2**

$ tail -n 2 notes.txt  
This is the second line of new file  
This is the third line of new file  
  - Displays last 2 lines of **notes.txt** with **tail -n 2**  
