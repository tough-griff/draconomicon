var Flash = React.createClass({
  // === Render ===
  render: function() {
    var classes = 'flash ' + this.props.type;
    return (
      <div className={classes} role="alertdialog" onClick={this.props.clickHandler}>
        <span className="flash-close" role="button" aria-hidden="true">
          &times;
        </span>
        {this.props.children}
      </div>
    );
  }
});
