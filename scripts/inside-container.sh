#!/bin/bash

echo "-----> Copy modules"
ln -s /tmp/node_modules /current/node_modules
ln -s /tmp/bower_components /current/bower_components

echo "-----> Running"
if [ -f "scripts/$1.sh" ]; then
  sh scripts/$1.sh
else
  $1
fi

echo '-----> Remove copied folders'
rm /current/node_modules
rm /current/bower_components

echo '-----> Remove generated files'
rm -rf /current/tmp
rm -rf /current/dist
