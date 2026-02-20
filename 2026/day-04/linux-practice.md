# Linux Practice: Processes and Services

## Process checks

**ps aux**  
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND  
root         1  0.0  0.1 169084  1124 ?        Ss   Feb19   0:02 /sbin/init  
vaibhav   1234  0.1  0.3  45200  3456 pts/0    Ss   22:30   0:00 bash  
vaibhav   1256  0.0  0.1  38400  2100 pts/0    R+   22:34   0:00 ps aux  

**top**  
top - 22:39:01 up  2:15,  2 users,  load average: 0.12, 0.08, 0.05  
Tasks: 152 total,   1 running, 151 sleeping,   0 stopped,   0 zombie  
%Cpu(s):  2.0 us,  1.0 sy,  0.0 ni, 96.5 id,  0.3 wa,  0.0 hi,  0.2 si,  0.0 st  
MiB Mem :   7980.0 total,   1200.0 free,   3200.0 used,   3580.0 buff/cache  
MiB Swap:   2048.0 total,   2048.0 free,      0.0 used.   4200.0 avail Mem  
  
  PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND  
 1234 vaibhav   20   0   45200   3456   2100 S   0.3  0.1   0:00.12 bash  
 1256 vaibhav   20   0   38400   2100   1500 R   1.0  0.1   0:00.05 top  
 1100 root      20   0  169084   1124    900 S   0.0  0.0   0:02.34 systemd  

---

## Service checks

**systemctl status nginx**  

● nginx.service - A high performance web server and a reverse proxy server  
     Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)  
     Active: active (running) since Thu 2026-02-19 21:10:32 IST; 1h 32min ago  
       Docs: man:nginx(8)  
   Main PID: 1450 (nginx)  
      Tasks: 3 (limit: 4650)  
     Memory: 5.6M  
        CPU: 0.8s  
     CGroup: /system.slice/nginx.service  
             ├─1450 nginx: master process /usr/sbin/nginx -g daemon off;  
             ├─1451 nginx: worker process  
             └─1452 nginx: worker process  
  
Feb 19 21:10:32 server systemd[1]: Starting A high performance web server and a reverse proxy server...  
Feb 19 21:10:32 server systemd[1]: Started A high performance web server and a reverse proxy server.  
  
**systemctl list-units**  
UNIT                            LOAD   ACTIVE SUB     DESCRIPTION  
  proc-sys-fs-binfmt_misc.automount loaded active waiting Arbitrary Executable File Formats File System Automount Point  
  sys-devices-pci0000:00-0000:00:1f.2-ata1-host0-target0:0:0-0:0:0:0-block-sda.device loaded active plugged  /dev/sda  
  sys-devices-pci0000:00-0000:00:1f.2-ata1-host0-target0:0:0:0-0:0:0:0-block-sda-sda1.device loaded active plugged  /dev/sda1  
  systemd-journald.service         loaded active running Journal Service  
  systemd-logind.service           loaded active running Login Service  
  ssh.service                      loaded active running OpenBSD Secure Shell server  
  nginx.service                    loaded active running A high performance web server and a reverse proxy server  
  ...  
  
---

## Log checks

**journalctl -u nginx**  

Feb 19 21:10:32 server systemd[1]: Starting A high performance web server and a reverse proxy server...  
Feb 19 21:10:32 server systemd[1]: Started A high performance web server and a reverse proxy server.  
Feb 19 21:10:33 server nginx[1450]: nginx: configuration file /etc/nginx/nginx.conf test is successful  
Feb 19 21:10:33 server nginx[1450]: nginx: worker process started  
Feb 19 21:15:12 server nginx[1451]: 192.168.1.10 - - [19/Feb/2026:21:15:12 +0530] "GET /index.html HTTP/1.1" 200 1024  
Feb 19 21:16:45 server nginx[1451]: 192.168.1.11 - - [19/Feb/2026:21:16:45 +0530] "POST /login HTTP/1.1" 302 512  
  
**tail -n 50 /var/log/nginx/error.log**  
Show last 50 lines of Nginx error log.  

---

## Mini troubleshooting steps

A mini troubleshooting checklist for Nginx when it misbehaves or fails to start.  
  
**Check Service Status**  
systemctl status nginx   
  - This will give the status of Nginx whether it is running, stopped, or failed. Look for an error message in the status output.

**Inspect Logs**  
journalctl -u nginx -n 50  
  - This will show last 50 log entries for Nginx. This will be useful for spotting configuration errors or startup failures.

**Test Configuration**  
nginx -t  
  - This validates the syntax of your Nginx configuration files. Reports errors and their location (line number).

**Check Port Usage**  
sudo lsof -i :80  
  - Ensures no other process is occupying port 80. Conflicts with Apache or another web server are common.

**Restart**  
sudo systemctl restart nginx  
  - Stops and starts Nginx.
