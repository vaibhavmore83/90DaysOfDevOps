# Linux File System Hierarchy & Scenario-Based Practice  

## Linux File System Hierarchy  

**Linux different directories**

```bash
/ (root) - The starting point of everything

Most of the linux related system files and directories resides here.

ubuntu@ip-172-31-27-126:/$ ls -lt
total 76
drwxr-xr-x 108 root root  4096 Feb 25 08:45 etc
drwxr-xr-x   5 root root  4096 Feb 25 08:44 boot
drwxr-xr-x   3 root root  4096 Feb 24 08:22 home
drwxr-xr-x  13 root root  4096 Feb 24 08:22 var
drwxr-xr-x  12 root root  4096 Dec 12 10:00 usr
drwxr-xr-x   2 root root  4096 Dec 12 10:00 opt
lrwxrwxrwx   1 root root     7 Apr 22  2024 bin -> usr/bin
lrwxrwxrwx   1 root root     7 Apr 22  2024 lib -> usr/lib
lrwxrwxrwx   1 root root     9 Apr 22  2024 lib64 -> usr/lib64
lrwxrwxrwx   1 root root     8 Apr 22  2024 sbin -> usr/sbin
```
```bash
/home - User home directories

Whenever we login to linux system, we firsly lands at this directory structure.

ubuntu@ip-172-31-27-126:~$ pwd
/home/ubuntu

This directory will contains user specific files and directories.
```
```bash
/etc - Configuration files

All linux configuration files resides here.

I would use this directory to see user permissions (/etc/shadow; /etc/passwd), system configuration, network configuration, etc.  
```
**Find the largest log file in /var/log**
```bash
du -sh /var/log/* 2>/dev/null | sort -h | tail -5

180K    /var/log/kern.log
216K    /var/log/sysstat
344K    /var/log/cloud-init.log
608K    /var/log/syslog
34M     /var/log/journal
```

**Look at a config file in /etc**
```bash
cat /etc/hostname

ip-172-31-27-126
```
**Check your home directory**
```bash
ls -la ~

ubuntu@ip-172-31-27-126:/etc/systemd$ ls -la ~
total 328
drwxr-x--- 4 ubuntu ubuntu   4096 Feb 25 16:50 .
drwxr-xr-x 3 root   root     4096 Feb 24 08:22 ..
-rw------- 1 ubuntu ubuntu  10740 Feb 25 16:50 .bash_history
-rw-r--r-- 1 ubuntu ubuntu    220 Mar 31  2024 .bash_logout
-rw-r--r-- 1 ubuntu ubuntu   3771 Mar 31  2024 .bashrc
drwx------ 2 ubuntu ubuntu   4096 Feb 24 08:24 .cache
-rw-r--r-- 1 ubuntu ubuntu  12288 Feb 24 11:41 .install_packages.sh.swp
-rw------- 1 ubuntu ubuntu     20 Feb 24 09:12 .lesshst
-rw-r--r-- 1 ubuntu ubuntu    807 Mar 31  2024 .profile
drwx------ 2 ubuntu ubuntu   4096 Feb 24 08:22 .ssh
-rw-r--r-- 1 ubuntu ubuntu      0 Feb 25 15:22 .sudo_as_admin_successful
-rw------- 1 ubuntu ubuntu  11765 Feb 25 16:50 .viminfo
-rwxr-xr-x 1 ubuntu ubuntu    201 Feb 24 09:05 chk_number.sh
-rwxr-xr-x 1 ubuntu ubuntu    139 Feb 24 10:41 countdown.sh
```
---  

## Scenario-Based Practice  

**Scenario 1: Service Not Starting**  

Step 1: systemctl status myapp  
Why: To check whether myapp service is running, active or failed.    
  
Step 2: journalctl -u myapp -n 50  
Why: To check myapp service log  

Step 3: systemctl is-enabled myapp  
Why: To check if service myapp is enabled on boot  

---  

**Scenario 2: High CPU Usage**  

**Commands explored are:**  
top  
htop  
ps aux --sort=-%cpu | head -10  

---  

**Scenario 3: Finding Service Logs**  

**Commands explored are:**   
```bash
# Check service status first
systemctl status ssh

# View last 50 lines of logs
journalctl -u ssh -n 50

# Follow logs in real-time
journalctl -u ssh -f
```
---  

**Scenario 4: File Permissions Issue**  
```bash
Step 1: Check current permissions
Command: ls -l /home/ubuntu/log_backup.sh
Look for: -rw-r--r-- (notice no 'x' = not executable)

Step 2: Add execute permission
Command: chmod +x /home/ubuntu/log_backup.sh

Step 3: Verify it worked
Command: ls -l /home/ubuntu/log_backup.sh
Look for: -rwxr-xr-x (notice 'x' = executable)

Step 4: Try running it
Command: ./log_backup.sh
```
