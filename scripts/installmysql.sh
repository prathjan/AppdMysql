echo $1
sudo apt update
sudo 'debconf-set-selections <<< mysql-server mysql-server/root_password password '$1''
sudo 'debconf-set-selections <<< mysql-server mysql-server/root_password_again password '$1''
sudo apt-get -y install mysql-server


database=$2
user=$3
pass=$4
echo "database is $2"
echo "user is $3"
mysql -uroot -proot <<MYSQL_SCRIPT
CREATE DATABASE ${database};
CREATE USER '${user}@localhost' IDENTIFIED BY '${pass}';
GRANT ALL PRIVILEGES ON ${database}.* TO '${user}'@'localhost' IDENTIFIED BY '${pass}';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

