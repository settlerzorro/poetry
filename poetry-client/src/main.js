import Vue from 'vue'

import VueRouter from 'vue-router'
import router from './router'
import axios from 'axios'
import echarts from 'echarts'

import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import App from './App.vue'

import Utils from './assets/js/common.js'
Vue.prototype.utils = Utils;
Vue.prototype.domain = "http://127.0.0.1:10001"; // 接口地址

import './assets/css/common.css'

// 安装路由
Vue.use(VueRouter);

Vue.use(ElementUI)

Vue.prototype.$axios = axios
Vue.prototype.$echarts = echarts

new Vue({
  el: '#app',
  router,
  render: h => h(App)
})
