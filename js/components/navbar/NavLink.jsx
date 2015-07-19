import React, { Component, PropTypes } from 'react';
import { Link } from 'react-router';

export default class NavLink extends Component {
  static propTypes = {
    children: PropTypes.string,
    to: PropTypes.string.isRequired
  }

  render() {
    const { children, to } = this.props;
    // TODO
    const classes = '';

    return (
      <li className={classes}>
        <Link to={to}>
          {children}
        </Link>
      </li>
    );
  }
}
