<template>
  <div id="app">
  <md-menu>
  <md-button md-menu-trigger>Bottom Right</md-button>

  <md-menu-content>
    <md-menu-item>My Item 1</md-menu-item>
    <md-menu-item>My Item 2</md-menu-item>
    <md-menu-item>My Item 3</md-menu-item>
  </md-menu-content>
</md-menu>

<md-menu md-direction="bottom left">
  <md-button md-menu-trigger>Bottom Left</md-button>

  <md-menu-content>
    <md-menu-item>My Item 1</md-menu-item>
    <md-menu-item>My Item 2</md-menu-item>
    <md-menu-item disabled>My Item 3</md-menu-item>
    <md-menu-item>My Item 4</md-menu-item>
  </md-menu-content>
</md-menu>

<md-menu md-direction="top left">
  <md-button md-menu-trigger>Top Left</md-button>

  <md-menu-content>
    <md-menu-item>My Item 1</md-menu-item>
    <md-menu-item>My Item 2</md-menu-item>
    <md-menu-item>My Item 3</md-menu-item>
  </md-menu-content>
</md-menu>

<md-menu md-direction="top right">
  <md-button md-menu-trigger>Top Right</md-button>

  <md-menu-content>
    <md-menu-item>My Item 1</md-menu-item>
    <md-menu-item>My Item 2</md-menu-item>
    <md-menu-item>My Item 3</md-menu-item>
  </md-menu-content>
</md-menu>
</br>
</br>
    <router-view></router-view>
  </div>
</template>

<script>
export default {
  name: 'app'
}
</script>

<style>

</style>
