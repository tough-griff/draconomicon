'use-strict';

var path = require('path');
var webpack = require('webpack');

module.exports = {
  // The base path which will be used to resolve entry points.
  context: __dirname,

  // The main entry point(s) for our application's frontend JS.
  entry: {
    app: [
      'webpack-dev-server/client?http://localhost:8080',
      'webpack/hot/only-dev-server',
      './js/index.js'
    ]
  },

  output: {
    // This is our app/assets/javascripts directory, which is part of the
    // Sprockets pipeline.
    path: path.join(__dirname, 'app', 'assets', 'javascripts'),
    // The filename of the compiled bundle. [name] refers to the entry point
    // being bundled.
    // e.g. app/assets/javascripts/app_bundle.js.
    filename: '[name].bundle.js',
    // Path used by webpack-dev-server.
    publicPath: 'http://localhost:8080/javascripts/'
  },

  module: {
    preLoaders: [
      {
        loader: 'eslint',
        test: /\.jsx?$/,
        exclude: /node_modules/
      }
    ],
    loaders: [
      {
        loader: 'babel',
        test: /\.jsx?$/,
        exclude: /node_modules/,
        query: {
          optional: ['runtime'],
          stage: 0
        }
      }
    ],
    postLoaders: [
      {
        loader: 'react-hot',
        test: /\.jsx?$/,
        exclude: /node_modules/
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
  },

  plugins: [
    new webpack.HotModuleReplacementPlugin(),
    new webpack.NoErrorsPlugin()
  ]
};
