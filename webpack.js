'use-strict';

var webpack = require('webpack');
var WebpackDevServer = require('webpack-dev-server');
var config = require('./webpack.hot.config')

var server = new WebpackDevServer(webpack(config), {
  filename: config.output.filename,
  publicPath: config.output.publicPath,
  hot: true,
  historyApiFallback: true,
  stats: { colors: true }
});
server.listen(8080, 'localhost', function(err) {
  if (err) console.log(err);

  console.log('Listening at localhost:8080');
});
