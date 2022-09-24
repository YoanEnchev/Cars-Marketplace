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
            test: /\.css|\.scss$/,
            use: [
              // Creates `style` nodes from JS imports of css files
              'style-loader',

              // Translates CSS into CommonJS
              'css-loader',

              // Compiles Sass to CSS
              'sass-loader'
            ]
        }
    ]
  }
};