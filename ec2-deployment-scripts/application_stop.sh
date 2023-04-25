#!/bin/bash
cd ../web_app

# Stop services:
sudo service redis-server stop
sudo service apache2 stop