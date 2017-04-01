const path = require('path')
const webpack = require('webpack')
const HtmlwebpackPlugin = require('html-webpack-plugin')
// const CopyWebpackPlugin = require('copy-webpack-plugin')

const isProd = process.env.NODE_ENV === 'prod'
const buildEnv = isProd ? 'prod' : 'dev'

const config = {
  context: path.resolve(__dirname),
  entry: {
    index: './src/js/index.js',
    style: './src/scss/style.scss'
  },
  output: {
    path: path.resolve(__dirname, 'dist', buildEnv),
    filename: '[name].js'
  },
  module: {
    rules: [{
      test: /\.js$/,
      exclude: /node_modules/,
      loader: 'babel-loader'
    }, {
      test: /\.tag$/,
      exclude: /node_modules/,
      loader: 'riot-tag-loader',
      query: { type: 'es6', hot: true, debug: true }
    }, {
      test: /\.(js|tag)$/,
      exclude: /node_modules/,
      loaders: 'eslint-loader'
    }, {
      test: /\.scss$/,
      loaders: ['style-loader', 'css-loader', 'sass-loader']
    }, {
      test: /\.(jpe?g|png|svg|gif|ico)$/,
      loader: 'file-loader?name=[path][name].[ext]'
    }]
  },
  resolve: {
    extensions: ['.js', '.min.js', '.tag', '.scss', '.css']
  },
  plugins: [
    new webpack.ProvidePlugin({
      riot: 'riot',
      route: 'riot-route/lib/tag',
      $: 'jquery',
      jQuery: 'jquery'
    }),
    new HtmlwebpackPlugin({
      template: './src/index.html'
    }),
    // new CopyWebpackPlugin([
    //   { from: './src/img', to: 'img' },
    //   { from: './vendor', to: 'vendor' }
    // ]),
    new webpack.DefinePlugin({
      BUILD_ENV: JSON.stringify(buildEnv),
    })
  ],
  devServer: {
    contentBase: path.join(__dirname, 'dist'),
    compress: true,
    port: 8080
  }
}

// Setting for only production
if (isProd) {
  config.plugins.push(new webpack.optimize.UglifyJsPlugin({
    compress: { warnings: false }
  }))
}

module.exports = config
