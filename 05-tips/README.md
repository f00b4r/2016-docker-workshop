# 05 - Tips

1. [ENTRYPOINT vs CMD](#1-entrypoint-vs-cmd)
2. [File/folder permisions](#2-filefolder-permissions)
2. [PHP + Xdebug + Phpstorm](#3-php-xdebug-phpstorm)

## 1# ENTRYPOINT vs CMD

**ENTRYPOINT** has two forms:

- ENTRYPOINT `["executable", "param1", "param2"]` (exec form, preferred)
- ENTRYPOINT `command param1 param2` (shell form)

An **ENTRYPOINT** allows you to configure a container that will run as an executable.

The **CMD** instruction has three forms:

- CMD `["executable","param1","param2"]` (exec form, this is the preferred form)
- CMD `["param1","param2"]` (as default parameters to ENTRYPOINT)
- CMD `command param1 param2` (shell form)

There can only be one CMD instruction in a Dockerfile. If you list more than one CMD then only the last CMD will take effect.

You can combine **ENTRYPOINT** and **CMD** together.

## 2# File/folder permissions

You have a nginx/apache webserver and PHP application. PHP creates some cache and it has a `www-data` as user. It's a big thing that makes you a couple nights.

You have following 

- Delete files/folders as root user. So boring, right?
	- `sudo rm <folder> -rf`
- Add user to your container and start webserver by this user. Better but unsecure!
- Use linux ACL (]setfacl / getfacl](http://linuxcommand.org/man_pages/setfacl1.html))
	- `setfacl -R -m "u:<user>:rwx" <folder>`
	- `setfacl -R -m "d:u:<user>:rwx" <folder>`

## 3# PHP + Xdebug + Phpstorm

Useful resources:

- https://gist.github.com/chadrien/c90927ec2d160ffea9c4
- https://sandro-keil.de/blog/2015/10/05/docker-php-xdebug-cli-debugging/
- http://stackoverflow.com/questions/30668090/how-can-i-debug-my-docker-container-with-phpstorm
- http://obrown.io/2015/12/23/phpunit-docker-phpstorm.html

Creates [`php-in-docker.sh`](https://github.com/trainit/2016-docker-workshop/blob/master/04-gui/php-in-docker.sh) and copy into following content. Don't forget to setup `chmod +x php-in-docker.sh`.

```
#!/usr/bin/env bash
docker run -i --rm -v $(pwd):$(pwd) -e PHP_IDE_CONFIG="serverName=docker.project" -e XDEBUG_CONFIG="remote_host=172.17.0.1" -v /tmp/:/tmp/ --net=host --sig-proxy=true --pid=host <image> php "$@"
```

Environment possibilities:

- PHP_IDE_CONFIG="serverName=docker.project"
- XDEBUG_CONFIG="remote_host=172.17.0.1"
- XDEBUG_CONFIG="idekey=PHPSTORM"

Xdebug configuration:

```
zend_extension=<path-to-xdebug>/xdebug.so
xdebug.remote_enable=on
xdebug.remote_autostart=off
```

Phpstorm configuration:

- Add `php-in-docker.sh` to your `other local PHP interpreter`. Ignore php.ini warnings.
- You have to enable listening (on port `9000` or other) in the toolbar for every debugging in docker container.
- You have to setup your source mapping from host to docker container.
