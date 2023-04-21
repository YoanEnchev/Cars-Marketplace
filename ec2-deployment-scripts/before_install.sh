#!/bin/bash
# When deploying project for first time:

# Give permission for everything in the express-app directory.
#sudo chmod -R 777 /home/ec2-user/Cars-Marketplace

# Navigate into our working directory where we have all our github files.
#cd /home/ec2-user/Cars-Marketplace

cd ../web_app

# Remove old python versions if exist:
rm -f /usr/bin/python

apt-get update
apt-get -y install apache2 
apt-get -y install apache2-utils

# This will automatically enable mod_cgid if your server is configured with a multi-threaded MPM
a2enmod cgi

# We must register Python with Apache. To start, we disable multithreading processes.
a2dismod mpm_event

# We give Apache explicit permission to run scripts.
a2enmod mpm_prefork cgi

# Enable wsgi
apt-get -y install libapache2-mod-wsgi-py3
a2enmod wsgi

ln -s /usr/bin/python3 /usr/bin/python

apt-get update
apt-get -y install python3-pip
apt-get -y install nano


# Necessary for postgreSQL.
apt-get update
apt-get -y install libpq-dev python3-dev


# Install NODE JS:
export NODE_VERSION=16.14.0
apt install -y curl
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
export NVM_DIR=/root/.nvm
. "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
. "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
. "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
export PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"


apt-get update
DEBIAN_FRONTEND = noninteractive # Disables prompting for timezone during postgresql installgion
apt install postgresql-14 postgresql-contrib-14 -y


apt-get update
yes | apt-get install software-properties-common
add-apt-repository ppa:redislabs/redis
yes | apt-get install redis


# Avoids cross-env: not found when executing npm run watch.
npm install --global cross-env

mkdir -p /etc/apache2/sites-enabled # Create folders recursively.
cp ./apache2.conf /etc/apache2/sites-enabled/000-default.conf


# Start postgre and create necessary databases
service postgresql start


# Execute postgres commands with a super user.
su - postgres -c "psql -c \"CREATE USER ${DB_USER} WITH ENCRYPTED password '${DB_PASSWORD}';\""
su - postgres -c "psql -c \"CREATE DATABASE ${DB_NAME};\""
su - postgres -c "psql -c \"CREATE USER ${DB_USER_TEST} WITH ENCRYPTED password '${DB_PASSWORD_TEST}';\""
su - postgres -c "psql -c \"CREATE DATABASE ${DB_NAME_TEST};\""

flask seed

redis-server --save 20 1 --loglevel warning --requirepass ${REDIS_PASSWORD} --port ${REDIS_PORT} && redis-server --save 20 1 --loglevel warning --requirepass ${REDIS_PASSWORD_TEST} --port ${REDIS_PORT} > redis.log &

echo '..........................................'
echo 'Finished setup.'
echo '..........................................'