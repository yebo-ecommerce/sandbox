#!/bin/bash

echo '-----> Remove links'
rm -rf node_modules/yebo-ember-core
rm -rf node_modules/yebo-ember-checkouts
rm -rf node_modules/yebo-ember-auth
rm -rf node_modules/yebo-ember-storefront
rm -rf bower_components/yebo_sdk

echo '-----> Create links'
ln -s ../vendor/modules/yebo-ember/packages/core node_modules/yebo-ember-core
ln -s ../vendor/modules/yebo-ember/packages/checkouts node_modules/yebo-ember-checkouts
ln -s ../vendor/modules/yebo-ember/packages/auth node_modules/yebo-ember-auth
ln -s ../vendor/modules/yebo-ember/packages/storefront node_modules/yebo-ember-storefront
ln -s ../vendor/modules/yebo_sdk bower_components/yebo_sdk

echo "-----> start ember"
ember server --watcher polling --proxy http://zerotreze.lvh.me
