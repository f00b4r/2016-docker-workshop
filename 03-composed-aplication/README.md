# 03 - Composed Application (Dynamic)

## Requirements

- Docker (https://docs.docker.com/engine/installation/)
- Docker Compose (https://docs.docker.com/compose/)

## Installation

```sh
curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

## Containers

- PHP 7.x-FPM (`php:7-fpm`)
- Nginx (`nginx:1.11`)
- MariaDB (`mariadb`)
- Adminer (`dockette/adminer:mysql-php7`)
```

## Manual

1. Run `docker-compose -v` to see your docker-compose version.
2. Start connected containers with `docker-composer up`.
3. Connect to container `docker exec -it <name> bash`.
4. Go to folder `/srv` and update chmod of **var** folder. `chmod -R 0777 /srv/var`.
5. Download dependencies with `composer install`.
6. Setup database with following commands:
	- `bin/console doctrine:database:create`
	- `bin/console doctrine:schema:create`
	- `bin/console doctrine:fixtures:load`
7. Open browser.
	- `http://localhost:8000` is development version.
	- `http://localhost:9000` is production version.
	- `http://localhost:10000` occupies Adminer.


![](https://raw.githubusercontent.com/trainit/2016-docker-workshop/master/03-composed-application/misc/01.png "Composed Application!")
