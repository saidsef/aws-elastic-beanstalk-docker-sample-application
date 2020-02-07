FROM node:13-alpine

LABEL maintainer="Said Sef <saidsef@gmail.com> (saidsef.co.uk/)"

ARG PORT=""
LABEL version="2.0"
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

# health check endpoint
HEALTHCHECK --interval=30s --timeout=10s CMD curl --fail 'http://localhost:${PORT}/' || exit 1

CMD ["node", "/code/index.js"]
