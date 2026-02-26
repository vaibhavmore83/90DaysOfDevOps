# Day 11 Challenge

## Files & Directories Created
What's the difference between owner and group?  
Ans: Owner is the creator with the highest authority; whereas group is the set of users with share access.

## Ownership Changes
```bash
ubuntu@ip-172-31-27-126:~/filemgmt$ sudo chown tokyo devops.txt
ubuntu@ip-172-31-27-126:~/filemgmt$ ls -l
total 16
-r--r--r-- 1 tokyo  ubuntu    0 Feb 26 14:34 devops.txt
-rw-r----- 1 ubuntu ubuntu   16 Feb 26 14:35 notes.txt
-rw-rw-r-- 1 ubuntu ubuntu   38 Feb 26 14:36 script.sh

ubuntu@ip-172-31-27-126:~/filemgmt$ sudo chown berlin devops.txt
ubuntu@ip-172-31-27-126:~/filemgmt$ ls -l
total 16
-r--r--r-- 1 berlin ubuntu    0 Feb 26 14:34 devops.txt
-rw-r----- 1 ubuntu ubuntu   16 Feb 26 14:35 notes.txt
-rw-rw-r-- 1 ubuntu ubuntu   38 Feb 26 14:36 script.sh

ubuntu@ip-172-31-27-126:~/filemgmt$ sudo chgrp admins notes.txt
ubuntu@ip-172-31-27-126:~/filemgmt$ ls -l
total 16
-r--r--r-- 1 berlin ubuntu    0 Feb 26 14:34 devops.txt
-rw-r----- 1 ubuntu admins   16 Feb 26 14:35 notes.txt
-rw-rw-r-- 1 ubuntu ubuntu   38 Feb 26 14:36 script.sh

ubuntu@ip-172-31-27-126:~/filemgmt$ sudo chown nairobi:developers script.sh
ubuntu@ip-172-31-27-126:~/filemgmt$ ls -l
total 16
-r--r--r-- 1 berlin  ubuntu        0 Feb 26 14:34 devops.txt
-rw-r----- 1 ubuntu  admins       16 Feb 26 14:35 notes.txt
-rw-rw-r-- 1 nairobi developers   38 Feb 26 14:36 script.sh
```
**Recursive Ownership Changes**
```bash
ubuntu@ip-172-31-27-126:~/filemgmt$ sudo chown -R professor:planners heist-project/
ubuntu@ip-172-31-27-126:~/filemgmt$ ls -lR heist-project/
heist-project/:
total 8
drwxrwxr-x 2 professor planners 4096 Feb 26 16:01 plans
drwxrwxr-x 2 professor planners 4096 Feb 26 16:01 vault

heist-project/plans:
total 0
-rw-rw-r-- 1 professor planners 0 Feb 26 16:01 strategy.conf

heist-project/vault:
total 0
-rw-rw-r-- 1 professor planners 0 Feb 26 16:01 gold.txt
```

## Commands Used
```bash
# View ownership
ls -l filename

# Change owner only
sudo chown newowner filename

# Change group only
sudo chgrp newgroup filename

# Change both owner and group
sudo chown owner:group filename

# Recursive change (directories)
sudo chown -R owner:group directory/

# Change only group with chown
sudo chown :groupname filename
```

## What I Learned
In all cases, only permissible User or Super User can change the file permissions.
