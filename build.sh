#!/bin/sh

info() {
  echo """
    This is a test application for AWS Elastic Beanstalk Multi Container,
    a simple 'Hello Worl' NodeJS application
  """
}

cleanup() {
  echo "Remove dorment containers"
  if [ -x "$(docker ps -a -q)" ]; then
    docker stop $(docker ps -a -q)
    docker rm -f $(docker ps -a -q)
  else
    echo "There is no dorment containers"
  fi
}

delete() {
  echo "Remove dorment images"
  if [ -x "$(docker images -a -q)"]; then
    docker rmi -f $(docker images -a -q)
  else
    echo "There is no dorment images"
  fi
}

build() {
  echo "Building image"
  docker build -t saidsef/node-webserver:dev .
}

push() {
  echo "Pushing image to docker hub"
  docker push saidsef/node-webserver:dev
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
