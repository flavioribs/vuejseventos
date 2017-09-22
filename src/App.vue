<template>
  <div id="app">
     <div class="phone-viewport">
    <md-toolbar>
        <md-button class="md-icon-button" @click="toggleLeftSidenav">
          <md-icon>menu</md-icon>
        </md-button>  

        <h2 class="md-title">Eventos APP</h2>
    </md-toolbar>
 
    <md-sidenav class="md-left" ref="leftSidenav" @open="open('Left')" @close="close('Left')">
      <md-toolbar class="md-large">
        <div class="md-toolbar-container">
          <h3 class="md-title">Menu</h3>
        </div>
      </md-toolbar>

       <p>Login</p>
       <p>Novo Evento</p>
       <p>Cadastrar</p>
    </md-sidenav>
    </md-sidenav>
  </div>
  </br>
  </br>
  </br>
    <router-view></router-view>
  </div>
</template>

<script>
export default {
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
    }
  }
}
</script>

<style>

</style>
