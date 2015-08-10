import React, { Component, PropTypes } from 'react';
import { Link } from 'react-router';

import Icon from './Icon';

export default class Navbar extends Component {
  static propTypes = {
    currentUser: PropTypes.object
  }

  // TODO: stubbed for now.
  static defaultProps = {
    currentUser: {
      name: 'Griffin Yourick',
      path: 'users/tough-griff',
      admin: true
    }
  }

  // TODO: possibly move this to another nested menu?
  renderAdminLinks() {
    if (!this.props.currentUser.admin) return null;

    return [
      <li key={1} className="separator" />,
      <li key={2}><a href="/sidekiq">Sidekiq Console</a></li>,
      <li key={3}><a href="/pghero">Database Insights</a></li>
    ];
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
        <a>{currentUser.name}</a>
        <ul className="submenu">
          <li><Link to={currentUser.path}>Profile</Link></li>
          <li><Link to="/edit_profile">Edit profile</Link></li>
          {this.renderAdminLinks()}
          <li className="separator" />
          <li><Link to="/sign_out">Sign out</Link></li>
        </ul>
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
