const { environment } = require('@rails/webpacker')

const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')
const pug = require('./loaders/pug')

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
environment.loaders.prepend('pug', pug)

const path = require('path')

environment.config.merge({
  resolve: {
    alias: {
      '~': path.resolve(__dirname, '../../app/javascript/packs'),
    },
  },
})

module.exports = environment
