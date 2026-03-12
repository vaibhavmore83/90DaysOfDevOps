# Introduction to Docker

Q. What is a container and why do we need them?  
A. A container is a lightweight, portable package that bundles an application with all its dependencies so it runs consistently across different environments.  
We need containers because they solve the “works on my machine” problem, enabling faster development, easier deployment, provides security and efficient scaling compared to traditional virtual machines.  

Q. Containers vs Virtual Machines — what's the real difference?  
A.  
| Feature              | Containers                          | Virtual Machines                     |
|----------------------|-------------------------------------|--------------------------------------|
| **OS Requirement**   | Share host OS kernel                | Each VM runs its own OS              |
| **Startup Time**     | Seconds                             | Minutes                              |
| **Resource Usage**   | Lightweight, minimal overhead       | Heavy, full OS per VM                |
| **Isolation**        | Process-level isolation             | Hardware-level isolation             |
| **Portability**      | High – runs consistently anywhere   | Moderate – depends on hypervisor     |
| **Best Use Case**    | Microservices, cloud-native apps    | Legacy apps, full OS isolation       |
| **Scalability**      | Easily scalable, fast deployments   | Slower to scale, resource intensive  |
| **Management Tools** | Docker, Podman, Kubernetes          | VMware, Hyper-V, VirtualBox          |

Q. What is the Docker architecture? (daemon, client, images, containers, registry)  
A. ![docker_arch](https://github.com/user-attachments/assets/f78db47b-4867-4e4f-8426-8916228ce862)
