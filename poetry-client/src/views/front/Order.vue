<template>
    <div id="Index">
        <el-container>
            <el-header><mainHeader></mainHeader>
            </el-header>
            <el-container>
              <el-main>
                <div style="width: 1280px; margin: 0 auto">
                <el-row style="margin-top: 20px" :gutter="10">
                  <el-col :span="4">
                    <div>
                      <el-menu router default-active="2">
                        <el-menu-item route="user" index="1">用户信息</el-menu-item>
                        <el-menu-item route="order" index="2">我的订单</el-menu-item>
                        <el-menu-item route="address" index="3">我的地址</el-menu-item>
                      </el-menu>
                    </div>
                  </el-col>
                  <el-col :span="20">
                    <el-tabs v-model="status" @tab-click="statusClick">
                      <el-tab-pane label="全部" name="-1"></el-tab-pane>
                      <el-tab-pane label="待付款" name="1"></el-tab-pane>
                      <el-tab-pane label="待配送" name="2"></el-tab-pane>
                      <el-tab-pane label="待收货" name="3"></el-tab-pane>
                      <el-tab-pane label="已完成" name="4"></el-tab-pane>
                    </el-tabs>
                    <div v-for="(order, index) in orderList" :key="index" style="background: #fff; border-bottom: 1px solid #ddd; padding: 10px">
                        <div style="display: flex; margin-bottom: 4px">
                          <span style="flex: 1; font-size: 14px; color: #555">订单编号：{{order.orderNumber}}</span>
                          <span style="font-size: 14px; color: #555">{{order.createTime}}</span>
                        </div>
                        <div class="goods" v-for="(goods, index) in order.orderGoodsList" :key="index" style="display: flex; margin-bottom: 4px">
                          <el-image alt="" :src="goods.picUrl" style="width: 100px; height: 100px; margin-right: 10px"></el-image>
                          <div style="flex: 1">
                            <div style="font-size: 16px; margin-bottom: 6px">{{goods.goodsName}}</div>
                            <div class="price">￥{{goods.price}}</div>
                          </div>
                        </div>
                        
                        <div style="text-align: right;">
                          <span class="price">￥{{order.totalAmount}}</span>
                          <el-button type="info" round v-if="order.orderStatus == 1" @click="cancel(order.id)" size="mini">取消</el-button>
                          <el-button type="primary" round v-if="order.orderStatus == 1" @click="pay(order.id)" size="mini">支付</el-button>
                          <el-button type="success" round v-if="order.orderStatus == 3" @click="complete(order.id)" size="mini">完成</el-button>
                        </div>
                    </div>
                  </el-col>
                </el-row>
                </div>
              </el-main>
            </el-container>
        </el-container>
    </div>
</template>
<script>
import mainHeader from '../../components/main-header'
export default {
  name: "Order",
  data() {
    return {
      orderList: [],
      user: null,
      page: 1,
			pageSize: 8,
      status: "-1"
    };
  },
  components: {
    mainHeader
  },
  methods:{
    getOrder: function(){
      var that = this;
      this.$axios.get(that.domain + "/api/order/list", {params: {
        orderStatus: that.status
      }, headers:{ token: localStorage.getItem("ftoken") }}).then(
        function(res){
          var r = res.data;
          console.log(r)
          if(r.code == 0){
            that.orderList = r.orderList;
          }
        }
      )
    },
    statusClick(e){
      this.status = e.name;
      this.getOrder();
    },
    pay(e) {
      this.$router.push({path: "orderPay", query: {id: e}});
    },
    cancel(e){
      var that = this;
      this.$axios.get(that.domain + "/api/order/cancel", {
        params: {
          id: e
        }, 
        headers:{ token: localStorage.getItem("ftoken") 
        }}).then(
        function(res){
          if(res.data.code == 0){
            that.getOrder();
          }
        }
      )
    },
    complete(e){
      var that = this;
      this.$axios.get(that.domain + "/api/order/confirm", {
        params: {
          id: e
        }, 
        headers:{ token: localStorage.getItem("ftoken") 
        }}).then(
        function(res){
          if(res.data.code == 0){
            that.getOrder();
          }
        }
      )
    },
    logout(){
      localStorage.removeItem("fuser");
      this.$router.push("login");
    }
  },
  created(){
    var user = localStorage.getItem("fuser");
    if(user){
        this.user = JSON.parse(user);
    }else{
        
    }
    this.getOrder();
  }
};
</script>

<style scoped>


</style>