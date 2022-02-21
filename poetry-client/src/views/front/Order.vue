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
                        <el-menu-item route="order" index="2">我的收藏</el-menu-item>
                      </el-menu>
                    </div>
                  </el-col>
                  <el-col :span="20">
                    <el-tabs v-model="status" @tab-click="statusClick">
                      <el-tab-pane label="全部" name="-1"></el-tab-pane>
                    </el-tabs>
                    <div v-for="(order, index) in orderList" :key="index" style="background: #fff; border-bottom: 1px solid #ddd; padding: 10px">
                        <div class="orderList" style="cursor: pointer; margin-bottom: 8px" @click="detail(order.goodsId)">
                        <el-image alt="" :src="order.picUrl" style="width: 100px; height: 100px; margin-right: 10px"></el-image>
                        <div class="name" style="font-size: 16px; margin-bottom: 6px; display: inline-block; position: relative; top: -100px; left: 110px; width: calc(100% - 110px);">{{order.goodsName}}</div>
                        </div>
                        <div style="text-align: right;">
                          <el-button round  @click="cancel(order.id)" size="mini">取消收藏</el-button>
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
          } else if (res.data.code == 401) {
            that.$router.push("/login");
          } else {
            that.$message.error(res.data.msg);
          }
        }
      )
    },
    detail(id){
      this.$router.push({path: "detail", query: {id: id}});
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
      this.$axios.post(that.domain + "/api/order/delete?id=" + e, {}, {headers:{ token: localStorage.getItem("ftoken") }}).then(
        function(res){
          if(res.data.code == 0){
            that.getOrder();
          } else if (res.data.code == 401) {
            that.$router.push("/login");
          } else {
            that.$message.error(res.data.msg);
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
          } else if (res.data.code == 401) {
            that.$router.push("/login");
          } else {
            that.$message.error(res.data.msg);
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
.orderList:hover .name {
  color: #409EFF;
}

</style>