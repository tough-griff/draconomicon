var webpack = require('webpack');
var path = require('path');

module.exports = {
  // The base path which will be used to resolve entry points.
  context: process.cwd(),

  // The main entry point(s) for our application's frontend JS.
  entry: {
    app: [
      'webpack-dev-server/client?http://localhost:8080',
      'webpack/hot/only-dev-server',
      './js/_app.js'
    ]
  },

  output: {
    // This is our app/assets/javascripts directory, which is part of the
    // Sprockets pipeline.
    path: path.join(process.cwd(), 'app', 'assets', 'javascripts'),
    // The filename of the compiled bundle. [name] refers to the entry point
    // being bundled.
    // e.g. app/assets/javascripts/app_bundle.js.
    filename: '[name].bundle.js',
    // Path used by webpack-dev-server.
    publicPath: 'http://localhost:8080/assets/'
  },

  module: {
    loaders: [
      // babel-loader
      {
        loaders: ['react-hot', 'babel'],
        // Run babel on every .js and .jsx file.
        test: /\.jsx?$/,
        // Exclude any libraries from npm or bower.
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
