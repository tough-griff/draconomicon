var path = require('path');
var webpack = require('webpack');

var config = module.exports = {
  // The base path which will be used to resolve entry points.
  context: __dirname,
  // The main entry point for our application's frontend JS.
  entry: './js/entry.js',

  output: {
    // This is our app/assets/javascripts directory, which is part of the
    // Sprockets pipeline.
    path: path.join(__dirname, 'app', 'assets', 'javascripts'),
    // The filename of the compiled bundle,
    // e.g. app/assets/javascripts/webpack-bundle.js.
    filename: 'webpack-bundle.js',
    // If the webpack code-splitting feature is enabled, this is the path it'll
    //  use to download bundles.
    publicPath: '/webpack-assets'
  },

  resolve: {
    // Tell webpack which extensions to auto search when it resolves modules. With
    //  this, you'll be able to do `require('./utils')` instead of
    // `require('./utils.js')`.
    extensions: ['', '.js', '.jsx'],
    // By default, webpack will search in `web_modules` and `node_modules`.
    modulesDirectories: ['node_modules']
  },

  module: {
    loaders: [
      { test: /\.jsx?$/, exclude: /node_modules/, loader: 'babel' },
    ]
  }
};
