const path = require('path');

module.exports = {
  resolve: {
    extensions: ['.js', '.json', '.jsx', '.wasm'], // Add your extensions here.
  },
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
            test: /\.(css|scss)$/,
            use: [
              // Creates `style` nodes from JS imports of css files
              'style-loader',

              // Translates CSS into CommonJS
              'css-loader',

              // Compiles Sass to CSS
              'sass-loader'
            ]
        },
        {
          test: /\.(ts|js|jsx)?$/,
          loader: 'babel-loader',
          options: {
             presets: ['@babel/env', '@babel/preset-react']
          }
        }
    ]
  }
};