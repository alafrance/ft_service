adduser -D -g 'admin' admin
echo "admin:pa$$word" | chpasswd
/usr/sbin/pure-ftpd -p 30000:30004 -P MINIKUBEIP
tail -f /dev/null