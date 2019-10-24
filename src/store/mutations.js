import Vue from 'vue'
import {
  HOME_CASUAL,
  HOME_NAV,
  HOME_SHOP_LIST,
  RECOMMEND_SHOP_LIST, RESET_USER_INFO,
  SEARCH_GOODS,
  USER_INFO,
  Shopping_Info,
  CART_GOODS_LIST,
  ADD_GOODS_COUNT,
  REDUCE_GOODS_COUNT,
  SELECTED_ALL_GOODS,
  SELECTED_SINGER_GOODS,
  DEL_SINGER_GOODS,
  ORDER_PAYMENT_GOODS
} from './mutation-types'

export default {
  [HOME_CASUAL](state, {homecasual}){
    state.homecasual = homecasual;
  },

  [HOME_NAV](state, {homenav}){
    state.homenav = homenav;
  },

  [HOME_SHOP_LIST](state, {homeshoplist}){
    state.homeshoplist = []
    state.homeshoplist = homeshoplist;
  },

  [Shopping_Info](state, {shoppinginfo}){
    state.shoppinginfo = []
    state.shoppinginfo = shoppinginfo;
  },

  [RECOMMEND_SHOP_LIST](state, {recommendshoplist}){
    state.recommendshoplist = recommendshoplist;
  },

  [SEARCH_GOODS](state, {searchgoods}){
    state.searchgoods = searchgoods;
  },
  [USER_INFO](state, {userInfo}){
    state.userInfo = userInfo;
  },
  [RESET_USER_INFO](state){
    state.userInfo = {};
  },
  [USER_INFO](state, {userInfo}){
    state.userInfo = userInfo;
  },
  [CART_GOODS_LIST](state, {cartgoods}){
    state.cartgoods = cartgoods;
  },
  [ADD_GOODS_COUNT](state, {goods}){
    goods.buy_count++
  },
  [REDUCE_GOODS_COUNT](state, {goods}){
    if( goods.buy_count){
      goods.buy_count--
      if( goods.buy_count === 0 ){
        const index = state.cartgoods.indexOf(goods)
        state.cartgoods.splice(index,1)
      }
    }
  },
  [SELECTED_ALL_GOODS](state, {isSelected}){
    state.cartgoods.forEach((goods,index)=>{
      // console.log(isSelected)
      if (goods.checked){
        goods.checked = !isSelected
      }else {
        Vue.set(goods,'checked',!isSelected)
      }
    })
  },
  [SELECTED_SINGER_GOODS](state, {goods}){
      if (goods.checked){
        goods.checked = !goods.checked
      }else {
        Vue.set(goods,'checked',true)
      }
  },
  [DEL_SINGER_GOODS](state, {goods}){
    const index = state.cartgoods.indexOf(goods)
    state.cartgoods.splice(index,1)
  },
  [ORDER_PAYMENT_GOODS](state, {goods}){
    state.paygoods = []
    state.paygoods = goods
    for (let i=0; i<state.cartgoods.length; i++) {
      for (let j=0; j<goods.length; j++) {
        if(state.cartgoods[i].goods_id == goods[j].goods_id){
          state.cartgoods.splice(i,1)
        } else{
          break;
        }
      }
    }
    state.shoppinggoods=[]
  },
}
