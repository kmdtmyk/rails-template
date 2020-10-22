process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment')

// sourcemapを無効にする
environment.config.devtool = false

// console.logを消す
environment.config.optimization.minimizer[0].options.terserOptions.compress.drop_console = true

module.exports = environment.toWebpackConfig()
