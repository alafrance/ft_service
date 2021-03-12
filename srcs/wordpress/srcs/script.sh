apk add wget
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
rm latest.tar.gz
mv wordpress www
mv ./nginx.conf /etc/nginx/
adduser -D -g 'www' www
chown -R www:www /var/lib/nginx
chown -R www:www /www/.
openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=FR/L=FR/O=42/CN=ft_services" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

# Starting
openrc sysinit
rc-service nginx start
rc-service php-fpm7 restart

tail -f /dev/null