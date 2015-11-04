import Ember from 'ember';
import config from './config/environment';

// This line imports the Yebo Router.
import yeboRouter from 'yebo-ember-storefront/router';
import yeboAuthRouter from 'yebo-ember-auth/router';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  yeboRouter(this, config),
  yeboAuthRouter(this, config)
});

export default Router;
