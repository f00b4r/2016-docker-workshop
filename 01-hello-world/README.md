# 01 - Hello World

## Requirements

- Docker (https://docs.docker.com/engine/installation/)

## Installation

- Docker (https://dckr.cz/)
	- `apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D`
	- `apt-get install apt-transport-https ca-certificates`
	- **Debian**
		- `deb http://http.debian.net/debian wheezy-backports main`
		- `deb https://apt.dockerproject.org/repo debian-wheezy main`
		- `deb https://apt.dockerproject.org/repo debian-jessie main`
		- `deb https://apt.dockerproject.org/repo debian-stretch main`
	- **Ubuntu**
		- `deb https://apt.dockerproject.org/repo ubuntu-precise main`
		- `deb https://apt.dockerproject.org/repo ubuntu-trusty main`
		- `deb https://apt.dockerproject.org/repo ubuntu-wily main`
		- `deb https://apt.dockerproject.org/repo ubuntu-xenial main`
	- `sudo apt-get update`
	- `sudo apt-get install docker-engine`

- Make sure your user is in the `docker` group. (Type `groups` for more details)
	- `sudo groupadd docker`
	- `sudo gpasswd -a ${USER} docker`
	- `sudo service docker restart`

# Containers

- Hello world (`hello-world`)

## Manual

1. Download and install docker.
2. Solve all problem with docker installation. :sweat_smile:
3. Type `docker ps`
4. Try `docker run hello-world`

![alt text](https://raw.githubusercontent.com/trainit/2016-docker-workshop/master/01-hello-world/misc/01.png "Hello World!")
