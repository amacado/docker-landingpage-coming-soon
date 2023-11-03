#!/bin/sh

docker pull node:21.1.0-bookworm-slim
docker run --name amacado-docker-landingpage-coming-soon-build --rm -itd -v $pwd/:/mnt node:21.1.0-bookworm-slim
docker exec -it amacado-docker-landingpage-coming-soon-build /bin/bash -c "cd /mnt && rm -rf node_modules && rm -rf dist && yarn install && yarn build"
docker stop amacado-docker-landingpage-coming-soon-build
docker rm amacado-docker-landingpage-coming-soon-build


# wait some time before building the image
# to allow mount to be synced with local filesystem
docker build . -t amacado/docker-landingpage-coming-soon:latest
docker run -d -p 8080:80 amacado/docker-landingpage-coming-soon:latest
