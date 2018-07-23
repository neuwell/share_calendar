<template>
  <div class="schedule">
    <div class="row">
      <div class="col s12 m6 offset-m3">
        <section>
          <h1>スケジュール</h1>
          <div class="">
            <form class="" action="index.html" method="post">
              <label for="fullPath">コピーして共有</label>
              <input ref="fullPathForm" type="text" name="fullPath" :value="url + $route.fullPath" @click="$refs.fullPathForm.select()">
            </form>
          </div>
          <div class="row">
            <div class="col m2">タイトル:</div>
            <div class="col m8"><h3>{{schedule.title}}</h3></div>
          </div>
          <div class="row">
            <div class="col m2">どんな予定？:</div>
            <div class="col m8">{{schedule.description}}</div>
          </div>
          <div class="row">
            <div>
              <h4>{{schedule.year}}年 / {{schedule.month}}月</h4>
            </div>
          </div>
        </section>
        <!-- カレンダ -->
        <section>
          <div class="row calendar-row">
            <div class="calendar-col day-of-the-month" v-for="(dayOfTheWeek, index) in dayOfTheWeek" :key="index">
              {{dayOfTheWeek}}
            </div>
          </div>
          <div class="row">
            <div class="row calendar-row" v-for="block in calendar.blocks" :key="block.id">
              <div class="calendar-col day-item" v-for="item in block" :key="item.id">
                <div v-if="schedule.month === item.month" class="">
                  {{item.day}}
                  <div v-if="scheduleItem.date == item.day" v-for="(scheduleItem, index) in schedule_items" :key="index">
                    {{scheduleItem.memo}}
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Schedule',
  data () {
    return {
      url: location.origin,
      dayOfTheWeek: ['日', '月', '火', '水', '木', '金', '土'],
      calendar: {
        blocks: []
      }
    }
  },
  computed: {
    schedule: function () {
      return this.$store.state.schedule.schedule.schedule || {}
    },
    schedule_items: function () {
      return this.$store.state.schedule.schedule.schedule_items || {}
    }
  },
  watch: {
    schedule: function () {
      if (this.schedule === null) {
        this.$router.push('/schedules')
      }

      this.renderCalendar(this.schedule.year, this.schedule.month)
    }
  },
  created () {
    this.$store.dispatch('schedule/getSchedule', this.$route.params.id_hash)
  },
  methods: {
    renderCalendar: function (year, month) {
      let startDayOfCalendar = this.$moment(year + '-' + month).startOf('month').startOf('week')
      let block = []
      this.calendar.blocks = []
      for (var i = 0; i < 42; i++) {
        let targetDate = startDayOfCalendar
        let item = {
          'id': i + 1,
          'isToday': false,
          'year': targetDate.format('YYYY'),
          'month': targetDate.format('MM'),
          'day': targetDate.format('D'),
          'date': targetDate.format('YYYY') + '-' + targetDate.format('MM') + '-' + targetDate.format('DD')
        }

        if (item.year + '-' + item.month + '-' + item.day === this.today) {
          item.isToday = true
        }

        block.push(item)
        if (i !== 0 && (i + 1) % 7 === 0) {
          this.calendar.blocks.push(block)
          block = []
          item = {}
        }
        startDayOfCalendar.add(1, 'days')
      }
    }
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
.calendar-row {
  display: flex;
  justify-content: center;
  align-items: center;
}

.calendar-col {
  width: 14%;
  margin: 2px;
  height: 64px;
}

.day-of-the-month {
  background-color: #C0FFEE;
  height: auto;
}

.day-item {
  background-color: rgba(0,0,0,0.1);
  overflow: hidden;
}

</style>
