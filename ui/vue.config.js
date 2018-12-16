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
