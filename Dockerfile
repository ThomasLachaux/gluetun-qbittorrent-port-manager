FROM alpine:latest

RUN apk update
RUN apk add --no-cache curl inotify-tools bash

WORKDIR /app
RUN adduser -u 1000 -D app && chown app:app /app
USER app

ENV PORT_FORWARDED=/tmp/gluetun/forwarded_port

COPY ./start.sh ./start.sh
RUN chmod u+x ./start.sh

CMD ["./start.sh"]
