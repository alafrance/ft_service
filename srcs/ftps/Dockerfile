FROM alpine:3.12

RUN apk update && apk add pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache openssl

COPY srcs/ .

EXPOSE 21

ENTRYPOINT ["sh", "script.sh"]
