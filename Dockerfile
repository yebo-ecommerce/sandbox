FROM node:4.0.0

# Define User
ENV USER root

# Define APP NAME
ENV APP_HOME /zerotreze

# Note: npm is v2.7.6
RUN npm install -g ember-cli --allow-root
RUN npm install -g bower
RUN npm install -g phantomjs

RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise-updates main restricted" | tee -a /etc/apt/sources.list.d/precise-updates.list
RUN apt-get update -qq
RUN apt-get install -y python2.7-dev

# install watchman
RUN \
	git clone https://github.com/facebook/watchman.git &&\
	cd watchman &&\
	git checkout v3.7.0 &&\
	./autogen.sh &&\
	./configure &&\
	make &&\
	make install

# Create folder
RUN mkdir /$APP_HOME

# Define workdir
WORKDIR /$APP_HOME

# Add files
ADD . /$APP_HOME

# define volume
# VOLUME ["/app"]

# Expose the ports that your $APP_HOME uses. For example:
EXPOSE 4200 49152
