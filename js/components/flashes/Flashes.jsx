// TODO refactor to Reflux & ES6/7
import _ from 'lodash';
import $ from 'jquery';
import React from 'react/addons';

import Flash from './flash';
const Flashes = React.createClass({
  propTypes: {
    initialFlashes: React.PropTypes.objectOf(React.PropTypes.string)
  },

  // === Lifecycle Hooks ===
  getDefaultProps() {
    return { initialFlashes: {} };
  },

  getInitialState() {
    return { flashes: _.clone(this.props.initialFlashes) };
  },

  componentDidMount() {
    // Bind event handlers for adding and removing flashes.
    // @see Draconomicon.Flashes
    $(window).on('add.flash', (e, data) => {
      this.addFlash(data.flashKey, data.flashText);
    });

    $(window).on('remove.flash', (e, data) => {
      this.removeFlash(data.flashKey);
    });
  },

  componentWillUnmount() {
    // Unbind event handlers from the .flash namespace.
    $(window).off('.flash');
  },

  // === Render ===
  render() {
    const flashes = _.map(this.state.flashes, (text, key) => {
      return (
        <Flash key={key} type={key} clickHandler={this.removeFlash.bind(this, key)}>
          {text}
        </Flash>
      );
    }.bind(this));

    return (
      <React.addons.CSSTransitionGroup component="div" className="flashes" transitionName="fade" transitionAppear={true}>
        {flashes}
      </React.addons.CSSTransitionGroup>
    );
  },

  // === Actions ===
  addFlash(key, text) {
    const newFlashes = _.clone(this.state.flashes);

    // TODO: pulse when adding a flash with an existing key.
    if (newFlashes[key]) {
      console.warn('Flash "' + key + '" already exists.');
      return;
    }

    newFlashes[key] = text;
    this.setState({ flashes: newFlashes });
  },

  removeFlash(key) {
    const newFlashes = _.clone(this.state.flashes);
    delete newFlashes[key];
    this.setState({ flashes: newFlashes });
  }
});

export default Flashes;
