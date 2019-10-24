<template>
    <div id="app">
      <TopNav></TopNav>
      <router-view></router-view>
      <TabBar></TabBar>
    </div>
</template>

<script>
  import TopNav from './components/TopNav/TopNav'
  import TabBar from './components/TabBar/TabBar'

    export default {
      name: "App",
      created(){
        this.$store.dispatch('getUserInfo');
      },
      components:{
        TopNav,
        TabBar
      }
    }
</script>

<style scoped lang="stylus" ref="stylesheet/stylus">
  #app
    padding-top 72px
    a
      text-decoration none
</style>
