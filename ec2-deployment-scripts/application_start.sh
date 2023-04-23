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

# Start services:
sudo apache2ctl -D FOREGROUND