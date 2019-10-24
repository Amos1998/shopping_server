import ajax from './ajax'

// 1. 基础路径
const BASE_URL = '/api';

// 2. 请求方法

// 2.1 请求首页的轮播图
export const getHomeCasual = ()=>ajax(BASE_URL + '/api/homecasual');

// 2.2 请求首页的导航
export const getHomeNav = ()=>ajax(BASE_URL + '/api/homenav');

// 2.3 请求商品列表数据
export const getHomeShopList = (params)=>ajax(BASE_URL + '/api/homeshoplist', params);

// 2.3 请求商品详情数据
export const getShoppingInfo = (params)=>ajax(BASE_URL + '/api/shopping_info', params);


// 2.4 请求推荐的商品数据
export const getRecommendShopList = ()=>ajax(BASE_URL + '/api/recommendshoplist');

// 2.5 请求搜索的列表数据
export const getSearchGoods = ()=>ajax(BASE_URL + '/api/searchgoods');

// 3. 手机验证码登录
export const phoneCodeLogin = (phone, code) => ajax(BASE_URL + '/api/login_code', {phone, code}, 'POST');

// 4. 获取短信验证码
export const getPhoneCode = (phone) => ajax(BASE_URL + '/api/send_code', {phone});

// 5. 用户名和密码登录
export const pwdLogin = (name, pwd, captcha)=> ajax(BASE_URL + '/api/login_pwd', {name, pwd, captcha}, 'POST');

// 6. 注册
export const pwdRegist = (userInfo)=> ajax(BASE_URL + '/api/register', {userInfo}, 'POST')

// 8.获取登录的用户信息
export const getUserInfo = ()=>ajax(BASE_URL + '/api/user_info');

// 9.退出登录
export const getLogOut = ()=>ajax(BASE_URL + '/api/logout');

// 10 加入购物车
export const addGoodsToCart = ( goods_id, pro_type, pro_stype, goods_name, thumb_url,color_type,length_type, price, buy_count, is_pay) => ajax(BASE_URL + '/api/add_shop_cart', {goods_id,pro_type, pro_stype, goods_name, thumb_url,color_type,length_type, price, buy_count, is_pay}, 'POST');

// 11 请求购物车的数据
export const getCartsGoods = () => ajax(BASE_URL + '/api/cart_goods');

// 12 修改购物车的商品数量
export const updateCartsGoods = (goods_id,buy_count) => ajax(BASE_URL + '/api/update_cart_goods_num',{goods_id,buy_count},'POST');

// 13 删除购物车商品
export const delCartsGoods = (goods_id) => ajax(BASE_URL + '/api/del_cart_goods',{goods_id},'POST');

// 14 储存支付商品的数据
export const savePayGoods = (goods) => ajax(BASE_URL + '/api/save_pay_goods',{goods},'POST');

// 15 请求支付商品的数据
export const getPayGoods = () => ajax(BASE_URL + '/api/get_pay_goods');

// 10 创建收货地址
export const addAddress= (address_info) => ajax(BASE_URL + '/api/add_address_info', {address_info}, 'POST');
