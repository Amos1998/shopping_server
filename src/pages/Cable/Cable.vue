<template>
    <div class="cable">
      <div class="nav_left">
        <div class="cable_title">数据线类型</div>
        <ul v-for="(item,index) in items" @click="handleChange(item,index)" :key="index">
          <li><span>{{item.label}}</span></li>
        </ul>
      </div>
      <router-view></router-view>
    </div>
</template>

<script>
  export default {
    name: "Cable",
    data(){
      return {
        items: [
          {label: '苹果数据线'},
          {label: 'Micro Usb 数据线'},
          {label: 'Type-C 数据线'},
          {label: 'Type-C To Lightning 数据线'}
        ],
        subRouteUrl:[
          '/cable/lightning','/cable/micro_usb','/cable/type_c','/cable/type_c_to_lightning'
        ]
      }
    },
    methods:{
      switchTo(path){
        this.$router.replace(path);
      },
      handleChange(item, index){
        this.$router.replace(this.subRouteUrl[index]);
      }
    }
  }
</script>

<style scoped lang="stylus" ref="stylesheet/stylus">
  /*.content*/
  /*  width 996px*/
  /*  margin 0 auto*/
  .cable
    .nav_left
      position fixed
      left 0
      top 30%
      border 1px solid #f5f5f5
      display inline-block
      margin-left 10px
      border-radius 22px
      overflow hidden
      background-color #fff
      .cable_title
        width 100%
        font-size 20px
        padding 10px 0
        background-color #2e6da4
        text-align center
        color #fff
      ul
        padding 0 10px
        li
          padding 15px 0
          font-size 18px
          text-align center
          cursor pointer

</style>
