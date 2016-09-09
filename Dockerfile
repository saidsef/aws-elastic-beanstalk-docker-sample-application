FROM alpine:latest

WORKDIR /code
ENV HOME /tmp

RUN apk add --update curl nodejs

COPY . /code
ENV HOME /tmp
EXPOSE 80 443

RUN \
    npm -v && \
    export NPM_CONFIG_FETCH_RETRIES=10 && \
    export NPM_CONFIG_LOGLEVEL=warn && \
    npm run install

RUN rm -rfv /var/cache/apk/*
RUN npm cache clean

CMD ["node", "/code/index.js"]
