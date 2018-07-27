<template>
  <div class="schedules">
    <h1>スケジュールのリスト</h1>
    <div class="row">
      <div class="col s12 l6 offset-l3">
        <ul class="collection" v-for="s in schedules" :key="s.id">
          <li class="collection-item">
            <router-link :to="{ name: 'schedule', params: { id_hash: s.id_hash} }">{{s.year}}年{{s.month}}月:{{s.title}}</router-link>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Schedules',
  data () {
    return {
      // schedules: []
    }
  },
  computed: {
    schedules: function () {
      return this.$store.state.schedule.schedules
    }
  },
  created () {
    this.$store.dispatch('schedule/getSchedules')
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
