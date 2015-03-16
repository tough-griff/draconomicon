var Flashes = React.createClass({
  propTypes: {
    flashes: React.PropTypes.array
  },

  render: function() {
    return (
      <div className="flashes" id="notifications">
        {this.props.flashes.map(function(flash) {
          return <Flash key={flash[0]} type={flash[0]} text={flash[1]} />;
        }.bind(this))}
      </div>
    );
  }
});

// FIXME the element is still present, albeit invisible
var Flash = React.createClass({
  propTypes: {
    type: React.PropTypes.string,
    text: React.PropTypes.string
  },

  getInitialState: function() {
    return { classes: "flash " + this.props.type + " fade-in" };
  },

  hide: function() {
    this.setState({ classes: "flash " + this.props.type + " fade-out" })
  },

  render: function() {
    return (
      <div className={this.state.classes} role="alertdialog" onClick={this.hide}>
        <span className="flash-close" role="button" aria-hidden="true">
          &times;
        </span>
        {this.props.text}
      </div>
    );
  }
});
