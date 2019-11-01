<template>
  <div class="header">
    <header>
      <div class="title_ico" @click="switchTo('/home')" :class="{on:'/' == $route.path}">
        <img src="./../../../static/img/logo.png" alt="">
      </div>
      <div class="route_info">
        <ul class="pri_route">
          <li><span @click="switchTo('/home')" :class="{on:$route.path.includes('/home')}">首页</span></li>
          <li><span @click="switchTo('/cable')" :class="{on:$route.path.includes('/cable')}">数据线</span></li>
          <li><span @click="switchTo('/car_charger')" :class="{on:$route.path.includes('/car_charger')}">车充</span></li>
          <li><span @click="switchTo('/charger')" :class="{on:$route.path.includes('/charger')}">充电头</span></li>
          <li><span @click="switchTo('/hub')" :class="{on:$route.path.includes('/hub')}">拓展坞</span></li>
        </ul>
        <span @click="switchTo('/search')" :class="{on:$route.path.includes('/search')}">
          <input type="text" name="" placeholder="搜索">
        </span>
        <div v-if="userInfo.user_name" style="display: inline-block;float: right;" >
          <el-dropdown @command="handleCommand">
            <span class="el-dropdown-link">
              用户名：{{userInfo.user_name}}<i class="el-icon-arrow-down el-icon--right"></i>
            </span>
              <el-dropdown-menu slot="dropdown" >
                <el-dropdown-item command="/order_management">订单管理</el-dropdown-item>
                <el-dropdown-item command="/shopping_cart">购物车</el-dropdown-item>
                <el-dropdown-item divided command="dealLogout">退出登录</el-dropdown-item>
              </el-dropdown-menu>
            </el-dropdown>
        </div>
        <div v-else style="display: inline-block;float: right;">
          <span @click="switchTo('/login')" :class="{on:$route.path.includes('/login')}">登录</span>
          <span @click="switchTo('/regist')" :class="{on:$route.path.includes('/regist')}">注册</span>
        </div>
      </div>
    </header>
  </div>
</template>

<script>
  import {mapState,mapActions} from 'vuex';
  export default {
    name: "TopNav",
    computed: {
      ...mapState(['userInfo']),
      ...mapActions(["logout"])
    },
    methods:{
      switchTo(path){
        this.$router.replace(path);
      },
      handleCommand(command) {
        if (command == 'dealLogout') {
          this.dealLogout()
        }else {
          this.switchTo(command);
        }
      },
       dealLogout() {
        this.$confirm('是否退出登录?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning',
          callback: action => {
            if (action=='confirm') {
              this.logout({})
              // 回到主界面
              this.switchTo('/')
              this.$message({
                type: 'success',
                message: '退出成功!'
              });
            }else {
              this.$message({
                type: 'info',
                message: '取消退出登录!'
              });
            }
          }
        })
      }
    }
  }
</script>

<style scoped lang="stylus" ref="stylesheet/stylus">
  *{
    padding:0;
    margin:0;
  }
  li{
    list-style: none;
  }
  .el-dropdown-link {
    cursor: pointer;
    color: #409EFF;
  }
  .el-icon-arrow-down {
    font-size: 12px;
  }
  .el-dropdown-menu__item {
    list-style: none;
    line-height: 36px;
    padding: 0 20px;
    margin: 0;
  }
  .el-dropdown-menu{
    top:52px !important;
  }
  input:focus{
    outline: none;
  }
    .header {
      border: 1px solid #f5f5f5;
      box-shadow: -1px 1px 5px #888888;
      background-color #fff
      height 72px
      width 100%
      position fixed
      top 0
      left 50%
      transform translateX(-50%)
      z-index 999
    }
  header{
    width: 996px;
    margin: 0 auto;
    overflow: hidden;
    height: 72px;
    line-height: 72px;
    font-size: 18px;
    background-color #fff

  }
  .title_ico{
    float: left;
  }
  .title_ico img{
    width: 200px;
  }
  .pri_route{
    display: inline-block;
  }
  header .pri_route>li{
    display: inline-block;
    margin:0 10px;
  }
  .route_info{
    /*float: right;*/
  }
  .route_info input{
    display: inline-block;
    height: 30px;
    line-height: 30px;
    box-sizing: border-box;
    padding: 0 15px 0 30px;
    border: 1px solid #e3e3e3;
    outline: none;
    border-radius: 15px;
    color:#6a6f77;
    margin: 0 5px;
    transition: border-color 0.2s ease;
    background: #fff url(./images/search.png) 8px 5px no-repeat;
    background-size: 20px;
    vertical-align: middle !important;
  }
  .route_info
    cursor pointer
  .on
    font-size 22px
    color #1026f0

</style>

