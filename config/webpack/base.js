const { webpackConfig, merge } = require('@rails/webpacker')

const customConfig = {
  module: {
    rules: [
      {
        test: /\.erb$/,
        enforce: 'pre',
        loader: 'rails-erb-loader',
      },
    ],
  },
  resolve: {
    extensions: [
      '.css',
      '.erb',
      '.sass',
    ],
  },
}

module.exports = merge(webpackConfig, customConfig)
