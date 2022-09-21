const path = require('path');

module.exports = {
  entry: {
    index: './app.js'
  },
  output: {
    filename: 'app.bundle.js',
    path: path.resolve('../../../static/js'),
    clean: true,
  },
  module: {
    rules: [
        {
            test: /\.css$/,
            use: [ 'style-loader', 'css-loader' ]
        }
    ]
  }
};