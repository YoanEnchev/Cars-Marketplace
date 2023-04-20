#!/bin/bash

# When uploading new changes:

cd assets/js
npm install
run build
cd ../../

# Install packages from requirements.txt:
pip3 install -r requirements.txt

# Start services:
apache2ctl -D FOREGROUND