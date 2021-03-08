FROM alpine:3.12

RUN apk update && apk add openrc --no-cache && apk add nginx && apk add openssl

COPY srcs/ .

EXPOSE 80 443

ENTRYPOINT ["sh", "script.sh"]
