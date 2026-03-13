# Dockerfile: Build Your Own Images

Q. When would you use CMD vs ENTRYPOINT?  
A. Use **CMD** when you want to provide a default command or default arguments that can be easily overridden by a user at runtime.  
Use **ENTRYPOINT** when you want to define a fixed, always-executed command that turns your container into a reliable executable, with runtime arguments appended to it.  

Q. Create an image with CMD ["echo", "hello"] — run it, then run it with a custom command. What happens?  
A. When Container starts, it displays hello.  

Q. Create an image with ENTRYPOINT ["echo"] — run it, then run it with additional arguments. What happens?  
A. When Container starts, it displays blank.  

Q. Why does layer order matter for build speed?  
A. Layer order in a Dockerfile matters for build speed because of layer caching: Docker reuses cached layers from previous builds, and a change in any single layer invalidates the cache for all subsequent layers.
