<template>
    <div class="order_main">
      <div class="order_top">
        <span>全部订单</span>
        <span>待付款</span>
        <span>待收货</span>
      </div>

      <el-row class="">
        <el-col :md="4" class="car_information">订单详情</el-col>
        <el-col :md="4" class="car_information">收货人</el-col>
        <el-col :md="4" class="car_canshu">金额</el-col>
        <el-col :md="1" class="car_operation">操作</el-col>
      </el-row>
    </div>
</template>

<script>
    export default {
        name: "Order_management"
    }
</script>

<style scoped>
  .order_main {
    position: relative;
    width: 980px;
    margin: 0px auto;
    padding: 0px 0px;
    min-height: 250px;
  }
</style>
