#!/bin/sh

BUILD_ID=$1

info() {
  echo """
    This is a test application for AWS Elastic Beanstalk Multi Container,
    a simple 'Hello Worl' NodeJS application
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
    docker rmi -f $(docker images -a -q) && true
  else
    echo "There is no dorment images"
  fi
}

build() {
  echo "Building image"
  docker build -t saidsef/node-webserver:build-${BUILD_ID} .
}

push() {
  echo "Pushing image to docker hub"
  docker push saidsef/node-webserver:build-${BUILD_ID}
}

main() {
  info
  cleanup
  build
  push
  cleanup
  delete
}

main
