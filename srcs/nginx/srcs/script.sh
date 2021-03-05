openrc sysinit
apk add openssl
adduser -D -g 'www' www
mkdir /www
chown -R www:www /var/lib/nginx
chown -R www:www /www

mv /nginx.conf /etc/nginx/nginx.conf
mv index.html /www/
service nginx start
