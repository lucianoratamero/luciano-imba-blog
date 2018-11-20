const HtmlWebpackPlugin = require('html-webpack-plugin')

module.exports = {
  mode: 'development',
  module: {
    rules: [
      {
        test: /\.imba$/,
        loader: 'imba/loader',
      },
      {
        test: /\.scss$/,
        use: [
          'style-loader',
          'css-loader',
          'sass-loader'
        ]
      }
    ]
  },
  resolve: {
    extensions: ['.imba', '.js', '.json', '.scss']
  },
  plugins: [ new HtmlWebpackPlugin({
    title: 'luciano@ratamero.com - olá Marilene!'
  }) ],
  entry: __dirname + '/src/App.imba',
  output: { path: __dirname + '/dist', filename: 'app.js' }
};
