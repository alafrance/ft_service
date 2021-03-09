FROM alpine:3.12

RUN apk update && apk add vsftpd && apk add openrc

COPY srcs/ .

EXPOSE 21

ENTRYPOINT ["sh", "script.sh"]
