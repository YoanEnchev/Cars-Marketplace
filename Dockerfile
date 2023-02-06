FROM ubuntu
FROM python:3.10
FROM node:16.14.0

WORKDIR /web_app
EXPOSE 81

RUN apt update 
RUN apt-get -y install python3-pip
RUN apt-get -y install apache2 
RUN apt-get -y install apache2-utils 

# This will automatically enable mod_cgid if your server is configured with a multi-threaded MPM
# RUN a2enmod cgi

# We must register Python with Apache. To start, we disable multithreading processes.
RUN a2dismod mpm_event

# We give Apache explicit permission to run scripts.
RUN a2enmod mpm_prefork cgi

RUN npm install --global cross-env

WORKDIR /web_app
CMD ["apache2ctl", "-D", "FOREGROUND"]