import Vue from 'vue'
import App from './App.vue'
import router from './router'
import axios from 'axios'
import store from './store'
import momentTimezone from 'moment-timezone'
import vueMoment from 'vue-moment'
import Modal from '@/components/parts/Modal'
import 'materialize-css/dist/css/materialize.min.css'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import Notifications from 'vue-notification'

Vue.config.productionTip = false

momentTimezone.tz.setDefault('Asia/Tokyo')

Vue.use(vueMoment, {momentTimezone})
Vue.use(ElementUI)
Vue.use(Notifications)

Vue.prototype.$http = axios

Vue.prototype.$http.defaults.baseURL = process.env.BASE_API_URL
Vue.prototype.$http.defaults.headers.post['Content-Type'] = 'application/json'

Vue.component('modal', Modal)

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
