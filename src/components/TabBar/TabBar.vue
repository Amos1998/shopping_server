<template>
  <div id="footer">
    <div class="sistalk">
      <div class="summary">
        <p>深圳恒立通电子科技有限公司</p>
        <p><span></span>联系电话：0755-26652016</p>
        <p><span></span>热销电话：15217068819</p>
      </div>
    </div>
    <div class="copyright">
                <span>©2018 sistalk.cn All rights reserved.深圳恒立通电子科技有限公司
                &nbsp;&nbsp;&nbsp;&nbsp;
                <a href="http://www.beian.miit.gov.cn" target= "_blank">琼ICP备18004187</a>
                &nbsp;&nbsp;&nbsp;&nbsp;
            </span>
    </div>
  </div>
</template>

<script>
    export default {
        name:"TabBar"
    }
</script>

<style scoped lang="stylus" ref="stylesheet/stylus">
  a
    text-decoration none

  #footer
    margin-top:20px
    width 100%
    height auto
    background url(./img/footer.png) no-repeat
    background-repeat no-repeat
    font-size:22px

  #footer .sistalk
    width 990px
    margin 0 auto
    border-bottom 1px solid #e6e6e6

  #footer .sistalk:after
    display block
    height 0
    visibility hidden
    clear both
    content ""

  #footer .summary
    float left
    padding-top 20px
    padding-bottom 20px

  #footer .summary p
    padding-top 20px
    color #323333
    opacity 0.5

  #footer .border
    height 1rem
    width .1rem
    background #323333
    float left
    margin-left .5rem
    margin-right .5rem
    opacity .5
    position relative
    bottom -1.7rem

  #footer .copyright
    color #323333
    opacity .5
    text-align center
    line-height 10rem

  #footer .copyright a
    color #323333

  .swiper-pagination-bullet
    width 8px
    height 8px
    display inline-block
    border-radius 100%
    background #fff

  #play-video
    z-index 9999
    width 100%
    height 100%
    position fixed
    left 0
    top 0
    background #000000

  #play-video .video-box
    width 90%
    height 100%
    margin 0 auto

</style>
