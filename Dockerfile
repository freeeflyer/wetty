FROM node:alpine
MAINTAINER Nicolas Zagulajew (freeeflyer) <docker.com@xoop.org>

ADD . /app
WORKDIR /app

RUN apk add --update vim bash openssh-client python make g++ procps \
    && npm install \
    && adduser -S -h /home/term -s /bin/bash term \
    && apk del python make g++  \
    && echo 'term:term' | chpasswd 

EXPOSE 3000

ENTRYPOINT ["node"]
CMD ["app.js", "-p", "3000"]
