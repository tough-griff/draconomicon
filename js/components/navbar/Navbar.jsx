import React, { Component, PropTypes } from 'react';
import { Link } from 'react-router';

import Icon from '../Icon';

export default class Navbar extends Component {
  static propTypes = {
    currentUser: PropTypes.object
  }

  renderUserSection() {
    const { currentUser } = this.props;

    if (!currentUser) {
      return (
        <li><Link to="/sign_in">Sign in</Link></li>
      );
    }

    return (
      <li className="more">
        <Link to={currentUser.path}>{currentUser.name}</Link>
        {/* TODO: finish me! */}
      </li>
    );
  }

  render() {
    return (
      <nav className="navbar" role="navigation">
        <div className="navbar-container">
          <a className="navbar-menu-button">
            <Icon type="bars" />
          </a>
          <ul className="navbar-toggle">
            <li><Link to="/">Home</Link></li>
            <li><Link to="/about">About</Link></li>
            <li><Link to="/contact">Contact</Link></li>
            <ul className="navbar-right">
              <li><Link to="/users">Users</Link></li>
              {this.renderUserSection()}
            </ul>
          </ul>
        </div>
      </nav>
    );
  }
}
