#!/bin/sh

BUILD_ID=$1

info() {
  echo """
    This is a containerised NodeJS Application Webserver
  """
}

cleanup() {
  echo "Remove dorment containers"
  if [ ! -z "$(docker ps -a -q | head -n 1)" ]; then
    docker stop $(docker ps -a -q)
    docker rm -f $(docker ps -a -q)
  else
    echo "There is no dorment containers"
  fi
}

delete() {
  echo "Remove dorment images"
  if [ ! -z "$(docker images -a -q | head -n 1)" ]; then
    docker rmi -f $(docker images -a -q) || true
  else
    echo "There is no dorment images"
  fi
}

# deprecated in favour of buildx
# build() {
#   echo "Building image"
#   docker build --build-arg "BUILD_ID=${BUILD_ID}" -t saidsef/node-webserver .
#   docker build --build-arg "BUILD_ID=${BUILD_ID}" -t saidsef/node-webserver:arm64 . -f Dockerfile.arm64
#   docker build --build-arg "BUILD_ID=${BUILD_ID}" -t saidsef/node-webserver:armhf . -f Dockerfile.armhf
#   docker tag saidsef/node-webserver saidsef/node-webserver:build-${BUILD_ID}
# }

gitsubmodule() {
  echo "Updating git submodule"
  git submodule update --remote
}

buildx() {
  echo "Build multi ARCH"
  docker buildx create --use
  cd vendor/node-webserver
  docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t saidsef/node-webserver:latest --push .
}

# deprecated in favour of buildx
# push() {
#   echo "Pushing image to docker hub"
#   docker push saidsef/node-webserver
#   echo $?
# }

main() {
  info
  cleanup
  gitsubmodule
  buildx
}

main