import {
  getHomeCasual,
  getHomeNav,
  getHomeShopList,
  getRecommendShopList,
  getSearchGoods,
  getUserInfo,
  getLogOut,
  getShoppingInfo,
  getCartsGoods,
  updateCartsGoods,
  delCartsGoods,
  savePayGoods,
  getPayGoods
} from '../api'

import {
  HOME_CASUAL,
  HOME_NAV,
  HOME_SHOP_LIST,
  RECOMMEND_SHOP_LIST,
  SEARCH_GOODS,
  USER_INFO,
  RESET_USER_INFO,
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
  // 1. 获取首页的轮播图
  async reqHomeCasual({commit}, callback) {
    const result = await getHomeCasual();
    commit(HOME_CASUAL, {homecasual: result.message})
    callback && callback();
  },

  // 2. 获取首页的导航
  async reqHomeNav({commit}) {
    const result = await getHomeNav();
    commit(HOME_NAV, {homenav: result.message.data})
  },

  // 3. 获取商品列表
  async reqHomeShopList({commit}, params) {
    const result = await getHomeShopList(params);
    console.log(result);
    commit(HOME_SHOP_LIST, {homeshoplist: result.message})
  },
// 3. 获取商品信息
  async getShoppingInfo({commit}, params) {
    const result = await getShoppingInfo(params);
    console.log(params)
    commit(Shopping_Info, {shoppinginfo: result.message})
  },

  // 4. 获取推荐的商品数据
  async reqRecommendShopList({commit}) {
    const result = await getRecommendShopList();
    commit(RECOMMEND_SHOP_LIST, {recommendshoplist: result.message.data})

  },

  // 5. 获取推荐的商品数据
  async reqSearchGoods({commit}, callback) {
    const result = await getSearchGoods();
    commit(SEARCH_GOODS, {searchgoods: result.message.data})

    callback && callback();

  },
  // 6. 同步用户的信息
  syncUserInfo({commit}, userInfo) {
    commit(USER_INFO, {userInfo});
  },
  // 7. 异步获取用户信息
  async getUserInfo({commit}) {
    const result = await getUserInfo();
    // console.log(result);
    if (result.success_code === 200) {
      commit(USER_INFO, {userInfo: result.message});
    }
  },

  // 8. 退出登录
  async logout({commit}) {
    const result = await getLogOut();
    console.log(result);
    if (result.success_code === 200) {
      commit(RESET_USER_INFO);
    }
  },

  // 9. 请求购物车数据
  async reqCartsGoods({commit}) {
    const result = await getCartsGoods();
    if(result.success_code === 200){
      commit(CART_GOODS_LIST, {cartgoods: result.message})
    }
  },
  // 9. 购物车单个商品的增加和减少
  async updateGoodsCount({commit}, {goods, isAdd}) {
    if(isAdd){ // 增加
      commit(ADD_GOODS_COUNT, {goods});
    }else { // 减少
      commit(REDUCE_GOODS_COUNT, {goods});
    }
    const result = await updateCartsGoods(goods.goods_id,goods.buy_count);
  },

  // 10. 单个商品的选中和取消
  singerGoodsSelected({commit}, {goods}){
    commit(SELECTED_SINGER_GOODS, {goods});
  },

  // 11. 全选和取消全选
  selectedAll({commit}, {isSelected}){
    commit(SELECTED_ALL_GOODS, {isSelected});
  },

  // 12. 删除单个商品
  async delGoodsSinger({commit}, {goods}) {
    commit(DEL_SINGER_GOODS, {goods});
    const result = await delCartsGoods(goods.goods_id);
  },

  // 13.购物车支付商品
  orderPaymentGoods({commit}, {goods}) {
    console.log(goods);
    commit(ORDER_PAYMENT_GOODS, {goods});
    this.state.paygoods.forEach((key,index)=>{
      //清除购物车里的商品
      const result = delCartsGoods(key.goods_id);
    })
    //添加支付订单商品
    const resultTwo = savePayGoods(this.state.paygoods);
    console.log(resultTwo)
  }

  // 14.订单支付商品

}
