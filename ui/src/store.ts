import Vue from 'vue'
import Vuex from 'vuex'

import Site from './modules/site'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    site: Site
  }
})
