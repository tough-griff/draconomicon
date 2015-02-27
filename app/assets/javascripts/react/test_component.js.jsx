var TestComponent = React.createClass({
  render: function() {
    return (
      <div className="test-component">
        {this.props.text}
      </div>
    );
  }
});
