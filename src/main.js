import Vue from 'vue'
import VueMaterial from 'vue-material'
import 'vue-material/dist/vue-material.css'

import Vue2Filters from 'vue2-filters'
import Toasted from 'vue-toasted';

import App from './App'
import router from './router'

Vue.use(VueMaterial)
Vue.use(Vue2Filters)
Vue.use(Toasted)

Vue.material.registerTheme({
  default: {
    primary: {
      color: 'light-blue',
      hue: 700
    },
    accent: 'red'
  }
})

Vue.config.productionTip = false

new Vue({
  el: '#app',
  router,
  template: '<App/>',
  components: { App }
})
