<template>
  <div class="schedules">
    <h1>スケジュールリスト</h1>
    <div class="row">
      <div class="col m6 offset-m3">
        <ul class="collection" v-for="s in schedules" :key="s.id">
          <li class="collection-item"><router-link :to="{ name: 'schedule', params: { id_hash: s.id_hash} }">year: {{s.year}} / month: {{s.month}} / title: {{s.title}}</router-link></li>
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
