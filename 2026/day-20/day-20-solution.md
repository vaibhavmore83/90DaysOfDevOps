# Bash Scripting Challenge: Log Analyzer and Report Generator

## Log Analyzer and Report Generator Script  

### Script: `log_analyzer.sh`  

```bash
#!/bin/bash
chk_arg() {
        echo "Usage: $0 <logfile_path>"
        exit 1
}

if [[ $# -eq 0 ]]; then
        chk_arg
fi

file_path=$1
summary_file="/home/ubuntu/log_report_"$(date '+%Y-%m-%d')".txt"

chk_file_exist() {
        if [[ -f $file_path ]]; then
                echo "Log file exists..."
                count_error
                notification_event
                create_summary
        else
                echo "Log file missing, exiting..."
                exit 1
        fi
}

count_error() {
        err_count=$(grep -c "ERROR" $file_path)
        echo "The Total ERROR in log file: $err_count"

        echo "Displaying top 5 ERROR messages"
        err_msg=$(grep "ERROR" $file_path | awk '{$1=$2=$3=""; print}' | sort | uniq -c | sort -rn | head -5)
        echo "$err_msg"
}

notification_event() {
        echo "Displaying Notification Events"
	event=$(grep -n "Notification time out" $file_path)
        echo "${event}"
}

create_summary() {
        echo "Creating Log Summary file $summary_file"
        echo "Date of Analysis: $(date '+%Y-%m-%d')" > $summary_file
        echo "Log file name: $file_path" >> $summary_file
        echo "Total Lines processed: $(cat $file_path | wc -l)" >> $summary_file
        echo "Total error count: $err_count" >> $summary_file
        echo "Top 5 error messages with their occurrence count" >> $summary_file
        echo "$err_msg" >> $summary_file
        echo "List of notification events with line numbers" >> $summary_file
        echo "${event}" >> $summary_file
}
chk_file_exist

```
**Output:**  
  
The **script run output** is attached in repo as **script_output.txt**.  
The **Log Summary File** is attached in repo as **log_report_2026-02-25.txt**.  
The **sample log file** is attached in repo as **sample_log.log**.  
