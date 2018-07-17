import Vue from 'vue'
import App from './App.vue'
import router from './router'
import Config from './config'
import axios from 'axios'
import store from './store'
import 'materialize-css/dist/css/materialize.min.css'

Vue.config.productionTip = false

Vue.prototype.$http = axios
Vue.prototype.$http.defaults.baseURL = Config.BASE_API_URL
Vue.prototype.$http.defaults.headers.post['Content-Type'] = 'application/json'

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
