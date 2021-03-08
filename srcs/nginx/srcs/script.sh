openrc sysinit
adduser -D -g 'www' www
mkdir /www
chown -R www:www /var/lib/nginx
chown -R www:www /www
openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;
mv /nginx.conf /etc/nginx/nginx.conf
mv index.html /www/
service nginx start
tail -f /dev/null