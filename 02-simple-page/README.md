# 03 - Single Page Application (SPA)

## Requirements

- Docker (https://docs.docker.com/engine/installation/

## Containers

- NodeJS 6.x (`node:6` / `node:6-slim` / `iron/node:latest`)

## Manual

1. Build image with `docker build -t spa app` command.
2. Type `docker run -v $(pwd)/app:/srv -p 8000:80 spa` to run container.
3. Open browser on `http://localhost:8000` and heureka!

![](https://raw.githubusercontent.com/trainit/2016-docker-workshop/master/02-simple-page/misc/01.png "NodeJS Application!")

![](https://raw.githubusercontent.com/trainit/2016-docker-workshop/master/02-simple-page/misc/02.png "NodeJS Application!")
