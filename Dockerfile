FROM alpine:latest

WORKDIR /code

RUN apk add --update curl nodejs
RUN rm -rfv /var/cache/apk/*

COPY . /code

EXPOSE 80 443

CMD ["/usr/bin/node","/code/index.js"]
