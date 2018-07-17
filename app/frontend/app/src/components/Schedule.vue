<template>
  <div class="schedule">
    <div class="row">
      <div class="col s6 offset-s3">
        <h1>スケジュール</h1>
        <div class="">
          <form class="" action="index.html" method="post">
            <label for="fullPath">コピーして共有</label>
            <input ref="fullPathForm" type="text" name="fullPath" :value="url + $route.fullPath" @click="$refs.fullPathForm.select()">
          </form>
        </div>
        <div class="row">
          <div class="col s2">タイトル:</div>
          <div class="col s8"><h3>{{schedule.title}}</h3></div>
        </div>
        <div class="row">
          <div class="col s2">説明:</div>
          <div class="col s8">{{schedule.description}}</div>
        </div>
        <div class="row">
          <div>
            <h4>{{schedule.year}}年 / {{schedule.month}}月</h4>
          </div>
          <div v-for="(content, index) in schedule.contents" :key="index">
            <div class="content col s1">{{(index + 1)}}日 / {{content.text || '未定'}}</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Schedule',
  data () {
    return {
      url: location.origin
    }
  },
  computed: {
    schedule: function () {
      return this.$store.state.schedule.schedule
    }
  },
  watch: {
    schedule: function () {
      if (this.schedule === null) {
        this.$router.push('/schedules')
      }
    }
  },
  created () {
    this.$store.dispatch('schedule/getSchedule', this.$route.params.id_hash)
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.content {
  background: #C0FFEE;
  border-radius: 50%;
  -moz-border-radius: 50%;
  -webkit-border-radius: 50%;
}
</style>
