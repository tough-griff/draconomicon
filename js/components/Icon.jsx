import React, { Component, PropTypes } from 'react';

export default class Icon extends Component {
  static propTypes = {
    children: PropTypes.node,
    type: PropTypes.string.isRequired
  }

  render() {
    const classes = `fa fa-${this.props.type}`;

    return (
      <i className={classes}>
        {this.props.children}
      </i>
    );
  }
}
