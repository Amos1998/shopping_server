<template>
    <div class="wdt">
      <div class="crumb-wrap" id="crumb-wrap">
        <div class="w body-size">
          <div class="crumb fl clearfix">
            <div class="item first">
              <a href="/" clstag="">首页</a></div>
            <div class="item sep">&gt;</div>
            <div class="item">
              <a href="javascript:;">产品</a></div>
            <div class="item sep">&gt;</div>
            <div class="item ellipsis" title="产品名">{{shoppinginfo[0].goods_name}}</div></div>
        </div>
      </div>
      <div class="bg body-size clearfix">
        <div class="preview-wrap">
          <div class="bg_left">
            <div class="show">
              <vue-photo-zoom-pro
                :width="150"
                :out-show="true"
                :pointer="true"
                :url="shoppinginfo[0].thumb_url">
              </vue-photo-zoom-pro>
              <div class="mask"></div>
            </div>
            <div class="smallshow">
              <p class="prev prevnone"></p>
              <div class="middle_box">
                <ul class="middle">
<!--                  <li><img src="http://t00img.yangkeduo.com/t02img/images/2018-05-29/c58805eaa48d4f00db9d6183e3117718.jpeg" alt=""></li>-->
<!--                  <li><img src="http://t00img.yangkeduo.com/t07img/images/2018-06-08/6af50f61f488bf990fe3df9b5e530a63.jpeg" alt=""></li>-->
                </ul>
              </div>
              <p class="next "></p>
            </div>
          </div>
          <div class="bg_right">
            <div class="bigshow">
              <div class="bigitem" >
                <img src="img/piecemeal/img1_01.jpg" alt="">
              </div>
            </div>
          </div>
        </div>
        <div class="itemInfo-wrap">
          <div class="sku-name" :data-name="shoppinginfo[0].goods_name">{{shoppinginfo[0].goods_name}}</div>
          <div class="summary summary-first">
            <div class="summary-price-wrap">
              <div class="summary-price J-summary-price">
                <div class="dt">价 格 </div>
                <div class="dd">
                  <div class="p-price">
                    <span>￥</span>
                    <span class="price">{{shoppinginfo[0].price}}</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
<!--          <div class="param" v-for="(value,index) in arr" :key="index">-->
<!--            <div class="param_item">-->
<!--              {{value}}-->
<!--            </div>-->
<!--          </div>-->
          <div style="padding-left: 10px;font-family: simsun;color: #999;}" class="p-choose-wrap">
            月销量：<sapn style="color: #666">999+</sapn>
          </div>
          <div style="padding-left: 10px;font-family: simsun;color: #999;}">
            配送：<sapn style="color: #666">免运费</sapn>
          </div>
          <div class="summary p-choose-wrap">
            <div id="choose-attrs">
              <div id="choose-attr-1" class="li p-choose" data-type='颜色' data-idx='0'>
                <div class="dt">
                  颜色分类:
                </div>
                <div class="dd">
                  <el-radio-group v-model="colorType">
                    <el-radio-button label="象牙白"></el-radio-button>
                    <el-radio-button label="经典黑"></el-radio-button>
                    <el-radio-button label="土豪金"></el-radio-button>
                    <el-radio-button label="中国红"></el-radio-button>
                    <el-radio-button label="宝石蓝"></el-radio-button>
                    <el-radio-button label="神秘银"></el-radio-button>
                    <el-radio-button label="可定制任意颜色" border></el-radio-button>
                  </el-radio-group>
                </div>
              </div>
            </div>
          </div>
          <div class="summary p-choose-wrap">
            <div v-if="this.$utils.getUrlKey('pro_type') == 1">
              <div class="li p-choose">
                <div class="dt">
                  长度:
                </div>
                <div class="dd">
                  <el-radio-group v-model="lenghtType">
                    <el-radio-button label="1m"></el-radio-button>
                  </el-radio-group>
                </div>
              </div>
            </div>
          </div>
          <div id="choose-btns" class="choose-btns clearfix">
            <div class="choose-amount " clstag="shangpin|keycount|product|goumaishuliang_2">
              <div class="wrap-input">
                <input type="text" v-model="buy_count"  class="text buy-num"  id="buy-num" @change="modify" >
                <a class="btn-reduce " v-model="this.buy_count" :class="{'disabled':this.buy_count <= 1}" @click="reduce()" data-disabled="1">-</a>
                <a class="btn-add" v-model="this.buy_count" @click="add()" data-disabled="1">+</a>
              </div>
            </div>
            <a @click="switchTo_c('/shopping_cart')" id="" class="btn-special2 btn-lg" style="" onclick="" style="background-color: #f44336;">加入购物车</a>
            <a @click="switchTo('/shopping_order')" id="btn-onkeybuy" class="btn-special2 btn-lg" style="" onclick="">一键购</a>
          </div>
          <div id="summary-tips" class="summary-tips" clstag="" style="">
            <div class="dt">温馨提示 </div>
            <div class="dd">
              <ol class="tips-list">
                <li class="local-txt">·支持7天无理由退货(拆封后不支持)</li>
              </ol>
            </div>
          </div>
        </div>
      </div>
    </div>
</template>

<script>
  import {mapState,mapActions} from 'vuex'
  import {addGoodsToCart} from './../../api/index'

    export default {
      name: "Shopping_info",
      computed: {
        ...mapState(['shoppinginfo','paygoods','cartgoods','shoppinggoods','userInfo']),
        ...mapActions(['orderPaymentGoods'])
      },
      data() {
        return {
          buy_count: 1,
          is_pay: 0,
            colorType:'',
            lenghtType:'1m',
          arr:[]
        };
      },
      mounted() {
          // let param = this.shoppinginfo[0].param
          // this.arr = param.split(',')
          let goods_id = this.$utils.getUrlKey('goods_id');
          let typeId = this.$utils.getUrlKey('pro_type');
          let stypeId = this.$utils.getUrlKey('pro_stype');
          if(stypeId){
              this.$store.dispatch('getShoppingInfo',{typeId:typeId,stypeId:stypeId,goods_id:goods_id});
          } else {
              this.$store.dispatch('getShoppingInfo',{typeId:typeId,goods_id:goods_id});
          }
      },
      methods:{
          add(){
            console.log(this.buy_count);
            this.buy_count = parseInt(this.buy_count)+1;
          },
          reduce(){
            console.log(this.buy_count);
            if (this.buy_count > 1){
              this.buy_count = parseInt(this.buy_count)-1;
            }
          },
        modify(){
          if (this.buy_count < 1 || this.buy_count == ''){
            this.buy_count = 1;
          }
        },
        async switchTo_c(path){
              if(!this.colorType){
                  this.$alert('请选择商品规格！', '消息提示', {
                      confirmButtonText: '确定',
                  });
                  return
              }
            let typeId = this.$utils.getUrlKey('pro_type');
              if (typeId != 1){
                  this.lenghtType=''
              }
            let result = await addGoodsToCart(this.$store.state.shoppinginfo[0].goods_id, this.$store.state.shoppinginfo[0].pro_type, this.$store.state.shoppinginfo[0].pro_stype, this.$store.state.shoppinginfo[0].goods_name,
            this.$store.state.shoppinginfo[0].thumb_url,this.colorType,this.lenghtType, this.$store.state.shoppinginfo[0].price, this.buy_count, this.is_pay);
          if(result.err_code == 0){
            this.$alert(result.message, '消息提示', {
              confirmButtonText: '确定',
              callback: action => {
                this.$router.replace('/login')
              }
            });
            return
          }
          this.$router.push(path);
        },
        switchTo(path) {
            let pro_stype =this.$store.state.shoppinginfo[0].pro_stype;

            let baz = {
              users_id: this.shoppinginfo[0].users_id,
              goods_id: this.shoppinginfo[0].goods_id,
              goods_name: this.shoppinginfo[0].goods_name,
              thumb_url: this.shoppinginfo[0].thumb_url,
              pro_type:this.shoppinginfo[0].pro_type,
              price: this.shoppinginfo[0].price,
              buy_count: this.buy_count,
              is_pay: this.is_pay,
              checked:true
            }

            if(pro_stype){
                baz.pro_stype = pro_stype;
            }

          if(!this.userInfo.user_name){
            this.$alert('请先登录！', '消息提示', {
              confirmButtonText: '确定',
              callback: action => {
                this.$router.replace('/login')
              }
            });
            return
          }else {
            this.shoppinggoods.push(baz);
            let goods = this.shoppinggoods;
            this.$store.dispatch('orderPaymentGoods',{goods});
            // this.$router.push(path);
          }
        }
      }
    }
</script>
<style>

</style>
<style scoped lang="stylus" ref="stylesheet/stylus">
  .show >>> .pic-img .img-out-show{
    z-index: 3;
  }
  .show >>> .pic-img .img-container{
    border:1px solid #f5f5f5
  }
  .el-radio-button{
    border-left: 1px solid #DCDFE6 !important;
    border-radius: 4px !important;
    margin-left: 10px;
  }
  .el-radio-button>>>.el-radio-button__orig-radio:checked+.el-radio-button__inner{
    border-radius: 4px !important;
  }
  .crumb-wrap .w{
    width 996px
  }
  .bg{
    display: flex;
    width 996px
    margin 0 auto
    margin-top: 10px;
    margin-bottom 50px
  }
  .preview-wrap{
    width: 38%;
    position: relative;
  }

  .bg .bg_right{
    position: absolute;
    right: -105%;
    z-index: 2;
  }
  em, i, u {
    font-style: normal;
  }
  .li {
    margin-bottom: 3px;
    line-height: 32px;
    display: inline-block;
    display: block;
  }
  .li:after{
    content: ".";
    display: block;
    height: 0;
    clear: both;
    visibility: hidden;
  }
  .body-size{
    /*width: 72%;*/
  }
  /*面包屑导航*/
  .crumb-wrap {
    z-index: 5;
    margin-top: 1.2rem;
  }
  .crumb-wrap {
    background: #f2f2f2;
  *z-index: 2;
  clear: both;
  }
  .crumb,.crumb-wrap {
    position: relative;
  }
  .crumb-wrap .w{
    margin: 0 auto;
  }
  .crumb {
    padding: 13px 0 9px;
  }
  .crumb .item {
    float: left;
  }
  .crumb .sep {
    font-family: simsun;
    padding: 0 10px;
  }
  .ellipsis {
    width: 120px;
  }
  .ellipsis {
    /*overflow: hidden;*/
    white-space: nowrap;
    text-overflow: ellipsis;
  }
  /*产品信息*/
  .itemInfo-wrap{
    width 58%;
    margin: 0 auto;
  }
  .itemInfo-wrap .sku-name {
    font: 700 20px Arial,"microsoft yahei";
    color: #666;
    padding-top: 10px;
    line-height: 28px;
    margin-bottom: 5px;
  }
  .summary-price-wrap{
    padding-top: 20px;
  }
  .param .param_item {
      font-size:18px;
      /*font-weight: bold;*/
    }
  .itemInfo-wrap .summary-price-wrap .summary-price {
    position: relative;
    margin-bottom: 5px;
  }
  .p-choose-wrap{
    margin:32px 0;
  }
  .itemInfo-wrap .dt {
    float: left;
    padding-left: 10px;
    font-family: simsun;
    color: #999;
  }
  .itemInfo-wrap .dd {
    margin-left: 85px;
  }

  .itemInfo-wrap .summary-price-wrap .summary-price .dt {
    font-size: 18px;
  }
  .itemInfo-wrap .dd {

  }
  .itemInfo-wrap .summary-price-wrap .summary-price .p-price span {
    font-size: 16px;
  }
  .itemInfo-wrap .summary-price-wrap .summary-price .p-price {
    color: #E4393C;
    font-family: "microsoft yahei";
    margin-right: 10px;
  }
  .itemInfo-wrap .summary-price-wrap .summary-price .p-price .price {
    font-size: 40px;
  }
  .li .item {
    float: left;
    color: #666;
    background-color: #FFF;
    margin-right: 7px;
    margin-bottom: 4px;
  }
  .li .item a {
    border: 1px solid #ccc;
    padding: 0 13px;
    display: block;
    white-space: nowrap;
  }
  .li .item.hover a,.li .item.selected a,.li .item:hover a {
    border: 1px solid #e3393c;
    color: #666
  }

  .choose-btns {
    margin-top: 10px;
    margin-bottom: 20px;
    padding: 0 10px;
    color: #fff;
  }
  .choose-btns .choose-amount {
    width: 58px;
    height: 44px;
    overflow: hidden;
    border: 1px solid #ccc;
    position: relative;
    margin-right: 10px;
    float: left;
  }
  .choose-btns .choose-amount input {
    display: block;
    width: 43px;
    height: 42px;
    line-height: 42px;
    position: absolute;
    top: 1px;
    left: 0;
    border: none;
    border: 0;
    text-align: center;
  }
  .choose-btns .choose-amount a.btn-reduce {
    bottom: -1px;
  }
  .choose-btns .choose-amount a.disabled {
    color: #ccc;
    cursor: not-allowed;
  }
  .choose-btns .choose-amount a {
    display: block;
    width: 15px;
    text-align: center;
    height: 22px;
    line-height: 22px;
    overflow: hidden;
    background: #f1f1f1;
    color: #666;
    position: absolute;
    right: -1px;
    border: 1px solid #ccc;
  }
  .choose-btns .choose-amount a.btn-add {
    top: -1px;
  }
  .btn-def, .btn-primary, .btn-special1, .btn-special2, .btn-special3 {
    display: inline-block;
    text-align: center;
    vertical-align: middle;
    cursor: pointer;
  }
  .choose-btns .btn-lg {
    margin-right: 10px;
    float: left;
  }
  .btn-lg {
    height: 46px;
    line-height: 46px;
    padding: 0 26px;
    font-size: 18px;
    font-family: "microsoft yahei";
  }
  .btn-special1, .btn-special2 {
    font-weight: 700;
  }
  .btn-special2, .btn-special3 {
    background-color: #85c360;
    color: #fff;
  }
  .itemInfo-wrap .summary-tips .tips-list li {
    float: left;
    margin-right: 15px;
    font-family: simsun;
    color: #999;
  }
</style>
