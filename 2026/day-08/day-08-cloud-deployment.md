# Cloud Server Setup: Docker, Nginx & Web Deployment  

**Commands Used**  

To connect to EC2 Instance from Git Bash, ran below command:  
```bash
ssh -i "Josh10Batch.pem" ubuntu@ec2-51-20-137-85.eu-north-1.compute.amazonaws.com
```
![sshToEC2](https://github.com/user-attachments/assets/42a3a67a-24d7-45b6-8f2b-ebdd8f08e9d6)

**Challenges Faced**  

In 1st attempt, during ssh connection, the key **Josh10Batch.pem** was not found.   
  
**What I Learned**  

So ran this command again by placing this key at location from where I am running this ssh command or you can specify full path to this key while running ssh command.  

---  

**Commands Used**  

To update the system, ran below command:  
```bash
apt-get update
```
![apt-get-update](https://github.com/user-attachments/assets/6752fc32-6861-4533-814a-3d3df64bded7)

**Challenges Faced**  

In 1st attempt, it failed with **Permission denied** issue as per above screenshot.    
  
**What I Learned**  
  
Considering the run user (**command - whoami**) will not be having enough permission to run updates on linux machine. So used super user to run same command.  
```bash
sudo apt-get update
```
And it worked!
![apt-get-update-sudo](https://github.com/user-attachments/assets/bd510614-1042-4a11-9e5b-9ea9211a9766)

---  

**Commands Used**  

To install nginx, ran below command with super user:  
```bash
sudo apt install nginx
```
**Challenges Faced**  

No chanllenges faced while installing nginx.   
  
**What I Learned**  

nginx service has started.
![nginx-webpage](https://github.com/user-attachments/assets/9603bf22-ef59-440b-b3d7-703b9c3c4838)

---  

**Commands Used**  

To save nginx logs to file, ran below command from my home dir location ~:  
```bash
journalctl -u nginx > nginx-logs.txt
```
To download this log file to my local machine, ran below command:  
```bash
scp -i "Josh10Batch.pem" ubuntu@ec2-51-20-137-85.eu-north-1.compute.amazonaws.com:~/nginx-logs.txt .
```
**Challenges Faced**  

No chanllenges faced while saving and downloading nginx logs file.  
