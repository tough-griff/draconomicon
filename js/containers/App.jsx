import React, { Component, PropTypes } from 'react';

import Navbar from '../components/Navbar';

export default class App extends Component {
  static propTypes = {
    children: PropTypes.node
  }

  render() {
    return (
      <div>
        <Navbar />
        <div className="container">
          {this.props.children}
        </div>
      </div>
    );
  }
}
