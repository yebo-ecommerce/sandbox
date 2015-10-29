import Ember from 'ember';
import config from './config/environment';

// This line imports the Spree Router.
import yeboRouter from 'yebo-ember-storefront/router';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  yeboRouter(this, config);
});

export default Router;
