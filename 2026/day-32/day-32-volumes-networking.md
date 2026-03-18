# Docker Volumes & Networking  

## Task 1: The Problem  

Whenever the new MySQL Database container is created and stored with data in it, on container crash or removal, the stored data will get deleted. Containers are ephemeral — they lose data when removed.  

---  

Q. What is the difference between a named volume and a bind mount?  
A. **Named volumes** are Docker-managed storage areas located in /var/lib/docker/volumes/ on the host, best for production data and portability. 
**Bind mounts** map specific, user-defined host paths to containers, ideal for development, sharing source code, or configuration files, but are less portable and depend on host directory structure.  

---  

Q. Why does custom networking allow name-based communication but the default bridge doesn't?  
A. Custom networks allow name-based communication because they utilize Docker's embedded DNS server, which automatically maps container names to their IP addresses.   
The default bridge network does not support this feature, requiring containers to communicate solely via IP addresses, primarily to maintain backward compatibility and simpler networking constraints.  
