<template>
  <li class="list_item" @click="childClick">
    <div class="row">
      <div class="w100 img">
        <a>
          <img class="lazy"  :src="item.thumb_url">
        </a>
      </div>
      <div class="w100 tit"> <a >{{item.goods_name}}</a> </div>
      <div class="w100 promote_info"></div>
      <div class="w100 description"></div>
      <div class="w100 cart_box">
        <span class="price">${{item.price}}</span>
      </div>
    </div>
    <div class="productLabel">
      <div class="labels hotLabel">HOT</div>
    </div>
  </li>

</template>

<script>
  export default {
    name: "ShopList",
    props: {
      item: Object
    },
    data () {
      return {
        childValue: '我是子组件的数据'
      }
    },
    methods: {
      childClick () {
        // childByValue是在父组件on监听的方法
        // 第二个参数this.childValue是需要传的值
        if(this.item.pro_stype){
            this.$emit('childByValue',this.item.goods_id,this.item.pro_type,this.item.pro_stype)
        }  else {
            this.$emit('childByValue',this.item.goods_id,this.item.pro_type)
        }

      }
    }
  }
</script>

<style scoped lang="stylus" ref="stylesheet/stylus">
  a{text-decoration: none}
  .list_item .row{ padding:0 15px; margin:0 10px; background:#fff;border:1px #fff solid }
  .list_item:hover .row{ border:1px #e1e1e1 solid}
  .list_item a{ width:100%; display:inline-block;}
  .list_item .img img{ width:100%;}
  .list_item .tit{ margin-top:30px; text-align:left; word-break: keep-all;  white-space: nowrap;  overflow: hidden;  text-overflow: ellipsis;}
  .list_item .tit a{ color:#000; font-size:16px;}
  .list_item .tit a:hover{ color:#38a0f4;}
  .list_item .description{ font-size:12px; color:#333; height:40px; line-height:20px; overflow:hidden;}
  .list_item .promote_info{ color:#f00; font-size:12px;max-height:30px; line-height:15px; overflow:hidden;}
  .list_item .cart_box{ margin:10px 0 30px 0; border:none; text-align: left;}
  .list_item .cart_box .price{ color:#e01d20; font-size:16px;}
  .list_item .cart_box .icon{ float:right;}
  .cart_box .icon a{ width:20px; height:20px; display:inline-block; margin-right:10px;}
  .productLabel{ position: absolute; margin: auto;  top: 0; left: 50%; transform:translate(-50%,0%);-webkit-transform:translate(-50%,0%);-moz-transform:translate(-50%,0%); -ms-transform:translate(-50%,0%); -o-transform:translate(-50%,0%);    text-align: center; color: #ffffff; padding: 0 5px;}
  .productLabel{ display: flex;align-items: center; justify-content: center;}
  .productLabel .hotLabel{ background: #eb4d1b;}
</style>
