#!/usr/bin/env bash

apt-get update
apt-get install -y curl
apt-get install -y apache2
apt-get install -y php5 php5-curl php5-mysql php5-ssh2 php5-gd php5-imap php5-mcrypt

echo "mysql-server mysql-server/root_password password password" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password password" | debconf-set-selections
apt-get install -y mysql-server

# Make web root a symlink to the vagrant directory
if ! [ -L /var/www/html ]; then
  rm -rf /var/www/html
  ln -fs /vagrant/public /var/www/html
fi

service apache2 reload
