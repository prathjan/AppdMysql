echo $1
sudo apt update
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password '$1''
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password '$1''
sudo apt-get -y install mysql-server

