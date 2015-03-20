var Flashes = React.createClass({
  propTypes: {
    initialFlashes: React.PropTypes.array
  },

  getInitialState: function() {
    return { flashes: this.props.initialFlashes };
  },

  componentDidMount: function() {
    // Bind event handlers for adding and removing flashes.
    // @see Draconomicon.Flashes
    $(window).on('add.flash', function(e, data) {
      this.addFlash(data.flashType, data.flashText);
    }.bind(this));

    $(window).on('remove.flash', function(e, data) {
      this.removeFlash(data.flashIndex);
    }.bind(this));
  },

  componentWillUnmount: function() {
    // Unbind event handlers from the flash namespace.
    $(window).off('.flash');
  },

  addFlash: function(type, text) {
    var newFlash = [type, text];
    var newFlashes = this.state.flashes.concat([newFlash]);
    this.setState({ flashes: newFlashes });
  },

  removeFlash: function(i) {
    var newFlashes = this.state.flashes;
    newFlashes.splice(i, 1);
    this.setState({ flashes: newFlashes });
  },

  render: function() {
    var flashes = this.state.flashes.map(function(flash, i) {
      var type = flash[0];
      var text = flash[1];
      var classes = 'flash ' + type;

      return (
        <div key={i} className={classes} role="alertdialog"
          onClick={this.removeFlash.bind(this, i)}>
          <span className="flash-close" role="button" aria-hidden="true">
            &times;
          </span>
          {text}
        </div>
      );
    }.bind(this));

    return (
      <React.addons.CSSTransitionGroup component="div" className="flashes"
        transitionName="fade" transitionAppear={true}>
        {flashes}
      </React.addons.CSSTransitionGroup>
    );
  }
});
