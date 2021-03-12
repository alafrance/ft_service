FROM alpine:3.12

RUN apk update && apk add mysql mysql-client openrc

COPY srcs/ .

EXPOSE 3034


ENTRYPOINT ["sh", "script.sh"]
