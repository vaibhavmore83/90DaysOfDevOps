# Docker Compose: Multi-Container Basics  

## Compose Commands  

Start services in detached mode - docker compose up -d  
View running services - docker ps -a  
View logs of all services - docker compose logs  
Follow logs of all services - docker compose logs -f  
View logs of a specific service - docker logs <container-id>  
Stop services without removing - docker compose stop  
Remove everything (containers, networks) - docker compose down  
Rebuild images if you make a change - docker compose up --build -d  

---  

**docker-compose.yml**  
```bash
services:
  nginx:
    image: nginx:latest
    container_name: nginx-dc
    ports:
    - "8087:80"

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

volumes:
  mysql-dc-data:
  wordpress-dc-data:

networks:
  test-dc-nw:
    driver: bridge
```
