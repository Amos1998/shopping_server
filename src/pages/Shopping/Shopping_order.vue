<template>
  <div class="container">
    <div id="content">
      <div class="checkout-tit">
        <span class="tit-txt">填写并核对订单信息</span>
      </div>
      <div class="checkout-steps">
        <div class="step-tit">
          <h3>收货人信息</h3>
        </div>
        <div class="step-cont">
          <div class="form-new clearfix">
            <el-button type="text" @click="dialogFormVisible = true"><img src="/static/img/add.png" alt=""></el-button>
            <div class="add_mi" style="background: url(/static/img/mail.jpg) no-repeat;">
              <p style="border-bottom:1px dashed #ccc;line-height:28px;">浙江杭州(爸爸收)</p>
              <p>萧山 北干 明怡花苑53幢3单元<br />13735683918</p>
            </div>
            <el-dialog title="收货地址" :visible.sync="dialogFormVisible">
              <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
                <el-form-item label="收货人" prop="name">
                  <el-input v-model="ruleForm.name"></el-input>
                </el-form-item>
                <el-form-item label="所在地区" prop="province" required>
                  <el-cascader
                    size="large"
                    :options="options"
                    v-model="selectedOptions"
                    @change="handleChange">
                  </el-cascader>
                </el-form-item>
                <el-form-item label="详细地址" prop="desc">
                  <el-input type="textarea" v-model="ruleForm.desc"></el-input>
                </el-form-item>
                <el-form-item label="联系电话" prop="phone" class="phoneadd">
                  <el-input v-model.number="ruleForm.phone" class="input-with-select">
                    <el-select v-model="selectNation" slot="prepend" placeholder="请选择">
                      <el-option label="中国大陆+86" value="+86"></el-option>
                      <el-option label="香港+852" value="+852"></el-option>
                      <el-option label="澳门+853" value="+853"></el-option>
                      <el-option label="台湾+886" value="+886"></el-option>
                    </el-select>
                  </el-input>
                </el-form-item>
                <el-form-item prop="email" label="邮箱">
                  <el-input v-model="ruleForm.email"></el-input>
                </el-form-item>
                <el-form-item>
                  <el-button type="primary" @click="submitForm('ruleForm')">立即创建</el-button>
                  <el-button @click="resetForm('ruleForm')">重置</el-button>
                </el-form-item>
              </el-form>
              <div slot="footer" class="dialog-footer">
                <el-button @click="dialogFormVisible = false">取 消</el-button>
                <el-button type="primary" @click="dialogFormVisible = false">确 定</el-button>
              </div>
            </el-dialog>
          </div>
        </div>
        <div class="hr"></div>
        <div id="shipAndSkuInfo">
          <div id="payShipAndSkuInfo">
            <div class="step-tit">
              <h3>支付方式</h3>
            </div>
            <div class="step-cont">
              <div class="payment-list">
                <div class="list-cont clearfix">
                  <ul id="payment-list">
                    <li style="cursor: pointer;">
                      <div class="payment-item online-payment payment-item-disabled" for="pay-method-1" payname="货到付款" payid="1" clstag="">
                        <b></b>
                        微信支付
                        <span id="codtips01" class="qmark-icon qmark-tip" data-tips=""></span>
                      </div>
                    </li>
                    <li style="cursor: pointer;">
                      <div class="payment-item online-payment payment-item-disabled item-selected" for="pay-method-1" payname="淘宝支付" payid="2" clstag="">
                        <b></b>
                        支付宝支付
                        <span id="codtips" class="qmark-icon qmark-tip" data-tips=""></span>
                      </div>
                    </li>
                    <li style="cursor: pointer;">
                      <div class="payment-item online-payment payment-item-disabled" for="pay-method-1" payname="货到付款" payid="1" clstag="">
                        <b></b>
                        银联支付
                        <span id="" class="qmark-icon qmark-tip" data-tips=""></span>
                      </div>
                    </li>
                    <li style="cursor: pointer;">
                      <div class="payment-item online-payment payment-item-disabled" for="pay-method-1" payname="货到付款" payid="1" clstag="">
                        <b></b>
                        信用卡支付
                        <span id="" class="qmark-icon qmark-tip" data-tips=""></span>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="hr"></div>
            <div class="step-tit">
              <h3>送货清单</h3>
              <div class="extra-r">
                <a class="price-desc" id="price-desc" href="#none" data-tips="因可能存在系统缓存、页面更新导致价格变动异常等不确定性情况出现，商品售价以本结算页商品价格为准。">
                  <i></i>&nbsp;价格说明
                </a>
                <a @click="switchTo('/shopping_cart')" id="cartRetureUrl" class="return-edit ftx-05" clstag="">返回修改购物车</a>
              </div>
            </div>
            <div class="step-cont">
              <div class="shopping-lists clearfix" id="shopping-lists">
                <div class="shopping-list ABTest">
                  <div class="goods-list">
                    <div class="goods-items" v-for="(product,index) in paygoods" :key="index">
                      <div class="goods-suit goods-last">
                        <div class="goods-item goods-item-extra">
                          <div class="p-img">
                            <a @click.stop="switchOne(product.pro_type,product.pro_stype,product.goods_id)" :title="product.goods_name" target="_tank">
                              <img :src="product.thumb_url" :alt="product.goods_name">
                            </a>
                          </div>

                          <div class="goods-msg">
                            <div class="goods-msg-gel">
                              <div class="p-name">
                                <a href="javascript:;" title="" target="_bank">{{product.goods_name}}</a>
                              </div>
                              <div class="p-price">
                                <strong class="jd-price">￥{{product.price}}</strong>
                                <span class="p-num">x{{product.buy_count}}</span>
                                <span class="p-state">有货</span>
                              </div>
                            </div>
                          </div>
                          <div class="p-extra-continer">
                            <div class="p-extra-line">
                              <div class="fl">
                                <strong>颜色：</strong>
                                <span>{{product.color_type}}</span>
                              </div>
                              <div class="fl" v-if="product.length_type">
                                <strong>长度：</strong>
                                <span>{{product.length_type}}</span>
                              </div>
                            </div>
                          </div>
                          <div class="p-icon-continer">
                            <i class="p-icon p-icon-w sevenicon"></i>
                            <span class="ftx-07 withouthk seven">支持7天无理由退货</span>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="remarks-items">
                      <div class="remarks-item">
                        <span class="remarks-tit ">备注:</span>
                        <textarea class="remarks-cont " rows="10" cols="30" placeholder="建议留言前先与商家沟通确认"></textarea>
                        <em class="remarks-limits remarks-limits-new hide">45</em>
                      </div>
                    </div>
                  </div>
                  <div class="dis-modes">
                    <div class="mode-item mode-tab">
                      <h4>配送方式</h4>
                      <div class="mode-tab-nav">
                        <div class="mode-tab-item curr">
                          <div class="m-txt">
                            快递运输
                          </div>
                          <b></b>
                        </div>
                      </div>
                      <div class="mode-tab-con fore1">
                        <div class="" id="sop_shipment_date">
                          <span class="mode-label ftx-03">配送时间：</span>
                          <div class="mode-infor">工作日、双休日与节假日均可送货</div>
                        </div>
                      </div>
                      <div class="mode-tab-con fore2" style="">
                        <div class="mode-promise">
                            <span class="promise-ico">
                              <a href="javascript:void(0)" class="pop_FreightInsurance" title="">　</a>
                            </span>
                          <span class="promise-txt" >7天内退货，15天内换货，可享1次运费赔付到小金库
                            </span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="order-summary clearfix">
        <div class="statistic">
          <div class="list">
            <span><em class="ftx-01">{{this.selected_number}}</em> 件商品，总商品金额：</span>
            <em class="price" id="warePriceId" v="199">￥{{total_price | priceFilter}}</em>
          </div>
          <div class="list">
            <span>运费：</span>
            <em class="price" id="freightPriceId"><i class="freight-icon"></i><font color="#000000"> ￥0.00</font></em>
          </div>
        </div>
      </div>
      <div class="trade-foot">
        <div class="trade-foot-detail-com">
          <div class="fc-price-info">
            <span class="price-tit">应付总额：</span>
            <span class="price-num" id="sumPayPriceId">￥{{total_price | priceFilter}}</span>
          </div>
        </div>
        <div id="checkout-floatbar" class="group">
          <div class="checkout-buttons">
            <div class="sticky-wrap">
              <div class="inner">
                <button type="submit" class="checkout-submit" id="order-submit" onclick="javascript:submit_Order(null,2);" clstag="">
                  提交订单<b></b>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import {mapState} from 'vuex'
  import { regionData, CodeToText } from 'element-china-area-data'


  export default {
      name: "Shopping_order",
      computed: {
        ...mapState(['paygoods']),
      },
      mounted() {
        // 请求商品数据
        this.getAllGoodsPrice();
        this.selectedNumber()
      },
      data(){
        let checkPhone = (rule, value, callback) => {
          if (!value) {
            return callback(new Error('收货人联系电话不能为空'));
          } else {
            const reg = /^1[3|4|5|7|8][0-9]\d{8}$/
            if (reg.test(value)) {
              callback();
            } else {
              return callback(new Error('请输入正确的联系电话'));
            }
          }
        };
        let checkProvince = (rule, value, callback)=>{
          if (!value) {
            return callback(new Error('地址不能为空'));
          }
        };
        return {
            selectNation:'+86',//国家手机号码前缀
          total_price: 0,//商品总价
          selected_number: 0,//选中商品的数量
          options: regionData,
          selectedOptions: [],
            dialogTableVisible: false,
            dialogFormVisible: false,
          ruleForm: {
            name: '',
            province: '',
            desc: '',
            phone:'',
            email:''
          },
          rules: {
            name: [
              {required: true, message: '请输入收货人名称', trigger: 'blur'},
              {min: 1, max: 10, message: '长度在 1 到 10 个字符', trigger: 'blur'}
            ],
            province: [
              {required: true, validator: checkProvince, trigger: 'blur'}
            ],
            desc: [
              {required: true, message: '请填写详细地址', trigger: 'blur'}
            ],
            phone: [
              {required: true, validator: checkPhone, trigger: 'blur'}
            ],
            email: [
              { required: true, message: '请输入邮箱地址', trigger: 'blur' },
              { type: 'email', message: '请输入正确的邮箱地址', trigger: ['blur', 'change'] }
            ]
          }
        }
      },
      methods:{
        switchTo(path){
          this.$router.push(path);
        },
        switchOne(pro_type,pro_stype,goods_id){
            this.$router.push('/Shopping_info?pro_type='+pro_type+'&pro_stype='+pro_stype+'&goods_id='+ goods_id)
        },
        //省市区三级联动
        handleChange (value) {
          this.ruleForm.province = CodeToText[this.selectedOptions[0]]+CodeToText[this.selectedOptions[1]]+CodeToText[this.selectedOptions[2]]
        },

        //选中商品的数量
        selectedNumber(){
          let num = 0;
          this.paygoods.forEach((goods,index)=>{
            if(goods.checked){
              num += goods.buy_count
            }
          })
          this.selected_number = num
        },

        // 选中商品总价格
        getAllGoodsPrice() {
          let total_price = 0;
          this.paygoods.forEach((goods, index) => {
            if (goods.checked) {
              total_price += parseInt(goods.price) * parseInt(goods.buy_count)
            }
          })
          this.total_price = total_price;
        },

        submitForm(formName) {
          this.$refs[formName].validate((valid) => {
            if (valid) {
              alert(this.ruleForm);
            } else {
              console.log('error submit!!');
              return false;
            }
          });
        },
        resetForm(formName) {
          this.$refs[formName].resetFields();
          this.selectedOptions = []
        }
      },


      filters: {
        // 金额显示过滤 两位小数点，不足补0
        priceFilter(money) {
          return money.toFixed(2)
        }
      }
    }
</script>
<Style>
  body .el-scrollbar__view.el-select-dropdown__list{
    text-align:center
  }
</Style>
<style scoped lang="stylus" ref="stylesheet/stylus">

  .clearfix:after,.clearfix:before{/*伪元素是行内元素 正常浏览器清除浮动方法*/
    content: "";
    display: block;
    height: 0;
    clear:both;
    visibility: hidden;
  }
  .clearfix{
  *zoom: 1;/*ie6清除浮动的方式 *号只有IE6-IE7执行，其他浏览器不执行*/
  }
  .container{
    width 996px
    margin 0 auto
    margin-bottom 50px
  }
  * {
    -ms-word-wrap: break-word;
    word-wrap: break-word;
  }

  html {
    -webkit-text-size-adjust: none;
    text-size-adjust: none;
  }

  html,
  body {
    height: 100%;
    width: 100%;
  }

  body,
  h1,
  h2,
  h3,
  h4,
  h5,
  h6,
  p,
  strong,
  b,
  i,
  a,
  span,
  del,
  pre,
  table,
  tr,
  th,
  td,
  form,
  fieldset
  {
    margin: 0;
    padding: 0;
    word-wrap: break-word;
    font-family: verdana, Microsoft YaHei, Tahoma, sans-serif;
  }

  body,
  ul,
  ol,
  li,
  dl,
  dd,
  p,
  h1,
  h2,
  h3,
  h4,
  h5,
  h6,
  form,
  fieldset,
  em,
  del {
    font-style: normal;
    font-size: 100%;
  }

  ul,
  ol,
  dl {
    list-style: none;
  }

  .container {
    margin-top: 1.2rem;
  }

  #content {
    width: 990px;
    margin: 0 auto;
  }

  .checkout-tit {
    height: 42px;
    line-height: 42px;
    font-size: 16px;
    font-family: "Microsoft YaHei";
    overflow: hidden;
  }

  /*收货人信息*/
  .checkout-steps {
    background-color: #fff;
    padding: 0 20px;
    border: 1px solid #f0f0f0;
  }

  .checkout-steps .step-tit {
    line-height: 40px;
    height: 40px;
    color: #333;
  }

  .checkout-steps .step-tit h3 {
    font-size: 14px;
    height: 40px;
    line-height: 40px;
    float: left;
  }

  .step-cont {
    margin-bottom: 10px;
  }

  //表单
  .form-new .el-form {
    width: 65%;
    margin: 0 auto;
  }
  .form-new .el-form-item{
      margin-bottom:17px;
  }
  .form-new .add_mi{
    margin: 12px 0
  }
  .form-new .add_mi {
    height: 106px;
    float: left;
    /*display: inline-block;*/
    margin-right: 5px;
    background: url(/static/img/mail_1.jpg) no-repeat;
    padding: 6px 17px;
  }
  .form-new .add_mi p {
    font-size: 12px;
    line-height: 20px;
    margin-bottom: 5px;
    color: #666;
    width: 203px;
  }
  .form-new .el-form-item .el-form-item__error{
    top: auto;
  }

  .phoneadd >>>.el-select .el-input {
    width: 140px;
    text-align:center;
  }

  .phoneadd >>>.input-with-select .el-input-group__prepend {
    background-color: #fff;
  }

  .hr {
    border-bottom: 1px solid #e6e6e6;
    height: 0;
    margin-bottom: 10px;
  }

  /*支付方式*/
  .payment-list {
    padding: 0 20px 10px;
  }

  .payment-list .list-cont ul {
    display: block;
  }

  .payment-list .list-cont li {
    margin-right: 9px;
  }

  .payment-list .list-cont .payment-item.payment-item-disabled {
    background: #f3f3f3;
    border-color: #ddd;
    color: #aaa;
    cursor: pointer;
  }

  .payment-list .list-cont .payment-item {
    float: left;
    position: relative;
    border: 1px solid #ddd;
    padding: 5px 24px;
    margin: 0 8px;
    cursor: pointer;
  }

  .payment-list .list-cont .payment-item.item-selected {
    border: 2px solid #e4393c;
    padding: 4px 23px;
    background: #fff;
    color: #000;
  }

  .payment-list .list-cont .item-selected b {
    display: block;
    position: absolute;
    right: 0;
    bottom: 0;
    width: 12px;
    height: 12px;
    overflow: hidden;
    background: url(http://misc.360buyimg.com/user/purchase/2.0.0/css/i/selected-icon.png) no-repeat;
  }

  /*送货清单*/
  .checkout-steps .step-tit .extra-r {
    float: right;
  }

  .price-desc {
    display: inline-block;
    vertical-align: middle;
    height: 20px;
    background: url(http://misc.360buyimg.com/user/purchase/2.0.0/css/i/presale-icon.png) 4px 0 no-repeat;
    line-height: 20px;
    margin-right: 27px;
    color: #005ea7;
  }

  .price-desc i {
    display: inline-block;
    vertical-align: middle;
    height: 20px;
    width: 24px;
    margin-right: 5px;
    text-decoration: none;
  }

  .ftx-05,
  .ftx05 {
    color: #005ea7;
  }

  .shopping-list {
    position: relative;
    float: left;
    width: 100%;
    margin-bottom: 10px;
  }

  .shopping-list.ABTest .goods-list {
    float: right;
  }

  .shopping-list .goods-list {
    float: left;
    width: 100%;
    background-color: #f3fbfe;
    padding: 10px 0;
  }

  .shopping-list .goods-list .goods-items {
    padding: 0 20px;
  }

  .shopping-list .goods-list .goods-last {
    border: 0;
  }

  .shopping-list .goods-list .goods-suit {
    padding-bottom: 5px;
  }

  .shopping-list .goods-list .goods-item-extra {
    border: none;
    margin-bottom: 0;
  }

  .shopping-list .goods-list .goods-item {
    border-bottom: 1px solid #fff;
    padding: 10px 0;
    margin-bottom: 10px;
    color: #666;
  }

  .shopping-list .goods-list .goods-item .p-img {
    float: left;
    width: 15%;
    /*height: 80px;*/
    /*border: 1px solid #ddd;*/
    margin-right: 10px;
  }

  .shopping-list .goods-list .goods-item .p-img img {
    width: 75%;
    /*height: 90px;*/
  }

  .shopping-list .goods-list .goods-item .goods-msg {
    float: left;
    width: 80%;
  }

  .shopping-list .goods-list .goods-item .p-name {
    float: left;
    width: 49.8%;
    overflow: hidden;
    font-size: 20px;
    margin-bottom: 10px;
  }

  .shopping-list .goods-list .goods-item .p-price {
    float: right;
    width: 48.8%;
    margin: 0 0 5px;
  }

  .shopping-list .goods-list .goods-item .p-price .jd-price {
    width: 100px;
    text-align: right;
  }

  .shopping-list .goods-list .goods-item .p-price strong {
    font-family: verdana;
    color: #e4393c;
    display: inline-block;
  *display: inline;
  *zoom: 1;
  vertical-align: middle;
  }

  .shopping-list .goods-list .goods-item .p-price .p-num {
    width: 70px;
    text-align: right;
  }

  .shopping-list .goods-list .goods-item .p-price span {
    display: inline-block;
    vertical-align: middle;
  }

  .shopping-list .goods-list .goods-item .p-price .p-state {
    width: 58px;
    text-align: right;
  }

  .shopping-list .goods-list .goods-item .p-extra-continer {
    width: 49.8%;
    display: inline-block;
  }

  .shopping-list .goods-list .goods-item .p-extra-continer .p-extra-line {
    max-width: 240px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
  }

  .shopping-list .goods-list .goods-item .p-extra-continer .p-extra-line div.fl {
    min-width: 120px;
    max-width: 120px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
  }

  .fl {
    float: left;
  }

  .shopping-list .goods-list .goods-item .p-icon-continer {
    padding-left: 16%;
    margin-top: 5px;
  }

  .p-icon {
    display: inline-block;
  *display: inline;
  *zoom: 1;
  width: 18px;
  height: 18px;
  margin: 0 5px 0 0;
  overflow: hidden;
  background: url(http://misc.360buyimg.com/user/purchase/2.0.0/css/i/purchase-icon-201808.png) no-repeat;
  vertical-align: middle;
  *position: relative;
  *top: 2px;
  }

  .p-icon-w {
    background-position: 0 -84px;
  }

  .ftx-07,
  .ftx07 {
    color: #6679b3;
  }

  .remarks-items {
    margin: 10px 20px 0px 20px;
  }

  .shopping-list .goods-list .remarks-items .remarks-item {
    position: relative;
  }

  .shopping-list .goods-list .remarks-items .remarks-tit {
    vertical-align: middle;
    height: 22px;
    line-height: 22px;
    display: inline-block;
    margin-top: 7px;
  }

  .shopping-list .goods-list .remarks-items .remarks-cont {
    width: 500px;
    max-width: 500px;
    min-height: 22px;
    max-height: 76px;
    line-height: 22px;
    vertical-align: text-top;
    resize: none;
    background-color: #fff;
    outline: 0;
    border: 1px solid #e6e6e6;
    padding: 3px 5px;
    font-size: 16px;
    display: inline-block !important;
    overflow: auto;
  }

  .shopping-list .goods-list .remarks-items .remarks-limits {
    position: absolute;
    right: 38px;
    bottom: 5px;
    color: #999;
  }

  .hide {
    display: none;
  }

  /*配送方式*/
  .shopping-list.ABTest .dis-modes {
    float: left;
  }

  .shopping-list .dis-modes {
    float: right;
    width: 100%;
    margin-top: 30px;
    padding: 10px 10px 10px 20px;
    background-color: #f8f8f8;
  }

  .shopping-list .dis-modes .mode-item {
    margin-bottom: 50px;
  }

  .shopping-list h4 {
    color: #666;
  }

  .shopping-list .dis-modes .mode-tab-nav {
    margin: 10px 0 20px;
  }

  .shopping-list .dis-modes .mode-tab-nav .mode-tab-item {
    padding: 5px 0;
    width: 143px;
    text-align: center;
    border: 1px solid #ddd;
    margin-right: 10px;
    position: relative;
    cursor: pointer;
  }

  .shopping-list .dis-modes .mode-tab-nav .curr {
    border: 2px solid #e4393c;
    padding: 4px 0;
    width: 141px;
  }

  .shopping-list .dis-modes .mode-tab-nav .m-txt {
    position: relative;
    display: inline-block;
  }

  .shopping-list .dis-modes .mode-tab-nav .curr b {
    display: block;
    position: absolute;
    right: 0;
    bottom: 0;
    width: 12px;
    height: 12px;
    overflow: hidden;
    background: url(http://misc.360buyimg.com/user/purchase/2.0.0/css/i/selected-icon-new.png) no-repeat;
  }

  .shopping-list .mode-tab-con.fore1 {
    padding-bottom: 10px;
    border-bottom: 1px solid #ddd;
  }

  .shopping-list .mode-tab-con .mode-infor {
    display: inline-block;
  }

  .shopping-list .mode-tab-con .mode-label {
    display: inline-block;
    min-width: 60px;
  }

  .ftx-03,
  .ftx03 {
    color: #999;
  }

  .promise-ico {
    float: left;
    padding-left: 0;
  }

  .mode-tab-con.fore2 {
    margin-top: 5px;
  }

  .mode-tab-con.fore2 a {
    display: inline-block;
    height: 16px;
    line-height: 16px;
    margin-right: 5px;
    background-image: url(http://misc.360buyimg.com/user/purchase/2.0.0/css/i/promise.png);
    background-repeat: no-repeat;
  *zoom: 1;
  vertical-align: middle;
  }

  .pop_FreightInsurance {
    width: 57px;
    background-position: 0 0;
  }

  .shopping-list .dis-modes .mode-promise .promise-txt {
    display: inline-block;
    width: 62%;
    margin-left: 10px;
  }

  /*汇总信息*/
  .order-summary .statistic {
    width: 300px;
    margin: 20px 20px 10px 0;
    float: right;
  }

  .order-summary .statistic .list {
    height: 24px;
    line-height: 24px;
    overflow: hidden;
    margin-bottom: 5px;
    zoom: 1;
  }

  .order-summary .statistic span {
    width: 180px;
    margin-right: 20px;
    float: left;
    text-align: right;
  }

  .order-summary .statistic em {
    color: #e4393c;
  }

  .order-summary .statistic .price {
    color: #333;
    float: left;
    width: 100px;
    text-align: right;
    font-family: verdana;
  }

  .order-summary .freight-icon,
  .order-summary .plus95-icon {
    cursor: pointer;
    width: 13px;
    height: 13px;
    background: url(http://misc.360buyimg.com/user/purchase/2.0.0/css/i/qmark03.png) center top no-repeat;
    display: inline-block;
    position: relative;
    vertical-align: middle;
    margin-right: 5px;
    top: -1px;
  }

  /*提交订单*/
  .trade-foot {
    font-family: "Microsoft YaHei", SimSun, verdana;
  }

  .trade-foot-detail-com {
    padding: 15px 10px 15px 0;
    line-height: 20px;
    text-align: right;
    border-top: 1px solid #e6e6e6;
    width: 980px;
    color: #999;
    background-color: #f4f4f4;
  }

  .trade-foot-detail-com .fc-price-info {
    margin-right: 10px;
    line-height: 25px;
  }

  .trade-foot-detail-com .fc-price-info .price-tit {
    color: #666;
  }

  .trade-foot-detail-com .fc-price-info .price-num,
  .trade-foot-detail-com .presale-price-info .price-num {
    color: #e4393c;
    font-family: Verdana;
    font-weight: 700;
    font-size: 18px;
    min-width: 122px;
    float: right;
    text-align: right;
  }

  #checkout-floatbar {
    clear: both;
    width: 990px;
    margin: 20px 0;
  }

  .checkout-buttons {
    position: relative;
    width: 990px;
    height: 50px;
  }

  .checkout-buttons .sticky-wrap {
    position: relative;
  }

  .checkout-buttons .sticky-wrap .inner {
    padding: 0 10px;
  }

  .checkout-buttons .checkout-submit {
    float: right;
    position: relative;
    width: 135px;
    height: 36px;
    line-height: 36px;
    margin: 8px 10px 0 0;
    padding: 0;
    background-color: #e00;
    overflow: hidden;
    color: #fff;
    font-weight: 700;
    font-size: 16px;
    font-family: arial, "Microsoft YaHei";
    display: inline-block;
    border-radius: 3px;
    cursor: pointer;
    border: 0;
  }

  .checkout-buttons .checkout-submit b {
    position: absolute;
    left: 0;
    top: 0;
    width: 135px;
    height: 36px;
    background: url(http://misc.360buyimg.com/user/purchase/2.0.0/css/i/btn-submit.jpg) no-repeat;
    cursor: pointer;
    overflow: hidden;
  }

  .checkout-buttons .checkout-submit:hover {
    background-color: #EF494D
  }

  .checkout-buttons .checkout-submit:hover b {
    background-position: 0 -36px
  }
</style>
