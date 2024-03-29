FROM ubuntu:22.04

WORKDIR /var/www/web_app
EXPOSE 80

# Remove old python versions if exist:
RUN rm -f /usr/bin/python

RUN apt-get update
RUN apt-get -y install apache2 
RUN apt-get -y install apache2-utils 



# This will automatically enable mod_cgid if your server is configured with a multi-threaded MPM
RUN a2enmod cgi

# We must register Python with Apache. To start, we disable multithreading processes.
RUN a2dismod mpm_event

# We give Apache explicit permission to run scripts.
RUN a2enmod mpm_prefork cgi

# Enable wsgi
RUN apt-get -y install libapache2-mod-wsgi-py3
RUN a2enmod wsgi


RUN ln -s /usr/bin/python3 /usr/bin/python

RUN apt-get update
RUN apt-get -y install python3-pip
RUN apt-get -y install nano

# Necessary for postgreSQL.
RUN apt-get update
RUN apt-get -y install libpq-dev python3-dev

# Install packages from requirements.txt:
COPY ./web_app/requirements.txt .
RUN pip3 install -r requirements.txt


# Install NODE JS:
ENV NODE_VERSION=16.14.0
RUN apt install -y curl
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"

# Avoids cross-env: not found when executing npm run watch.
RUN npm install --global cross-env

# Makes it visible to the ENTRYPOINT instruction.
COPY entrypoint.sh /

ENTRYPOINT ["sh", "/entrypoint.sh"]