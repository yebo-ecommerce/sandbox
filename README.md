# Ember-vivre

This README outlines the details of collaborating on this Ember application.
A short introduction of this app could easily go here.

## Start new App
* docker-compose up
* docker-compose run sample ember init
* sudo chown -R $USER:$USER sample

## Installation

* git clone git@github.com:azclick/yebo-ember.git ../yebo-ember
* git clone git@github.com:azclick/yebo-sdk.git ../yebo-sdk
* ln -s ../yebo-ember/packages/core node_modules/yebo-ember-core
* ln -s ../yebo-ember/packages/checkouts node_modules/yebo-ember-checkouts
* ln -s ../yebo_sdk bower_components/yebo_sdk
* docker-compose build
* docker-compose run sample npm install
* docker-compose run sample bower install --allow-root

## Running / Development

* docker-compose up
* Visit your app at [http://localhost:4200](http://localhost:4200).

### Code Generators

Make use of the many generators for code, try `ember help generate` for more details

### Running Tests

* docker-compose run sample ember test
* docker-compose run sample ember test --server

### Building

* docker-compose run sample ember build
* docker-compose run sample ember build --environment production

### Deploying

Specify what it takes to deploy your app.

## Further Reading / Useful Links

* [ember.js](http://emberjs.com/)
* [ember-cli](http://www.ember-cli.com/)
* Development Browser Extensions
  * [ember inspector for chrome](https://chrome.google.com/webstore/detail/ember-inspector/bmdblncegkenkacieihfhpjfppoconhi)
