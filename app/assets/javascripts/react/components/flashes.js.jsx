var Flashes = React.createClass({
  propTypes: {
    initialFlashes: React.PropTypes.objectOf(React.PropTypes.string)
  },

  getInitialState: function() {
    return { flashes: this.props.initialFlashes };
  },

  getDefaultProps: function() {
    return { intialFlashes: {} };
  },

  // === Lifecycle Hooks ===
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
    var newFlashes = this.state.flashes;
    newFlashes[key] = text;
    this.setState({ flashes: newFlashes });
  },

  removeFlash: function(key) {
    var newFlashes = this.state.flashes;
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
