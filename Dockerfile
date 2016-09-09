FROM alpine:latest

MAINTAINER Said Sef <saidsef@gmail.com>

RUN mkdir -p /code
RUN apk add --update curl nodejs
RUN rm -rfv /var/cache/apk/*

WORKDIR /code
COPY . /code

EXPOSE 80 443

CMD ["/usr/bin/node","/code/index.js"]
