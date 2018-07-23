<template>
  <div id="app">
    <div id="nav">
      <router-link to="/"><button class="waves-effect waves-light btn" type="button" name="button">一覧</button></router-link>
    </div>
    <router-view/>
    <div v-if="$route.path !== '/schedules/new'" class="fixed-action-btn">
      <router-link to="/schedules/new">
        <a class="btn-floating btn-large red">
          <i class="large material-icons">mode_edit</i>
        </a>
      </router-link>
    </div>
  </div>
</template>
<script>
export default {
  name: 'App'
}
</script>
<style>
@import url('https://fonts.googleapis.com/icon?family=Material+Icons');

#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
#nav {
  padding-top: 20px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
