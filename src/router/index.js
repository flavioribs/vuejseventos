import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/components/Login'
import Eventos from '@/components/Eventos'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Eventos',
      component: Eventos
    },    
      {
        path: '/Login',
        name: 'Login',
        component: Login
      }
  ]
})
