FROM alpine:latest

RUN mkdir -p /data

ADD fanlin /usr/bin

WORKDIR /data

CMD ["fanlin"]

