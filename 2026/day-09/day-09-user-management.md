# Day 09 Challenge

## Users & Groups Created
- Users: tokyo, berlin, professor, nairobi
- Groups: developers, admins, project-team

## Group Assignments  
Assign users:
- `tokyo` → `developers`
- `berlin` → `developers` + `admins` (both groups)
- `professor` → `admins`

## Directories Created
[List directories with permissions]

## Commands Used

**Create User with /home directory**  
sudo useradd -m berlin  
sudo useradd -m tokyo  
sudo useradd -m professor  
sudo useradd -m nairobi  
```bash
ubuntu@ip-172-31-27-126:/home$ ls -lrt
total 20
drwxr-x--- 5 ubuntu    ubuntu    4096 Feb 26 10:33 ubuntu
drwxr-x--- 2 berlin    berlin    4096 Feb 26 11:38 berlin
drwxr-x--- 2 tokyo     tokyo     4096 Feb 26 11:38 tokyo
drwxr-x--- 2 professor professor 4096 Feb 26 11:38 professor
drwxr-x--- 2 nairobi   nairobi   4096 Feb 26 11:50 nairobi
```

**Set password for users**
sudo passwd berlin  
sudo passwd tokyo  
sudo passwd professor  
sudo passwd nairobi  
```bash
berlin:x:1001:1001::/home/berlin:/bin/sh
tokyo:x:1002:1002::/home/tokyo:/bin/sh
professor:x:1003:1003::/home/professor:/bin/sh
nairobi:x:1004:1007::/home/nairobi:/bin/sh
ubuntu@ip-172-31-27-126:/home$ cat /etc/passwd
```

**Create Group**  
sudo groupadd developers  
sudo groupadd admins
sudo groupadd project-team
```bash
developers:x:1004:
admins:x:1005:
project-team:x:1006:
ubuntu@ip-172-31-27-126:/home$ cat /etc/group
```

**Group Assignment**  
Assign users:
- `tokyo` → `developers`
- `berlin` → `developers` + `admins` (both groups)
- `professor` → `admins`
```bash
ubuntu@ip-172-31-27-126:/home$ sudo gpasswd -a tokyo developers
Adding user tokyo to group developers

ubuntu@ip-172-31-27-126:/home$ sudo gpasswd -a berlin developers
Adding user berlin to group developers

ubuntu@ip-172-31-27-126:/home$ sudo gpasswd -a berlin admins
Adding user berlin to group admins

ubuntu@ip-172-31-27-126:/home$ sudo gpasswd -a professor admins
Adding user professor to group admins
```
```bash
developers:x:1004:tokyo,berlin
admins:x:1005:berlin,professor
project-team:x:1006:
ubuntu@ip-172-31-27-126:/home$ cat /etc/group
```
## What I Learned  
- How to create new user with /home directory  
- How to create new group  
- How to add user to group
