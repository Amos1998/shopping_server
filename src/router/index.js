// 1. 引入对应模块
import Vue from 'vue'
import VueRouter from 'vue-router'

//一级路由
import Home from './../pages/Home/Home'
import Hub from './../pages/Hub/Hub'
import Cable from './../pages/Cable/Cable'
import Car_charger from './../pages/Car_charger/Car_charger'
import Charger from './../pages/Charger/Charger'
import Search from './../pages/Search/Search'
import Login from './../pages/Login/Login'
import Regist from './../pages/Regist/Regist'
import Me from './../pages/Me/Me'
import Shopping_cart from './../pages/Shopping/Shopping_cart'
import Shopping_info from './../pages/Shopping/Shopping_info'
import Shopping_order from './../pages/Shopping/Shopping_order'


//二级路由
import Lightning from './../pages/Cable/Lightning'
import Micro_Usb from './../pages/Cable/Micro-Usb'
import Type_C from './../pages/Cable/Type-C'
import Type_C_To_Lightning from './../pages/Cable/Type-C-To-Lightning'

// 2. 声明使用
Vue.use(VueRouter)

// 3. 输出路由对象
export default  new VueRouter({
  // 所有路由
  routes: [
    {
      path:'/home',
      component:Home
    },
    {
      path:'/hub',
      component:Hub
    },
    {
      path:'/cable',
      component:Cable,
      children:[
        {
          path:'lightning',
          component:Lightning
        },
        {
          path:'micro_usb',
          component:Micro_Usb
        },
        {
          path:'type_c',
          component:Type_C
        },
        {
          path:'type_c_to_lightning',
          component:Type_C_To_Lightning
        },
        {
          path: '/cable',
          redirect: '/cable/lightning'
        }
      ]
    },
    {
      path:'/car_charger',
      component:Car_charger
    },
    {
      path:'/charger',
      component:Charger
    },
    {
      path:'/regist',
      component:Regist
    },
    {
      path:'/login',
      component:Login
    },
    {
      path:'/search',
      component:Search
    },
    {
      path:'/me',
      component:Me
    },
    {
      path:'/shopping_cart',
      component:Shopping_cart
    },
    {
      path:'/shopping_info',
      component:Shopping_info
    },
    {
      path:'/shopping_order',
      component:Shopping_order
    },
    {
      path:'/',
      redirect:'/home'
    }
  ]
})
