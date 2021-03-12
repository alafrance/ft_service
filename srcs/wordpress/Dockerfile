FROM alpine:3.12

RUN apk update && \
    apk add nginx openssl openrc php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session php-phar && \
    apk add mysql mysql-client

COPY srcs/ .

EXPOSE 5050

ENTRYPOINT ["sh", "script.sh"]
