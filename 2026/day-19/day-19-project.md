# Shell Scripting Project: Log Rotation, Backup & Crontab

## Backup and Log Rotation Script  

### Script: `log_backup.sh`  

```bash
#!/bin/bash
chk_usage() {
        echo "Usage: $0 <source_path> <backup_path>"
}

if [[ $# -eq 0 ]]; then
        chk_usage
fi

src_path=$1
bkup_path=$2
bkup_date=$(date '+%Y-%m-%d-%H-%M-%S')

create_bkup() {

        tar -czf "${bkup_path}/backup_${bkup_date}.tar.gz" "${src_path}" > /dev/null
        if [[ $? -eq 0 ]]; then echo "Backup created..."; fi
}

cleanup_backups() {

        backup=($(ls -t "${bkup_path}/backup_"*.tar.gz))

        if [[ "${#backup[@]}" -gt 5 ]]; then
                echo "Performing cleanup"

                bkup_to_remove=(${backup[@]:5})

                for bkup in ${bkup_to_remove[@]}; do
                        rm -f $bkup
                done
        fi
}

create_bkup
cleanup_backups
```
**Output:**  
```bash
ubuntu@ip-172-31-27-126:~$ ./log_backup.sh /home/ubuntu/logs /home/ubuntu/backups
tar: Removing leading `/' from member names
Backup created...
Performing cleanup
```
---  
  
## crontab entries  
  
- run above script everyday at 2 AM → 0 2 * * * bash /home/ubuntu/log_backup.sh /home/ubuntu/logs /home/ubuntu/backups  
- run above script every Sunday at 3 AM → 0 3 * * 0 bash /home/ubuntu/log_backup.sh /home/ubuntu/logs /home/ubuntu/backups  
- run above script every 5 minutes → 5 * * * * bash /home/ubuntu/log_backup.sh /home/ubuntu/logs /home/ubuntu/backups  
