# Docker Images & Container Lifecycle

Q. Why alpine is much smaller in size than ubuntu?  
A. alpine is purposefully engineered for minimalism, security, and container efficiency, using different core components that prioritize speed over compatibility.  

Q. What are layers and why does Docker use them?  
A. Docker layers are immutable, read-only filesystems representing stacked changes—additions, deletions, or modifications—created by each instruction in a Dockerfile.  
They enable efficient, lightweight containers through reusability, caching, and reduced storage/bandwidth, allowing common files to be shared across images.  
If only one part of the build changes, Docker only rebuilds affected layers, significantly speeding up build times.
