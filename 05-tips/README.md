# 05 - Tips

## Table of Content (TOC)

1. ENTRYPOINT vs CMD
2. File/folder permisions.

## 1# ENTRYPOINT vs CMD

ENTRYPOINT has two forms:

- ENTRYPOINT `["executable", "param1", "param2"]` (exec form, preferred)
- ENTRYPOINT `command param1 param2` (shell form)

An ENTRYPOINT allows you to configure a container that will run as an executable.

The CMD instruction has three forms:

- CMD `["executable","param1","param2"]` (exec form, this is the preferred form)
- CMD `["param1","param2"]` (as default parameters to ENTRYPOINT)
- CMD `command param1 param2` (shell form)

There can only be one CMD instruction in a Dockerfile. If you list more than one CMD then only the last CMD will take effect.

You can combine ENTRYPOINT and CMD together.

## 2# File/folder permissions.

You have a nginx/apache webserver and PHP application. PHP creates some cache and it has a `www-data` as user. It's a big thing that makes you a couple nights.

You have following 

- Delete files/folders as root user. So boring and unsecure, right?
	- `sudo rm <folder> -rf`
- Add user to your container and start webserver by this user. Better!
- Use linux ACL.
	- `setfacl -R -m "u:<user>:rwx" <folder>`
	- `setfacl -R -m "d:u:<user>:rwx" <folder>`
