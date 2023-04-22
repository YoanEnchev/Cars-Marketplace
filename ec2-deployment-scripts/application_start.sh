#!/bin/bash

# When uploading new changes:

cd ../web_app

# Install python packages from requirements.txt:
pip3 install -r requirements.txt


# Install node js packages:
cd assets/js
npm install
npm run build
cd ../../

# Start services:
apache2ctl -D FOREGROUND