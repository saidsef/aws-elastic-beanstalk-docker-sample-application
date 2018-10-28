FROM node:alpine
MAINTAINER Said Sef <saidsef@gmail.com>

ARG PORT=""
LABEL version="1.0"
LABEL description="Sample NodeJS web server"

ARG BUILD_ID=""

ENV LC_ALL="C.UTF-8" LANG="C.UTF-8"
ENV HOME /tmp
ENV NPM_CONFIG_FETCH_RETRIES 10
ENV NPM_CONFIG_LOGLEVEL warn
ENV PORT ${PORT:-80}

WORKDIR /code
COPY . /code

RUN apk add --update curl nodejs && \
    npm -v && \
    npm run install && \
    rm -rfv /var/cache/apk/* && \
    npm cache clean && \
    echo ${BUILD_ID} > build_id.txt

EXPOSE ${PORT}

CMD ["node", "/code/index.js"]
