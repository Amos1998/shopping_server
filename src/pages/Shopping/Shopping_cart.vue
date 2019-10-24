<template>
  <div id="shop_car">
    <section class="car_main">
      <!--顶部列表-->
      <div class="car_head">
        <el-row class="car_top">
          <el-col :md="2" class="car_check_all">
            <input type="checkbox" id="check_all" v-model="isSelected" @click.stop="selectedAll(isSelected)"/>
            <label for="check_all">全选</label>
          </el-col>
          <el-col :md="4" class="car_information">商品图片</el-col>
          <el-col :md="4" class="car_information">商品名称</el-col>
          <el-col :md="4" class="car_canshu">商品参数</el-col>
          <el-col :md="2" class="car_price">单价</el-col>
          <el-col :md="4" class="car_number">数量</el-col>
          <el-col :md="2" class="car_amount">金额</el-col>
          <el-col :md="1" class="car_operation">操作</el-col>
        </el-row>
      </div>
      <!--购物车为空时展示页面-->
      <template v-if="cartgoods.length ==  0">
        <div class="cart_empty">
          您的购物车还是空的哦，快去挑选您喜欢的东西吧.
        </div>
      </template>
      <!--购物车详情展示-->
      <template v-else>
        <div class="goods-content">
          <div class="goods-item">

            <!--当店铺下面有已购买商品的时候显示该店铺和商品信息-->
            <div v-if="cartgoods.length != 0">
              <!--商品详细标题-->
              <div v-for="(product,product_index) in cartgoods" class="product" :key="product_index"
              >
                <el-row class="product_details" v-bind:class="[product.checked ? 'selected_styles' : '']">
                  <!--商品是否选中-->
                  <el-col :md="2" class="product_check">
                    <input type="checkbox" v-model="product.checked" @click.stop="singerGoodsSelected(product)"/>
                  </el-col>

                  <!--商品图片-->
                  <el-col :md="3" class="product_img" >
                    <img :src="product.thumb_url" style="width: 100px;height: 100px" @click.stop="switchUrl(product.pro_type,product.pro_stype,product.goods_id)"/>
                  </el-col>

                  <!--商品名称-->
                  <el-col :md="4" class="product_shop_info">
                    <div class="product_shop_name">
                      <a @click.stop="switchUrl(product.pro_type,product.pro_stype,product.goods_id)">{{product.goods_name}}</a>
                    </div>
                  </el-col>

                  <!--商品尺寸颜色等属性-->
                  <el-col :md="5" class="product_type_select">
                    <div class="product_type_all">
                      <div class="product_type">
                        颜色: {{product.color_type}}<br />
                        <span v-if="product.length_type">
                          长度: {{product.length_type}}
                        </span>

                      </div>
                    </div>
                  </el-col>

                  <!--商品价格-->
                  <el-col :md="2" class="product_price">
                    <div class="product_price_current">
                      ￥{{product.price | priceFilter}}
                    </div>
                  </el-col>

                  <!--商品数量-->
                  <el-col :md="4" class="product_number">
                    <ul class="product_number_content">
                      <li class="product_number_button">
                        <span class="" v-if="product.buy_count > 1" @click.stop="updateGoodsCount(product,false)">-</span>
                      </li>
                      <li class="product_number_input"><input type="text" class="goods-count" value="1" v-model="product.buy_count" disabled/></li>
                      <li class="product_number_button" @click.stop="updateGoodsCount(product,true)">
                        <span class="car-add">+</span></li>
                    </ul>
                  </el-col>

                  <!--金额统计-->
                  <el-col :md="2" class="product_amount">
                    <div class="product_total_price">￥{{ priceAmount(product) | priceFilter}}
                    </div>
                  </el-col>

                  <!--操作选项-->
                  <el-col :md="2" class="product_operation">
                    <div>
                      <i @click.stop="clickTrash(product)" class="el-icon-delete"></i>
                    </div>
                  </el-col>
                </el-row>
              </div>
            </div>
          </div>
        </div>
      </template>
      <!--底部页面-->
      <div class="car_foot_bar">
        <el-row class="car_foot_include">
          <el-col :md="2">
            <label class="cart_sel">
              <input type="checkbox" v-model="isSelected" @click.stop="selectedAll(isSelected)"/>
              <label for="check_all" style="cursor: pointer;">全选</label>
            </label>
          </el-col>
          <el-col :md="9"><div style="opacity: 0;">删除</div></el-col>
          <el-col :md="4" class="piece">已选商品 <strong class="piece_num">{{this.selected_number}}</strong> 件</el-col>
          <el-col :md="6" class="totalMoney">合计 (不含运费) : <strong class="total_text">{{total_price | priceFilter}}</strong> 元</el-col>
          <el-col :md="3" class="settle_accounts">
            <button class="settle_button" :disabled="isSelectedOne" @click.stop="shop_settle(ordergoods)">
              结算
            </button>
          </el-col>
        </el-row>
      </div>
      <!--当店铺下面有已购买商品的时候显示该店铺和商品信息-->


    </section>
  </div>
</template>

<script>
   import {mapState,mapActions} from 'vuex'

    export default {
        name: "Shopping_cart",
      data() {
        return {
          isSelected: false,//商品是否全选中
          isSelectedOne: true,//是否有商品被选中
          total_price: 0,//商品总价
          currentDelGoods: {},//被删除的商品
          selected_number: 0,//选中商品的数量
          ordergoods:'',//结算时选中的商品
        };
      },
      mounted() {
        // 请求商品数据
        this.$store.dispatch('reqCartsGoods');
      },
      update(){
        this.hasSelectedOne()
      },
      methods: {
          switchUrl(pro_type,pro_stype,goods_id){
              this.$router.push('/Shopping_info?pro_type='+pro_type+'&pro_stype='+pro_stype+'&goods_id='+ goods_id)
          },
        //  购物车单个商品的增加和减少
        updateGoodsCount(goods, isAdd) {
          this.$store.dispatch('updateGoodsCount', {goods, isAdd})
          this.getAllGoodsPrice()
          this.selectedNumber()
        },

        // 全选购物车内的商品全部
        selectedAll(isSelected) {
          this.isSelected = !this.isSelected
          this.$store.dispatch('selectedAll', {isSelected})

          this.getAllGoodsPrice()
          this.hasSelectedOne()
          this.selectedNumber()
        },

        // 选中商品总价格
        getAllGoodsPrice() {
          let total_price = 0;
          this.cartgoods.forEach((goods, index) => {
            if (goods.checked) {
              total_price += parseInt(goods.price) * parseInt(goods.buy_count)
            }
          })
          this.total_price = total_price;
        },

        //单个商品选中和取消
        singerGoodsSelected(goods) {
          this.$store.dispatch('singerGoodsSelected', {goods})

          this.getAllGoodsPrice()
          this.hasSelectedAll()
          this.hasSelectedOne()
          this.selectedNumber()
        },

        //判断是否全选
        hasSelectedAll() {
          let flag = true
          if(this.cartgoods.length === 0){
            this.isSelected = false;
          }else {
            this.cartgoods.forEach((goods,index)=>{
              if(!goods.checked){
                flag = false
              }
              this.isSelected = flag;
            })
          }
        },

        //判断是否选中一个
          hasSelectedOne() {
          let flag = true
            this.cartgoods.some((goods, index) => {
              if (goods.checked) {
                flag = false
              }
              this.isSelectedOne = flag;
            });
        },

        //点击删除
        clickTrash(goods){
          this.$confirm('此操作将删除该商品, 是否继续?', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
            this.currentDelGoods = goods;
            this.$store.dispatch('delGoodsSinger',{goods});
            this.selectedNumber();
            this.hasSelectedAll();
            this.getAllGoodsPrice();
            //判断结算按钮是否可以使用
            if(this.cartgoods.length === 0){
              this.isSelectedOne = true;
            }
            this.$message({
              type: 'success',
              message: '删除成功!'
            });
          }).catch(() => {
            this.$message({
              type: 'info',
              message: '已取消删除'
            });
            return
          });
        },

        //单个商品价格
        priceAmount(goods){
          return parseInt(goods.price) * parseInt(goods.buy_count)
        },

        //选中商品的数量
        selectedNumber(){
          let num = 0;
          this.cartgoods.forEach((goods,index)=>{
            if(goods.checked){
              num += goods.buy_count
            }
          })
          this.selected_number = num
        },

        //结算时选中的商品
        paySelected(){
          let arr = []
          this.cartgoods.forEach((goods,index)=>{
            if(goods.checked){
                arr.push(goods)
            }
          })
          this.ordergoods = arr;

        },
        // 结算
        shop_settle() {

          this.paySelected();
          let goods = this.ordergoods
          this.$store.dispatch('orderPaymentGoods',{goods});

          this.hasSelectedAll()
          this.getAllGoodsPrice()
          if(this.cartgoods.length === 0){
            this.isSelectedOne = true;
          }
          this.selectedNumber()
          this.$router.replace("/shopping_order");
        },

      },
      filters: {
        // 金额显示过滤 两位小数点，不足补0
        priceFilter(money) {
          return money.toFixed(2)
        }
      },
      computed: {
        ...mapState(['cartgoods']),
        ...mapActions(['orderPaymentGoods'])
      }
    }
</script>

<style scoped lang="stylus" ref="stylesheet/stylus">
  .el-icon-delete {
    cursor: pointer;
    color: #606266;
    margin: 0 20px;
    font-size: 1.5em;
    vertical-align: middle;
  }
  .el-icon-delete:hover{
    color: red;
  }
  .car_main {
    position: relative;
    width: 980px;
    margin: 0px auto;
    padding: 0px 0px;
    min-height: 250px;
  }

  .car_head {
    width: 100%;
    height: 45px;
    line-height: 45px;
    color: #3c3c3c;
    font-size: 14px;
    padding: 0px;
    border-bottom: 1px solid #DCDCDC;
  }

  .car_top {
    width: 100%;
    height: 50px;
  }

  ul {
    list-style: none;
  }

  li {
    float: left;
    text-align: left;
  }

  .car_check_all {
    position: relative;
    width: 10%;
    left: -20px;
  }

  .car_check_all input[type="checkbox"] {
  }

  .car_check_all label {
  }

  .car_information {

  }

  .car_price {

  }

  .car_number {

  }

  .car_amount {

  }

  .cart_empty {
    position: absolute;
    width: 100%;
    top: 50%;
    text-align: center;
  }

  .car_foot_bar {
    position: relative;
    width: 100%;
    height: 45px;
    font-size: 14px;
    color: #3c3c3c;
    margin-top: 15px;
    margin-bottom: 20px;
    background-color: #e5e5e5;
    border: 1px solid transparent;
    border-radius: 4px;
    border-color: #ddd;
    -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
    box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
  }
  .car_foot_include{
    text-align: center;
  }
  .car_foot_include .cart_sel{
      font-weight: bold;
    height: 45px;
    line-height: 45px;
    cursor: pointer;
  }
  .piece {
    height: 45px;
    line-height: 45px;
  }

  .totalMoney {
    height: 45px;
    line-height: 45px;
  }

  .settle_accounts {
    height: 45px;
    line-height: 45px;
  }

  .piece_num {
    color: red;
  }

  .total_text {
    color: red;
    font-size: 18px;
  }

  .settle_button {
    width: 100%;
    height: 45px;
    line-height: 45px;
    border: none;
    outline: none;
    background-color: red;
    color: #fff;
    font-size: 16px;
    font-weight: bolder;
  }

  .settle_button:disabled {
    background: #B0B0B0;
    cursor: no-drop;
  }

  //商品列表
  .goods-content{
    margin-top: 15px;
  }
  .goods-item{
    margin-top: 20px;
  }
  .product {
    width: 100%;
    margin-bottom: 20px;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 4px;
    -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
    box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
    position: relative;
  }
  .selected_styles {
    background: lightgoldenrodyellow;
  }

  .product_details {
    padding: 15px 0;
  }
  .product_details::before
  ,.product_details::after{
  display: table;
  content: " ";
  }
  .product_check ,
  .product_shop_info ,
  .product_type_select ,
  .product_price ,
  .product_number ,
  .product_amount ,
  .product_total_price ,
  .product_operation {
    height: 150px;
    display: flex;
    align-items: center;
    justify-content: center;
    overflow: hidden;
  }

  .product_img {
    padding-top: 20px;
  }

  .product_shop_info {
    box-sizing: border-box;
    text-indent: 2rem;
    line-height: 25px;
    padding: 10px;
  }

  .product_shop_name {
    font-size: 12px;
    text-align: left;
  }

  .product_shop_name a {
    text-decoration: none;
    /*letter-spacing: 2px;*/
    color: #3c3c3c;
    font-size: 18px;
    font-weight: 500;
  }

  .product_shop_name a:hover {
    color: red;
    text-decoration: underline;
  }

  .product_type_all{
    color: darkgray;
  }

  .product_type {
    width: 125px;
    margin-bottom: 10px;
    margin-left: 15px;
  }

  .product_price {

  }

  .product_price_current {
    width: fit-content;
    font-size: 14px;
    font-weight: bold;
  }

  .product_number {

  }

  .product_number_content {

  }
  .product_number_content>li {
    float: left;
  }

  .product_number_content {
    overflow: hidden;
    margin: 0 16px 0 -20px;
  }

  .product_number_content .product_number_button span{
    display: inline-block;
    width: 28px;
    line-height: 28px;
    text-align: center;
    font-size: 18px;
    color: #999;
    cursor: pointer;
    border: 1px solid #e6e6e6;
  }
  .product_number_content .product_number_input{
    width: 38px;
    height: 26px;
    color: #333;
    border-left: 0;
    border-right: 0;
  }

  .product_number_input>input{
    width: 100%;
    text-align: center;
  }

  .product_number_input input::-webkit-inner-spin-button {
    -webkit-appearance: none;
  }

  .product_number_input input::-webkit-outer-spin-button {
    -webkit-appearance: none;
  }

  .product_amount {

  }

  .product_total_price {
    width: 100px;
    font-size: 16px;
    color: red;
    font-weight: bold;
    word-wrap: break-word;
  }

  .product_operation {
  }

  .product_operation button {

  }

  .product_operation button:hover {
    color: red;
    text-decoration: underline;
  }
</style>
