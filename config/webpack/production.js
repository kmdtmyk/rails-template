process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment')

environment.config.optimization.minimizer[0].options.terserOptions.compress.drop_console = true

module.exports = environment.toWebpackConfig()
