<template>
  <div id="create-schedule" class="create-schedule ">
    <div class="row">
      <div class="col s12 m6 offset-m3">
        <h2>スケジュールをつくる</h2>
        <div class="row">
          <el-form ref="formInput" :model="formInput" :rules="rules" :label-position="'top'">
            <el-form-item label="タイトル" prop="title">
              <el-input v-model="formInput.title"  placeholder="ex.来月のアルバイトの日"></el-input>
            </el-form-item>
            <el-form-item label="どんな予定？" prop="description">
              <el-input type="textarea" v-model="formInput.description" placeholder="ex.来週から始まるアルバイトの予定！開いてる日は遊べるよ！"></el-input>
            </el-form-item>
            <div class="input-field col s6 m6">
              <el-form-item label="年" prop="year">
                <el-select v-model="formInput.year" placeholder="Select">
                  <el-option v-for="item in yearOptions" :key="item.value" :label="item.label" :value="item.value"></el-option>
                </el-select>
              </el-form-item>
            </div>
            <div class="input-field col s6 m6">
              <el-form-item label="年" prop="month">
                <el-select v-model="formInput.month" placeholder="Select">
                  <el-option v-for="item in monthOptions" :key="item.value" :label="item.label" :value="item.value"></el-option>
                </el-select>
              </el-form-item>
            </div>
          </el-form>
        </div>
        <!-- カレンダ -->
        <div class="row">
          <p>予定をクリック(出勤 → 休み → 空白)で選べる！</p>
        </div>
        <section>
          <div class="row calendar-row">
            <div class="calendar-col day-of-the-month" v-for="(dayOfTheWeek, index) in dayOfTheWeek" :key="index">
              {{dayOfTheWeek}}
            </div>
          </div>
          <div class="row">
            <div class="row calendar-row" v-for="block in calendar.blocks" :key="block.id">
              <div class="calendar-col day-item" v-for="item in block" :key="item.id">
                <div v-if="formInput.month === item.month" class="" @click="setSchedule(item.day)">
                  {{item.day}}
                  <div :style="item.style">
                    {{item.memo}}
                  </div>
                </div>
              </div>
            </div>
          </div>
          <el-button type="success" icon="el-icon-edit" :disabled="!formValid" @click="submit">この内容でつくる</el-button>
          <el-button type="danger" icon="el-icon-delete" @click="cansell">キャンセル</el-button>
        </section>
      </div>
    </div>
  </div>
</template>

<script>
const RED_COLOR = '#E67168'
const BLUE_COLOR = '#1570A6'

export default {
  name: 'create-chedule',
  data () {
    return {
      rules: {
        title: [ {required: true, message: 'タイトルを入力してください', trigger: 'blur'} ],
        description: [ {required: true, message: '説明を入力してください', trigger: 'blur'} ],
        year: [ {required: true, message: '年を入力してください', trigger: 'blur'} ],
        month: [ {required: true, message: '月を入力してください', trigger: 'blur'} ]
      },
      formValid: false,
      dayOfTheWeek: ['日', '月', '火', '水', '木', '金', '土'],
      calendar: {
        blocks: []
      },
      formInput: {
        title: '',
        description: '',
        year: this.$moment().year(),
        month: this.$moment().month() + 1,
        scheduleItems: []
      },
      yearOptions: [
        { label: this.$moment().add(-1, 'Y').format('YYYY'), value: this.$moment().add(-1, 'Y').year() },
        { label: this.$moment().format('YYYY'), value: this.$moment().year() },
        { label: this.$moment().add(+1, 'Y').format('YYYY'), value: this.$moment().add(+1, 'Y').year() }
      ],
      monthOptions: [
        { label: '1', value: 1 },
        { label: '2', value: 2 },
        { label: '3', value: 3 },
        { label: '4', value: 4 },
        { label: '5', value: 5 },
        { label: '6', value: 6 },
        { label: '7', value: 7 },
        { label: '8', value: 8 },
        { label: '9', value: 9 },
        { label: '10', value: 10 },
        { label: '11', value: 11 },
        { label: '12', value: 12 }
      ]
    }
  },
  created () {
    this.renderCalendar(this.formInput.year, this.formInput.month)
  },
  watch: {
    formInput: {
      handler: function () {
        this.renderCalendar(this.formInput.year, this.formInput.month)
        this.$refs['formInput'].validate(errors => {
          if (errors && this.formInput.scheduleItems.length > 0) {
            this.formValid = true
          } else {
            this.formValid = false
          }
        })
      },
      deep: true
    }
  },
  methods: {
    renderCalendar: function (year, month) {
      let startDayOfCalendar = this.$moment(year + '-' + month).startOf('month').startOf('week')
      let endDayOfCalendar = this.$moment(year + '-' + month).endOf('month').endOf('week')
      // let startDayOfCalendar = this.$moment(this.$moment(year).format('YYYY') + '-' + this.$moment(month).format('MM')).startOf('month').startOf('week')
      let calendarLength = endDayOfCalendar.diff(startDayOfCalendar, 'days') + 1
      let block = []
      this.calendar.blocks = []
      for (var i = 0; i < calendarLength; i++) {
        let targetDate = startDayOfCalendar
        let item = {
          'id': i + 1,
          'isToday': false,
          'year': targetDate.year(),
          'month': targetDate.month() + 1,
          'day': targetDate.date(),
          'date': targetDate.format('YYYY') + '-' + targetDate.format('MM') + '-' + targetDate.format('DD')
        }
        let schedule = this.formInput.scheduleItems.find(s => (s.date === item.day)) || {}
        item.memo = schedule.memo || '未定'
        item.style = schedule.style || {}

        block.push(item)
        if (i !== 0 && (i + 1) % 7 === 0) {
          this.calendar.blocks.push(block)
          block = []
          item = {}
        }
        startDayOfCalendar.add(1, 'days')
      }
    },
    setSchedule: function (targetDay) {
      let index = this.formInput.scheduleItems.findIndex(s => (s.date === targetDay))
      if (index === -1) {
        this.formInput.scheduleItems.push({
          date: targetDay,
          memo: '出勤',
          style: {
            'background-color': RED_COLOR
          }
        })
        return
      }

      switch (this.formInput.scheduleItems[index].memo) {
        case '出勤':
          this.formInput.scheduleItems[index].memo = 'お休み'
          this.formInput.scheduleItems[index].style = { 'background-color': BLUE_COLOR }
          break
        default:
          this.formInput.scheduleItems.splice(index, 1)
      }
    },
    submit () {
      this.$store.dispatch('schedule/postSchedule', this.formInput)
    },
    cansell () {
      this.$refs['formInput'].resetFields()
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
