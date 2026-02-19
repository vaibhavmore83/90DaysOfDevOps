# Linux Architecture Overview
The easiest way to remember the Linux Architecure is with the word **ASK**  

**A** - **Application** - Outer Circle where end user programs runs  
**S** - **Shell** - Inner circle to Application which is basically helps to communicate Application with the Heart of Linux, which is **Kernel**.  
**K** - **Kernel** - The HEART of the Linux Architecure. It is an inner circle to Shell.  

## Main Components
- **Application**
  - End-user programs like browsers, databases, etc.

- **Shell**
  - Command interpreter. Examples are **Bash, Zsh, Fish**
  - Passes user commands to the kernel.

- **Kernel**
  - Core/Heart of Linux.
  - Manages system resources: process scheduling, memory, device drivers.
  - Provides system calls for applications.

- **Hardware**
  - CPU, memory, storage, I/O devices.
  - Linux interacts with hardware through drivers.

These components communicates with the one below it, ensuring modularity and stability.

---

## About systemd Process

This process runs as the first process (PID 1) after the kernel boots. It provides commands like **systemctl** for managing services, **journalctl** for logs, and timers for scheduling tasks.

---

## 5 Basic Linux Commands

1. **ls**
   - Lists files and directories in the current directory.
   - Example: ls -l (shows detailed info like permissions, size, and date)

2. **pwd**
   - Prints the current working directory.
   - Example: pwd (displays current working dir like /home/username)

3. **cd**
   - Changes the current directory.
   - Example: cd /var/log (moves into the /var/log directory)

4. **cp**
   - Copies files or directories.
   - Example: cp file.txt /home/username/ (copies file.txt to the /home/username/ folder)

5. **rm**
   - Removes files or directories.
   - Example: rm oldfile.txt (deletes oldfile.txt)
