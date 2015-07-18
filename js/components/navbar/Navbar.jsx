import React, { Component } from 'react';

import Icon from '../Icon';

export default class Navbar extends Component {
  renderMenuButton() {
    return (
      <a className="navbar-menu-button">
        <Icon type="bars" />
      </a>
    );
  }

  renderNavList() {
    return (
      <ul className="navbar-toggle show">
        {/* TODO: Populate me with links after nesting in router */}
      </ul>
    );
  }

  render() {
    return (
      <nav className="navbar" role="navigation">
        <div className="navbar-container">
          {this.renderMenuButton()}
          {this.renderNavList()}
        </div>
      </nav>
    );
  }
}
