# Docker Chamilo

Stack:
* PHP 7.3
* nginx latest
* Mariadb latest

## Install

```bash
cp .env.exaple .env
```

Edit the .env file to put your prefered database credentials.

> **PS**: This repository is maked to developers, don't use this code in prod. To use in prod, review the `docker-compsoe.yml` and all config files of all containers.

```
docker-compose up
```

Access the application in http://localhost

If your port 80 is in use, change de port mapping in `docker-compose.yml` of service `nginx`.