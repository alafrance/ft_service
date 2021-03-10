adduser -D -g 'admin' admin
echo "admin:password" | chpasswd
/usr/sbin/pure-ftpd -p 30000:30004 -P 192.168.99.114
tail -f /dev/null
