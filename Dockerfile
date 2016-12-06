# Use NodeJS Image
FROM node:4.0.0

# Define User
ENV USER root

# Set the ember enviroment
ENV EMBER_ENV production

# Update
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise-updates main restricted" | tee -a /etc/apt/sources.list.d/precise-updates.list
RUN apt-get update -qq
RUN apt-get install -y python2.7-dev

# Install dev dependencies
RUN npm install -g phantomjs

# install watchman
RUN \
  git clone https://github.com/facebook/watchman.git &&\
  cd watchman &&\
  git checkout v3.7.0 &&\
  ./autogen.sh &&\
  ./configure &&\
  make &&\
  make install

# Install nginx
RUN apt-get install -y nginx

# Note: npm is v2.7.6
RUN npm install -g ember-cli --allow-root
RUN npm install -g bower

# Install prerender
RUN git clone https://github.com/prerender/prerender.git
WORKDIR /prerender
RUN npm install

# Set nginx config
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
ADD ./config/nginx.conf /etc/nginx/sites-enabled/default

# Add start script
ADD ./scripts/start.sh /start.sh
RUN chmod 755 /start.sh

# Create source tmp dir
RUN mkdir /app-tmp

# Create folder where colume will be create
RUN mkdir /current

# Create the app dir
RUN mkdir /app

# use changes to package.json to force Docker not to use the cache
# when we change our application's nodejs dependencies:
ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN cp -a /tmp/node_modules /app-tmp

ADD bower.json /tmp/bower.json
RUN cd /tmp && bower install --allow-root
RUN cp -a /tmp/bower_components /app-tmp

# Add the app to app-tmp
ADD . /app-tmp

# Set tmp as workdir
WORKDIR /app-tmp

# Build the app
RUN ember build --environment $EMBER_ENV

# Move the compiled folder
RUN cp -r dist/* /app

# Set the compiled app as workdir
WORKDIR /app

# Remove temporary folder
RUN rm -rf /app-tmp

# Add the ssl certificates
ADD ./certs/ /certs

# Start nginx
CMD ["/bin/bash", "/start.sh"]
