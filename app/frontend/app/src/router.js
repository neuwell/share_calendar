import Vue from 'vue'
import Router from 'vue-router'
import About from './views/About.vue'
import Schedules from './views/Schedules.vue'
import Schedule from './views/Schedule.vue'
import CreateSchedule from './views/CreateSchedule.vue'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      redirect: '/schedules'
    },
    {
      path: '/about',
      name: 'about',
      component: About
    },
    {
      path: '/schedules',
      name: 'schedules',
      component: Schedules
    },
    {
      path: '/schedules/new',
      name: 'create-schedule',
      component: CreateSchedule
    },
    {
      path: '/schedules/:id_hash',
      name: 'schedule',
      component: Schedule
    },
    {
      path: '*',
      redirect: '/schedules'
    }
  ]
})
