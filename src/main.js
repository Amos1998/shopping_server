import Vue from 'vue'
import App from './App'
import store from './store/index'

//引入路由
import router from './router/index'

import $ from 'jquery'
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap/dist/js/bootstrap.min'
import "popper.js/dist/umd/popper.min.js";

import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import VuePhotoZoomPro from 'vue-photo-zoom-pro'
import utils from './common/urlGet'; //获取url参数

Vue.prototype.$utils = utils; //注册全局方法
Vue.use(VuePhotoZoomPro)
Vue.use(ElementUI)

new Vue({
  el:'#app',
  router,
  store,
  render:h =>h(App)//渲染一个视图，然后提供给el挂载
});
