<template>
  <div class="shop-container">
    <h3 class="hot-name">热销产品</h3>
    <div class="recommend_main clearfix">
      <div class="recommend_left">
        <div class="recommend_product_s">
          <div class="product_sbox">
            <a href="https://www.storexppen.com/buy/deco-pro.html"><img src="./imgs/Deco-Pro.png" alt=""></a>
            <p class="text">产品名</p>
            <p class="prize">$79.99</p>
            <a href="https://www.storexppen.com/buy/deco-pro.html">
              <div class="product_sbox_btn">购买</div>
            </a>
          </div>
        </div>
        <div class="recommend_product_s">
          <div class="product_sbox">
            <a href="https://www.storexppen.com/buy/78.html"><img src="./imgs/Deco-Pro.png" alt=""></a>
            <p class="text">产品名</p>
            <p class="prize">$79.99</p>
            <a href="https://www.storexppen.com/buy/deco-pro.html">
              <div class="product_sbox_btn">购买</div>
            </a>
          </div>
        </div>
        <div class="recommend_product_s">
          <div class="product_sbox">
            <a href="https://www.storexppen.com/buy/artist-15_6pro.html"><img src="./imgs/Deco-Pro.png" alt=""></a>
            <p class="text">产品名</p>
            <p class="prize">$79.99</p>
            <a href="https://www.storexppen.com/buy/deco-pro.html">
              <div class="product_sbox_btn">购买</div>
            </a>
          </div>
        </div>
        <div class="recommend_product_s">
          <div class="product_sbox">
            <a href="https://www.storexppen.com/buy/artist-22epro.html"><img src="./imgs/Deco-Pro.png" alt=""></a>
            <p class="text">产品名</p>
            <p class="prize">$79.99</p>
            <a href="https://www.storexppen.com/buy/deco-pro.html">
              <div class="product_sbox_btn">购买</div>
            </a>
          </div>
        </div>
      </div>
      <div class="recommend_right">
        <div class="recommend_product_b">
          <div class="product_sbox">
            <a href="https://www.storexppen.com/buy/artist-12-pro.html"><img src="./imgs/Deco-Pro.png" alt=""></a>
            <p class="text">产品名</p>
            <p class="prize">$79.99</p>
            <a href="https://www.storexppen.com/buy/deco-pro.html">
              <div class="product_sbox_btn">购买</div>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import {
    mapState
  } from 'vuex'

  export default {
    name: "HotShopList",
    computed:{
      // ...mapState(['homeshoplist'])
    },
    mounted() {
      // this.$store.dispatch('reqHomeShopList')
    }
  }
</script>

<style scoped lang="stylus" ref="stylesheet/stylus">
  .clearfix:after {
    content: "." ;
    display: block ;
    height: 0 ;
    clear: both ;
    visibility: hidden ;
  }
  .clearfix{ display: inline-block; }
  .shop-container
    width 996px
    margin 0 auto
    margin-bottom 50px
    .hot-name
      font-size 40px
      margin 40px auto
      text-align  center
      line-height 1
      .recommend_main {
        width: 100%;
        height: auto;
        /*overflow: hidden;*/
      }
  .recommend_main a{
    color: #151414;
  }
  .recommend_main .recommend_left {
    width: 50%;
    float: left;
    font-size: 0;
  }
  .recommend_main .recommend_left .recommend_product_s {
    width: 50%;
    display: inline-block;
    vertical-align: top;
    height: 300px;
    box-sizing: border-box;
    padding: 16px 16px 0 0; }
  .recommend_main .recommend_left .recommend_product_s .product_sbox {
    /*padding: 24px;*/
    height: 100%;
    background: #f5f5f5;
    /*overflow: auto;*/
    text-align: center;
    transition: all .5s;}
  .recommend_main .recommend_left .recommend_product_s .product_sbox:hover {
    background: #fff;
    box-shadow:5px 5px 20px #ccc,5px -5px 20px #ccc,-5px 5px 20px #ccc,-5px -5px 20px #ccc;
  }
  .recommend_main .recommend_left .recommend_product_s .product_sbox img {
    width: 100%;
    height: auto;
    transition: all .5s;}
  .recommend_main .recommend_left .recommend_product_s .product_sbox img:hover {
    -webkit-transform: scale(1.1);
    -ms-transform: scale(1.1);
    transform: scale(1.1);
  }
  .recommend_main .recommend_left .recommend_product_s .product_sbox .text {
    width: 100%;
    overflow: hidden;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
    font-size: 16px;
    line-height: 20px;
    max-height: 40px;
    margin: 8px 0;
    text-align: center; }
  .recommend_main .recommend_left .recommend_product_s .product_sbox .product_sbox_btn {
    display: inline-block;
    padding: 4px 19px;
    font-size: 14px;
    line-height: 1.2;
    margin-top: 10px;
    border: 1px solid #000;
    border-radius: 45px;
    cursor: pointer; }
  .recommend_main .recommend_left .recommend_product_s .product_sbox .product_sbox_btn:hover {
    background: #000;
    color: #fff; }
  .recommend_main .recommend_right {
    width: 50%;
    float: left;
  }
  .recommend_main .recommend_right .recommend_product_b {
    width: 100%;
    padding: 16px 0 0 0;
    height: 600px; }
  .recommend_main .recommend_right .recommend_product_b .product_sbox {
    padding: 24px 32px;
    height: 100%;
    background: #f5f5f5;
    overflow: hidden;
    text-align: center;
    transition: all .5s;}
  .recommend_main .recommend_right .recommend_product_b .product_sbox:hover{
    background: #fff;
    box-shadow:5px 5px 20px #ccc,5px -5px 20px #ccc,-5px 5px 20px #ccc,-5px -5px 20px #ccc;}

  .recommend_main .recommend_right .recommend_product_b .product_sbox img {
    width: 100%;
    height: auto;
    transition: all .5s;}
  .recommend_main .recommend_right .recommend_product_b .product_sbox img:hover {
    -webkit-transform: scale(1.1);
    -ms-transform: scale(1.1);
    transform: scale(1.1);
  }
  .recommend_main .recommend_right .recommend_product_b .product_sbox .text {
    width: 100%;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    font-size: 24px;
    line-height: 30px;
    max-height: 60px;
    margin-top: 36px;
    text-align: center; }
  .recommend_main .recommend_right .recommend_product_b .product_sbox .product_sbox_btn {
    display: inline-block;
    padding: 6px 25px;
    font-size: 24px;
    line-height: 1.2;
    margin-top: 20px;
    border: 1px solid #000;
    border-radius: 50px;
    cursor: pointer; }
  .recommend_main .recommend_right .recommend_product_b .product_sbox .product_sbox_btn:hover {
    background: #000;
    color: #fff; }
    .shop-list
      display flex
      flex-direction row
      justify-content space-around
      align-items center
      .shop-list-item
         flex 1
         margin-bottom 10px
         background-color #fff
         display flex
         flex-direction column
         .list-item-title
            line-height 22px
            width 94%
            margin-left 3%
            height 44px
            overflow hidden
         .list-item-bottom
            margin 10px 0
            display flex
            flex-direction row
            justify-content space-around
            align-items center
            .item-price
               font-size 18px
               text-align center
               font-weight bolder
               color red
               flex 1
            .item-counter
               flex 2
               font-size 12px
               color #cccccc
            .item-user
               display flex
               justify-content center
               align-items center
               flex 1
               img
                 width 30px
                 border-radius 50%
               img:nth-child(2)
                 margin-left -6px
            .item-buy
                 flex 2
                 button
                   width 80%
                   height 34px
                   font-size 15px
                   border none
                   color #fff
                   display flex
                   justify-content center
                   align-items center
                   margin-left 10px
                   background-color red
                   border-radius 8px


</style>
