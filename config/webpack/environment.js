const { environment } = require('@rails/webpacker')

const path = require('path')

environment.config.merge({
  resolve: {
    alias: {
      './themes': path.resolve(__dirname, '../../app/javascript/semantic/dist/themes'),
      'semantic': path.resolve(__dirname, '../../app/javascript/semantic')
    }
  }
})


module.exports = environment
