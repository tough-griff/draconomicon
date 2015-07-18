'use-strict';

var path = require('path');
var webpack = require('webpack');

module.exports = {
  // The base path which will be used to resolve entry points.
  context: __dirname(),

  // The main entry point(s) for our application's frontend JS.
  entry: {
    app: './js/index.js'
  },

  output: {
    // This is our app/assets/javascripts directory, which is part of the
    // Sprockets pipeline.
    path: path.join(__dirname(), 'app', 'assets', 'javascripts'),
    // The filename of the compiled bundle. [name] refers to the entry point
    // being bundled.
    // e.g. app/assets/javascripts/app_bundle.js.
    filename: '[name].bundle.js'
  },

  module: {
    loaders: [
      // babel-loader
      {
        loader: 'babel',
        // Run babel on every .js and .jsx file.
        test: /\.jsx?$/,
        // Exclude any libraries from npm or bower.
        exclude: /node_modules/,
        query: {
          // The babel-runtime module prevents injecting helpers into each file.
          optional: ['runtime']
          // Stage 0 allows ES7 features
          stage: 0
        }
      }
    ]
  },

  resolve: {
    // Tell webpack which extensions to auto search when it resolves modules.
    // With this, you'll be able to do `require('./utils')` instead of
    // `require('./utils.js')`.
    extensions: ['', '.js', '.jsx'],
    // By default, webpack will search in `web_modules` and `node_modules`.
    modulesDirectories: ['node_modules']
  }
};
