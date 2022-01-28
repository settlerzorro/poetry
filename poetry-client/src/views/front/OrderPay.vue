<template>
    <div id="Index">
        <el-container>
            <el-header><mainHeader></mainHeader>
            </el-header>
            <el-container>
              <el-main>
                <div style="width: 1280px; margin: 0 auto; text-align: center">
                  <img alt="" :src="payImg" style="width: 300px; margin: 0 auto;">
        	        <div><span style="color: #d9534f;">￥{{order.totalAmount}}</span></div>
                  <div>
                  <el-button type="danger" @click="pay">立即支付</el-button>
                  </div>
                </div>
              </el-main>
            </el-container>
        </el-container>
    </div>
</template>
<script>
import mainHeader from '../../components/main-header'
export default {
  name: "Index",
  data() {
    return {
      goodsList: [],
      user: null,
      totalAmount: 0,
      order: {},
      payImg: require('../../assets/img/pay.jpg'),
    };
  },
  components: {
    mainHeader
  },
  methods:{
    pay: function(){
      var that = this;
      this.$axios.get(that.domain + "/api/order/pay", {params: {id: that.order.id}, headers:{ token: localStorage.getItem("ftoken") }}).then(
        function(res){
          var r = res.data;
          console.log(r)
          if(r.code == 0){
            alert("支付成功");
            that.$router.push("order");
          }
        }
      )
    },
    getOrder: function(id){
      var that = this;
      this.$axios.get(that.domain + "/api/order/detail", {params: {id: id}, headers:{ token: localStorage.getItem("ftoken") }}).then(
        function(res){
          var r = res.data;
          console.log(r)
          if(r.code == 0){
            that.order = r.order;
          }
        }
      )
    },
      
  },
  created(){
    var user = localStorage.getItem("fuser");
    if(user){
        this.user = JSON.parse(user);
    }else{
        
    }
    var id = this.$route.query.id;
    this.getOrder(id)
    
  }
};
</script>

<style scoped>


</style>