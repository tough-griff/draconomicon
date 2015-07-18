// TODO refactor to Reflux & ES6/7
import React from 'react/addons';

const Flash = React.createClass({
  propTypes: {
    type: React.PropTypes.string.isRequired,
    children: React.PropTypes.string.isRequired,

    // Callbacks
    clickHandler: React.PropTypes.func.isRequired
  },

  mixins: [React.PureRenderMixin],

  // === Render ===
  render() {
    const classes = 'flash ' + this.props.type;
    return (
      <div className={classes} role="alertdialog" onClick={this.props.clickHandler}>
        <span className="flash-close" role="button" aria-hidden={true}>
          &times;
        </span>

        <span className="flash-text">
          {this.props.children}
        </span>
      </div>
    );
  }
});

export default Flash;
