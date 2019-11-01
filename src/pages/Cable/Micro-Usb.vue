<template>
  <div style="background-color: #e8e8e8">
    <div class="w100 product_list">
      <ul>
        <shop-list tag="li" v-for="(item, index) in homeshoplist['one']" :item = item :key="index" v-on:childByValue="childByValue(arguments)"/>
      </ul>
      <el-pagination
        background
        hide-on-single-page
        :pager-count="5"
        layout="prev, pager, next"
        @current-change="current_change"
        :page-size="count"
        :current-page.sync="currentPage"
        :total="homeshoplist['two'][0].count">
      </el-pagination>
    </div>

  </div>
</template>

<script>
    import {mapState} from 'vuex'
    import ShopList from './../../components/ShopList/ShopList'
    import {getShoppingInfo} from './../../api/index';
    import { Loading } from 'element-ui';

    export default {
        name: "Micro_Usb",
        data(){
            return{
                currentPage:1,  //默认当前页为第一页
                count: 12, //默认每页数据12条
            }
        },
        methods:{
            async childByValue (childValue) {
                // childValue就是子组件传过来的值
                if (childValue[2]){
                    let arr={goods_id:childValue[0],typeId:childValue[1],stypeId:childValue[2]}
                    let result = await getShoppingInfo(arr);
                    let routeData = this.$router.resolve('/Shopping_info?pro_type='+childValue[1]+'&pro_stype='+childValue[2]+'&goods_id='+childValue[0])
                    window.open(routeData.href, '_blank');
                }else{
                    let arr={goods_id:childValue[0],typeId:childValue[1]}
                    let result = await getShoppingInfo(arr);
                    let routeData = this.$router.resolve('/Shopping_info?pro_type='+childValue[1]+'&goods_id='+childValue[0])
                    window.open(routeData.href, '_blank');
                }

                // console.log(result)
            },
            current_change(currentPage){  //改变当前页
                let loadingInstance1 = Loading.service({ fullscreen: true });
                this.currentPage = currentPage
                // this.$router.push({path: 'reqHomeShopList', query: {page: this.currentPage, count: this.count}})
                this.$store.dispatch('reqHomeShopList', {
                    page: this.currentPage, count: this.count, typeId: 1, stypeId:2
                });
                window.scrollTo(0,0);
                loadingInstance1.close();
            }
        },
        mounted(){  //如果使用数据接口
            this.$store.dispatch('reqHomeShopList', {
                page: this.currentPage, count: this.count, typeId: 1, stypeId:2
            });
        },
        computed:{
            ...mapState(['homeshoplist'])
        },
        components:{
            ShopList
        }
    }
</script>

<style scoped lang="stylus" ref="stylesheet/stylus">
  .product_list
    width 996px
    margin 0 auto
    padding-bottom 50px
    padding-top 40px
  .product_list ul li{ width:24%;margin-bottom:25px; padding:0;display:inline-block; position: relative;}
</style>
