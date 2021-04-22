FROM alpine:3.8
MAINTAINER Lucas Ramage <ramage.lucas@protonmail.com>

WORKDIR /usr/src/pitch-dark
COPY . /usr/src/pitch-dark

RUN apk update && \
    apk add --no-cache \
            alpine-sdk \
            less \
            nodejs-npm \
            python3 \
    && pip3 install mkdocs \
    && adduser -s /bin/sh -D build \
    && python3 setup.py install

USER build
WORKDIR /home/build/src
CMD ["mkdocs", "build"]
