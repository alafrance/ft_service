adduser -D -g 'admin' admin
echo "admin:password" | chpasswd
openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=FR/L=FR/O=42/CN=ft_services" -newkey rsa:2048 -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/certs/pure-ftpd.pem
mv /pure-ftpd.conf /etc
chmod 777 /etc/ssl/private
chmod 600 /etc/ssl/private/pure-ftpd.conf
/usr/sbin/pure-ftpd -Y 2 -p 30000:30004 -P 192.168.49.2
tail -f /dev/null