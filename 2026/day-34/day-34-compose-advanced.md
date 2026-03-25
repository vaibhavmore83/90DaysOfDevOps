# Docker Compose: Real-World Multi-Container Apps  

## Restart Policies:  

Docker offers several restart policies, available when using docker run --restart or restart: in docker-compose.yml:  

**no:** Do not automatically restart (default).  
**always:** Always restart the container regardless of the exit status. The container will also always start on daemon startup, even if it was manually stopped.  
**unless-stopped:** Always restart unless the container is explicitly stopped by a user command (e.g., docker stop). This is generally preferred for services as it allows manual control while ensuring automatic restarts after system reboots.  
**on-failure:** Only restart the container if it exits with an error.  

## Scaling:  

The scaling of the nginx application has failed with below error.  

Error response from daemon: failed to set up container networking: driver failed programming external connectivity on endpoint compose-basics-nginx-3 (60777b5dd1b592fccf9fe210ab25b0ceccdbe91a9ede0e3e18fa489f9e1ab1e8): Bind for 0.0.0.0:8087 failed: port is already allocated  

As **port** is assigned to 1st instance of the nginx container, same port won't get assigned to other two replicas of nginx containers.  

When scaling, avoid explicitly mapping a single static host port to a container port in your docker-compose.yml file (e.g., ports: "8080:80"). This will cause a "port already allocated" error for the second and subsequent containers. Instead, use a port range (e.g., ports: "8080-8082:80") to allow Docker to assign unique host ports automatically.  

If you only want to scale a single service without affecting others defined in your YAML file, you must explicitly list the service name at the end of the command (e.g., docker compose up --scale nginx=3 nginx). Otherwise, all services will start.  

**docker-compose.yml**
```bash
services:
  nginx:
    image: nginx:latest
#    container_name: nginx-dc
    ports:
    - "8087-8090:80"
```
**Restart only nginx service**
```bash
docker compose up -d --scale nginx=3 nginx

WARN[0000] No services to build
[+] up 3/3
 ✔ Container compose-basics-nginx-1 Recreated                                        0.2s
 ✔ Container compose-basics-nginx-2 Recreated                                        0.4s
 ✔ Container compose-basics-nginx-3 Recreated                                        0.2s 
```
**docker ps -a**
```bash
CONTAINER ID   IMAGE              COMMAND                  CREATED         STATUS                   PORTS                                                    NAMES
06c75d0ce60c   nginx:latest       "/docker-entrypoint.…"   8 seconds ago   Up 7 seconds             0.0.0.0:8087->80/tcp, [::]:8087->80/tcp                  compose-basics-nginx-2
d9b28ce5fca3   nginx:latest       "/docker-entrypoint.…"   8 seconds ago   Up 7 seconds             0.0.0.0:8088->80/tcp, [::]:8088->80/tcp                  compose-basics-nginx-1
2929590a0508   nginx:latest       "/docker-entrypoint.…"   8 seconds ago   Up 6 seconds             0.0.0.0:8089->80/tcp, [::]:8089->80/tcp                  compose-basics-nginx-3
bf2df4098cf0   mysql:8.0          "docker-entrypoint.s…"   8 minutes ago   Up 8 minutes (healthy)   0.0.0.0:3306->3306/tcp, [::]:3306->3306/tcp, 33060/tcp   mysql-dc
5fe3b3c446df   wordpress:latest   "docker-entrypoint.s…"   44 hours ago    Up 7 minutes             0.0.0.0:8084->80/tcp, [::]:8084->80/tcp                  wordpress-dc
```
---  

**docker-compose.yml**
```bash
services:
  nginx:
    image: nginx:latest
#    container_name: nginx-dc
    ports:
    - "8087-8090:80"

  mysql:
    image: mysql:8.0
    container_name: mysql-dc
    env_file:
      - test.env
    ports:
    - "3306:3306"
    environment:
      MYSQL_ROOT_PASSWORD: Test@123
      MYSQL_DATABASE: TestDB
    healthcheck:
      test: ["CMD", "mysqladmin", "ping", "-h", "localhost", "-u", "root", "-pTest@123"]
      interval: 10s
      timeout: 5s
      retries: 3
      start_period: 30s
    volumes:
    - mysql-dc-data:/var/lib/mysql
    networks:
    - test-dc-nw

  wordpress:
    image: wordpress:latest
    container_name: wordpress-dc
    ports:
      - "8084:80"
    volumes:
      - wordpress-dc-data:/var/www/html
    networks:
    - test-dc-nw
    environment:
      WORDPRESS_DB_HOST: mysql
      WORDPRESS_DB_NAME: TestDB
      WORDPRESS_DB_USER: root
      WORDPRESS_DB_PASSWORD: Test@123
      WORDPRESS_DB_PORT: 3306
    depends_on:
      mysql:
        condition: service_healthy

volumes:
  mysql-dc-data:
  wordpress-dc-data:

networks:
  test-dc-nw:
    driver: bridge
```
