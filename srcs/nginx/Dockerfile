FROM alpine:3.12

RUN apk update && apk add nginx openrc --no-cache openssl openssh

COPY ./srcs/ .

EXPOSE 80 443

ENTRYPOINT ["sh", "script.sh"]
