apt-get update -y
apt-get upgrade -y
timedatectl set-timezone "Asia/Bangkok"

# Supervisor
apt install supervisor -y

# Python
sudo apt-get install python3-dev python3.10-dev python3-setuptools python3-pip python3-distutils -y
sudo apt-get install python3.10-venv -y

# DB
sudo apt-get install software-properties-common
sudo apt install mariadb-server mariadb-client
sudo apt-get install libmysqlclient-dev

# Auto running >>mysql_secure_installation
# Make sure that NOBODY can access the server without a password
mysql -e "UPDATE mysql.user SET Password = PASSWORD('1234') WHERE User = 'root'"
# Kill the anonymous users
mysql -e "DROP USER ''@'localhost'"
# Because our hostname varies we'll use some Bash magic here.
mysql -e "DROP USER ''@'$(hostname)'"
# Kill off the demo database
mysql -e "DROP DATABASE test"
# Make our changes take effect
mysql -e "FLUSH PRIVILEGES"
# Any subsequent tries to run queries this way will get access denied because lack of usr/pwd param

cat <<EOT >> /etc/mysql/my.cnf
[mysqld]
character-set-client-handshake = FALSE
character-set-server = utf8mb4
collation-server = utf8mb4_unicode_ci

[mysql]
default-character-set = utf8mb4
EOT

service mysql restart