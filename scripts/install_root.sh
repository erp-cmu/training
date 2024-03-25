apt-get update -y
apt-get upgrade -y
timedatectl set-timezone "Asia/Bangkok"

# Supervisor
apt install supervisor -y

# Python
sudo apt-get install python3-dev python3.10-dev python3-setuptools python3-pip python3-distutils -y
sudo apt-get install python3.10-venv -y

# Etc
sudo apt-get install xvfb libfontconfig wkhtmltopdf -y

# Redis
sudo apt-get install redis-server -y

# DB
sudo apt-get install software-properties-common -y
sudo apt install mariadb-server mariadb-client -y
sudo apt-get install libmysqlclient-dev -y

# Init
mysql_secure_installation

# Set up the database config
cat <<EOT >> /etc/mysql/my.cnf
[mysqld]
character-set-client-handshake = FALSE
character-set-server = utf8mb4
collation-server = utf8mb4_unicode_ci

[mysql]
default-character-set = utf8mb4
EOT

service mysql restart