#!/bin/bash
# When deploying project for first time:

# Give permission for everything in the express-app directory.
sudo chmod -R 777 /home/ubuntu/Cars-Marketplace

# Navigate into our working directory where we have all our github files.
cd /home/ubuntu/Cars-Marketplace
cp cp .env.example  .env
cd web_app

# Remove old python versions if exist:
rm -f /usr/bin/python

sudo apt-get update
sudo apt-get -y install apache2 
sudo apt-get -y install apache2-utils

# This will automatically enable mod_cgid if your server is configured with a multi-threaded MPM
sudo a2enmod cgi

# We must register Python with Apache. To start, we disable multithreading processes.
sudo a2dismod mpm_event

# We give Apache explicit permission to run scripts.
sudo a2enmod mpm_prefork cgi

# Enable wsgi
sudo apt-get -y install libapache2-mod-wsgi-py3
sudo a2enmod wsgi

sudo ln -s /usr/bin/python3 /usr/bin/python

sudo apt-get update
sudo apt-get -y install python3-pip
sudo apt-get -y install nano


# Necessary for postgreSQL.
sudo apt-get update
sudo apt-get -y install libpq-dev python3-dev


# Install NODE JS:
sudo apt-get update
yes | sudo apt install curl
curl -s https://deb.nodesource.com/setup_16.x
yes | sudo apt install nodejs
yes | sudo apt install npm


sudo apt-get update
sudo apt install postgresql-14 postgresql-contrib-14 -y


sudo apt-get update
yes | sudo apt-get install software-properties-common
sudo add-apt-repository ppa:redislabs/redis
yes | sudo apt-get install redis


# Avoids cross-env: not found when executing npm run watch.
sudo npm install --global cross-env

mkdir -p /etc/apache2/sites-enabled # Create folders recursively.
sudo cp ../ec2-deployment/apache2.conf /etc/apache2/sites-enabled/000-default.conf


# Start postgre and create necessary databases
sudo service postgresql start

# Set .env variables from .env file.
set -a
source ../.env
set +a


# Execute postgres commands with a super user.
sudo su - postgres -c "psql -c \"CREATE USER ${DB_USER} WITH ENCRYPTED password '${DB_PASSWORD}';\""
sudo su - postgres -c "psql -c \"CREATE DATABASE ${DB_NAME};\""
sudo su - postgres -c "psql -c \"CREATE USER ${DB_USER_TEST} WITH ENCRYPTED password '${DB_PASSWORD_TEST}';\""
sudo su - postgres -c "psql -c \"CREATE DATABASE ${DB_NAME_TEST};\""

sudo pip3 install -r requirements.txt
flask seed

# Images and folders generated by flask seed seem to be inaccessible for the app to update.
# So set permissions.

chmod -R 777 static/imgs/cars/
i=1
while [ "$i" -le 17 ]; do
    chmod -R 777 static/imgs/cars/$i/
    i=$(( i + 1 ))
done

# Avoids apache error
sudo chmod +x /home/ubuntu/

echo '..........................................'
echo 'Finished setup.'
echo '..........................................'