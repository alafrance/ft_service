adduser -D -g 'admin' admin
echo "admin:password" | chpasswd
/usr/sbin/pure-ftpd -p 30000:30004 -P MINIKUBEIP
tail -f /dev/null