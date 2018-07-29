import axios from 'axios'

const schedule = {
  namespaced: true,
  state: {
    schedules: [],
    schedule: {}
  },
  getters: {},
  mutations: {
    setSchedules (state, schedules) {
      state.schedules = schedules
    },
    setSchedule (state, schedule) {
      state.schedule = schedule
    }
  },
  actions: {
    async getSchedules ({commit}) {
      const res = await axios.get('/schedules')
      commit('setSchedules', res.data)
    },
    async getSchedule ({commit}, id) {
      const res = await axios.get('/schedules/' + id)
      commit('setSchedule', res.data)
    },
    async postSchedule ({commit}, data) {
      const res = await axios.post('/schedules', data)
      commit('setSchedule', res.data)
      return res.data
    }
  }
}
export default schedule
