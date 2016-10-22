FROM alpine:latest

MAINTAINER Said Sef <saidsef@gmail.com>

LABEL version="1.0"
LABEL description="Sample NodeJS web server"

WORKDIR /code
ENV LC_ALL="C.UTF-8" LANG="C.UTF-8"
ENV HOME /tmp

RUN mkdir -p /code
RUN apk add --update curl nodejs

WORKDIR /code
COPY . /code
ENV HOME /tmp
EXPOSE 80

RUN \
    npm -v && \
    export NPM_CONFIG_FETCH_RETRIES=10 && \
    export NPM_CONFIG_LOGLEVEL=warn && \
    npm run install

ARG BUILD_ID=""
RUN echo ${BUILD_ID} > build_id.txt

RUN rm -rfv /var/cache/apk/*
RUN npm cache clean

CMD ["node", "/code/index.js"]
