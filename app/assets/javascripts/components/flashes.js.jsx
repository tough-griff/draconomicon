var Flashes = React.createClass({
  propTypes: {
    initialFlashes: React.PropTypes.objectOf(React.PropTypes.string)
  },

  // === Lifecycle Hooks ===
  getDefaultProps: function() {
    return { initialFlashes: {} };
  },

  getInitialState: function() {
    return { flashes: _.clone(this.props.initialFlashes) };
  },

  componentDidMount: function() {
    // Bind event handlers for adding and removing flashes.
    // @see Draconomicon.Flashes
    $(window).on('add.flash', function(e, data) {
      this.addFlash(data.flashKey, data.flashText);
    }.bind(this));

    $(window).on('remove.flash', function(e, data) {
      this.removeFlash(data.flashKey);
    }.bind(this));
  },

  componentWillUnmount: function() {
    // Unbind event handlers from the .flash namespace.
    $(window).off('.flash');
  },

  // === Actions ===
  addFlash: function(key, text) {
    var newFlashes = _.clone(this.state.flashes);

    // TODO: pulse when adding a flash with an existing key.
    if (newFlashes[key]) {
      console.warn('Flash "' + key + '" already exists.');
      return;
    }

    newFlashes[key] = text;
    this.setState({ flashes: newFlashes });
  },

  removeFlash: function(key) {
    var newFlashes = _.clone(this.state.flashes);
    delete newFlashes[key];
    this.setState({ flashes: newFlashes });
  },

  // === Render ===
  render: function() {
    var flashes = _.map(this.state.flashes, function(text, key) {
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
  }
});
