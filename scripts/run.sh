#!/bin/bash

docker run --rm -ti \
  -e EMBER_ENV=development \
  -w /current \
  -v $(pwd):/current \
  -v $(pwd)/../yebo-ember/packages/auth:/tmp/node_modules/yebo-ember-auth \
  -v $(pwd)/../yebo-ember/packages/checkouts:/tmp/node_modules/yebo-ember-checkouts \
  -v $(pwd)/../yebo-ember/packages/core:/tmp/node_modules/yebo-ember-core \
  -v $(pwd)/../yebo-ember/packages/storefront:/tmp/node_modules/yebo-ember-storefront \
  -v $(pwd)/../yebo_sdk:/tmp/bower_packages/yebo_sdk \
  -p 4200:4200 -p 49152:49152 -p 80:80 \
  sandbox scripts/inside-container.sh $1
