// TODO Move this into Draconomicon global namespace
var DraconomiconFlashes = {};

var Flashes = React.createClass({
  propTypes: {
    flashes: React.PropTypes.array
  },

  getInitialState: function() {
    return { flashes: this.props.flashes };
  },

  // Bind add and remove actions the global DraconomiconFlashes object.
  // This allows flashes to be presented and removed externally through
  // javascript.
  componentDidMount: function() {
    DraconomiconFlashes.add = this.addFlash;
    DraconomiconFlashes.remove = this.removeFlash;
  },

  // Remove add and remove actions from the global DraconomiconFlashes object.
  componentWillUnmount: function() {
    delete DraconomiconFlashes.add;
    delete DraconomiconFlashes.remove;
  },

  addFlash: function(flash) {
    var flashes = this.state.flashes.concat([flash]);
    this.setState({ flashes: flashes });
  },

  removeFlash: function(i) {
    var flashes = this.state.flashes;
    flashes.splice(i, 1);
    this.setState({ flashes: flashes });
  },

  render: function() {
    var flashes = this.state.flashes.map(function(flash, i) {
      var type = flash[0];
      var text = flash[1];
      var classes = 'flash ' + type;

      return (
        <div key={type} className={classes} role="alertdialog"
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
