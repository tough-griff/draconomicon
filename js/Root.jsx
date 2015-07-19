import React, { Component } from 'react';
import { Router, Route } from 'react-router';
import { history } from 'react-router/lib/BrowserHistory';

import { App } from './containers';
import { About, Home } from './views';

export default class Root extends Component {
  render() {
    return (
      <Router history={history}>
        <Route component={App}>
          <Route path="/" component={Home} />
          <Route path="/about" component={About} />
        </Route>
      </Router>
    );
  }
}
