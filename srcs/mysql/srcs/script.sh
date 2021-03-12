mv mariadb-server.cnf /etc/my.cnf.d/
mysql_install_db --user=mysql --datadir=/var/lib/mysql
openrc sysinit
rc-service mariadb start
mysql -u root < mysql.sql
rc-service mariadb restart
tail -f /dev/null