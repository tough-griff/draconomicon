import React, { Component, PropTypes } from 'react';

export default class NavLink extends Component {
  static propTypes = {
    children: PropTypes.string,
    href: PropTypes.string.isRequired
  }

  render() {
    const { children, href } = this.props;
    // TODO
    const classes = '';

    return (
      <li className={classes}>
        <a href={href}>
          {children}
        </a>
      </li>
    );
  }
}
