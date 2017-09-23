<template>
  <div id="app">
     <div class="phone-viewport">
    <md-toolbar>
        <md-button class="md-icon-button" @click="toggleLeftSidenav">
          <md-icon>menu</md-icon>
        </md-button>    

        <h2 class="md-title">Eventos APP</h2>
    </md-toolbar>
    <div>
        <h4>Bem vindo {{this.conf.userLogged}}</h4>    
    </div>
    <md-sidenav class="md-left" ref="leftSidenav" @open="open('Left')" @close="close('Left')">
      <md-toolbar class="md-large">
        <div class="md-toolbar-container">
          <h3 class="md-title">Menu</h3>
        </div>
      </md-toolbar>            
      <div class="phone-viewport">
            <md-list>
              <md-list-item v-show="!conf.logado">
                <md-icon>lock</md-icon> <span  @close="close('Left')"><router-link class="btn btn-primary" :to="{name: 'Login'}">Login</router-link></span>
              </md-list-item>

               <md-list-item @close="close('Left')">
                <md-icon>supervisor_account</md-icon> <span><router-link class="btn btn-primary" :to="{name: 'Eventos'}">Eventos</router-link></span>
              </md-list-item>

              <md-list-item v-show="conf.logado">
                <md-icon>add_box</md-icon> <span><router-link class="btn btn-primary" :to="{name: 'NovoEvento'}">Novo Evento</router-link></span>
              </md-list-item>

              <md-list-item v-show="conf.logado">
                <md-icon>exit_to_app</md-icon> <span v-on:click="exitApp()">Sair</span>
                <md-divider class="md-inset"></md-divider>
              </md-list-item>
            </md-list>
      </div>
    </md-sidenav>
  </div>
  </br>
  </br>
  </br>
    <router-view></router-view>
  </div>
</template>

<script>

import event from './helpers/event';
import SessionStorage from './services/session-storage';
import mytoastHelper from './helpers/toastHelper';
import GlobalKeys from './helpers/constVariables'

export default {
  data(){
      return{
         conf:{
            logado : false,
            userLogged : 'Visitante'                
         }
      }
  },
  name: 'app', 
  methods: {
    toggleLeftSidenav() {
      this.$refs.leftSidenav.toggle();
    },
    open(ref) {
      console.log('Opened: ' + ref);
    },
    close(ref) {
      console.log('Closed: ' + ref);
    },
    userLogged(){       
        let xuser = SessionStorage.userLogged();
        if(xuser){
          console.log(xuser);
           const user = SessionStorage.getObject('appeventosuserlogged');
           this.conf.logado = true;
           this.conf.userLogged = user.name;
        }else{
          this.conf.logado = false;
        }
    },
    exitApp(){
      SessionStorage.remove(GlobalKeys.getKeyToken());
      SessionStorage.remove(GlobalKeys.getKeyUser());
      this.conf.logado = false;
      mytoastHelper.newToast('Até a próxima!.', 'success', 'tag_faces'); 
      this.$router.push({name: 'Login'});  
    }
  },
  updated()
  {
    this.userLogged();
  },
  created(){
    this.userLogged();
  }
}
</script>

<style>

</style>
