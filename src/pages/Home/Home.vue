<template>
    <div class="home">
      <!--轮播图-->
        <div class="swiper-container" v-if="homecasual.length > 0">
          <div class="swiper-wrapper">
            <div class="swiper-slide" v-for="(casual,index) in homecasual" :key="index">
              <img :src="casual.imgurl" alt="轮播图" width="100%">
            </div>
        </div>
        <!-- 如果需要分页器 -->
        <div class="swiper-pagination"></div>
      </div>
      <!--热销产品-->
      <HotShopList></HotShopList>
    </div>
</template>

<script>
  import Swiper from 'swiper'
  import 'swiper/dist/css/swiper.min.css'

  import HotShopList from './HotShopList'

  import {
    mapState
  } from 'vuex'

    export default {
        name: "Home",
      components: {HotShopList},
      computed: {
        ...mapState(['homecasual'])
      },
      mounted() {
        // 1. 请求轮播图的数据
        this.$store.dispatch('reqHomeCasual', ()=>{
          this.$nextTick(() => {
            // 创建swiper的实例
            new Swiper('.swiper-container', {
              autoplay: true,//等同于以下设置
              loop: true,
              // 如果需要分页器
              pagination: {
                el: '.swiper-pagination',
              }
            })
          })
        });
      },
      watch:{ }
    }
</script>

<style scoped lang="stylus" ref="stylesheet/stylus">
  .swiper-container img
    width 100%

</style>
