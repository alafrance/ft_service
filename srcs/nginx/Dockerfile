FROM alpine:3.12

RUN apk update && apk add openrc --no-cache && apk add nginx 

COPY srcs/ .

EXPOSE 80

#ENTRYPOINT ["sh", "script.sh"]
