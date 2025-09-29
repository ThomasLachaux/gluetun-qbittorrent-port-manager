FROM alpine:latest

RUN apk update
RUN apk add --no-cache curl inotify-tools bash

WORKDIR /app
RUN adduser -u 1000 -D app && chown app:app /app
USER app

ENV QBITTORRENT_SERVER=localhost
ENV QBITTORRENT_PORT=8080
ENV QBITTORRENT_USER=admin
ENV QBITTORRENT_PASS=adminadmin
ENV PORT_FORWARDED=tmp/gluetun/forwarded_port
ENV HTTP_S=http

COPY ./start.sh ./start.sh
RUN chmod u+x ./start.sh

CMD ["./start.sh"]
