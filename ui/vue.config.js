const VuetifyLoaderPlugin = require('vuetify-loader/lib/plugin')

module.exports = {
  transpileDependencies: ['vuex-module-decorators'],
  devServer: {
    proxy: {
      '/api': {
        target: 'http://localhost:9292'
      }
    }
  }
}
