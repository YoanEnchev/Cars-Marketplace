#!/bin/bash

# When uploading new changes:

cd ../web_app

# Install python packages from requirements.txt:
sudo pip3 install -r requirements.txt


# Install node js packages:
cd assets/js
npm install
npm run build
cd ../../

# Set env variables because those variables are forgotten on each server rebooting.
set -a
source ../.env
set +a


# Start services:
redis-server --save 20 1 --loglevel warning --requirepass ${REDIS_PASSWORD} --port ${REDIS_PORT} && redis-server --save 20 1 --loglevel warning --requirepass ${REDIS_PASSWORD_TEST} --port ${REDIS_PORT} > logs/redis.log &

sudo apache2ctl -D FOREGROUND