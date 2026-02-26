# Day 10 Challenge

## Files Created
```bash
ubuntu@ip-172-31-27-126:~/filemgmt$ touch devops.txt
ubuntu@ip-172-31-27-126:~/filemgmt$ echo "This is a note." > notes.txt
ubuntu@ip-172-31-27-126:~/filemgmt$ vim script.sh
ubuntu@ip-172-31-27-126:~/filemgmt$ ls -l
total 8
-rw-rw-r-- 1 ubuntu ubuntu  0 Feb 26 14:34 devops.txt
-rw-rw-r-- 1 ubuntu ubuntu 16 Feb 26 14:35 notes.txt
-rw-rw-r-- 1 ubuntu ubuntu 38 Feb 26 14:36 script.sh
```
```bash
ubuntu@ip-172-31-27-126:~/filemgmt$ cat notes.txt
This is a note.
```

## Permission Changes  

**Current Permissions**
```bash
-rw-rw-r-- 1 ubuntu ubuntu  0 Feb 26 14:34 devops.txt
-rw-rw-r-- 1 ubuntu ubuntu 16 Feb 26 14:35 notes.txt
-rw-rw-r-- 1 ubuntu ubuntu 38 Feb 26 14:36 script.sh
```
Owners and Group can Read/Write whereas Others can Read only.  

**Make Script executable**  
```bash
ubuntu@ip-172-31-27-126:~/filemgmt$ chmod +x script.sh
ubuntu@ip-172-31-27-126:~/filemgmt$ ls -l
total 8
-rw-rw-r-- 1 ubuntu ubuntu  0 Feb 26 14:34 devops.txt
-rw-rw-r-- 1 ubuntu ubuntu 16 Feb 26 14:35 notes.txt
-rwxrwxr-x 1 ubuntu ubuntu 38 Feb 26 14:36 script.sh
```
**Set devops.txt to read-only (remove write for all)**  
```bash
ubuntu@ip-172-31-27-126:~/filemgmt$ chmod -w devops.txt
ubuntu@ip-172-31-27-126:~/filemgmt$ ls -l
total 8
-r--r--r-- 1 ubuntu ubuntu  0 Feb 26 14:34 devops.txt
-rw-rw-r-- 1 ubuntu ubuntu 16 Feb 26 14:35 notes.txt
-rwxrwxr-x 1 ubuntu ubuntu 38 Feb 26 14:36 script.sh
```
**Set notes.txt to 640 (owner: rw, group: r, others: none)**  
```bash
ubuntu@ip-172-31-27-126:~/filemgmt$ chmod 640 notes.txt
ubuntu@ip-172-31-27-126:~/filemgmt$ ls -l
total 8
-r--r--r-- 1 ubuntu ubuntu  0 Feb 26 14:34 devops.txt
-rw-r----- 1 ubuntu ubuntu 16 Feb 26 14:35 notes.txt
-rwxrwxr-x 1 ubuntu ubuntu 38 Feb 26 14:36 script.sh
```
**Create directory project/ with permissions 755**
```bash
ubuntu@ip-172-31-27-126:~/filemgmt$ mkdir -m 755 project
ubuntu@ip-172-31-27-126:~/filemgmt$ ls -l
total 12
-r--r--r-- 1 ubuntu ubuntu    0 Feb 26 14:34 devops.txt
-rw-r----- 1 ubuntu ubuntu   16 Feb 26 14:35 notes.txt
drwxr-xr-x 2 ubuntu ubuntu 4096 Feb 26 14:51 project
-rwxrwxr-x 1 ubuntu ubuntu   38 Feb 26 14:36 script.sh
```

## Commands Used  
  
Display first 5 lines of /etc/passwd using head  
```bash
ubuntu@ip-172-31-27-126:~/filemgmt$ cat /etc/passwd | head -n 5
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
```
Display last 5 lines of /etc/passwd using tail  
```bash
ubuntu@ip-172-31-27-126:~/filemgmt$ cat /etc/passwd | tail -n 5
ubuntu:x:1000:1000:Ubuntu:/home/ubuntu:/bin/bash
berlin:x:1001:1001::/home/berlin:/bin/sh
tokyo:x:1002:1002::/home/tokyo:/bin/sh
professor:x:1003:1003::/home/professor:/bin/sh
nairobi:x:1004:1007::/home/nairobi:/bin/sh
```

## What I Learned  

Try writing to a read-only file (using vim) - what happens?  
- Got any error message.
  E45: 'readonly' option is set (add ! to override)

Try executing a file without execute permission  
- Got an error message of **Permission denied**  

  
