const { environment } = require('@rails/webpacker')

module.exports = environment

// Adds jQuery
// https://stackoverflow.com/a/56151033
// TODO: maybe just rewrite old code to not use jQuery anymore
const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
  })
)