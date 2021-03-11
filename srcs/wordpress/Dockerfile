FROM alpine:3.12

RUN apk update && \
    apk add nginx && \
    apk add php7-fpm && \
    apk add php-mysqli && \
    apk add openrc && \
    apk add openssl && \
    mkdir /run/nginx;

COPY srcs/ .

EXPOSE 5050

CMD ["/bin/sh", "-c", "/usr/sbin/php-fpm7; exec nginx -g 'daemon off;';"]

ENTRYPOINT ["sh", "script.sh"]
