<template>
    <div id="Index">
        <el-container>
            <el-header><mainHeader></mainHeader></el-header>
            <el-container>
              <el-main>
                <div style="width: 1280px; margin: 0 auto">
                <el-table
                  :data="goodsList"
                  style="width: 100%">
                  <el-table-column
                      prop="picUrl"
                      label="图片">
                      <template slot-scope="scope">
                          <el-image
                              style="width: 80px; height: 80px"
                              :src="scope.row.picUrl"></el-image>
                      </template>
                  </el-table-column>
                  <el-table-column
                      prop="goodsName"
                      label="菜品名">
                  </el-table-column>
                  <el-table-column
                      prop="price"
                      label="价格">
                  </el-table-column>
                  <el-table-column
                      prop="num"
                      label="数量">
                      <template slot-scope="scope">
                          <el-input-number v-model="scope.row.num" @change="numChange" bin :min="1" :max="10"></el-input-number>
                      </template>
                   </el-table-column>
                   <el-table-column
                      prop="price"
                      label="操作">
                      <template slot-scope="scope">
                          <el-link icon="el-icon-remove" @click="del(scope.$index)">删除</el-link>
                      </template>
                  </el-table-column>
                   
                  </el-table>
                  <div style="margin-top: 20px; display: flex; align-items: center">
                    <div class="price" style="flex: 1; text-align: right; margin-right: 10px">￥{{totalAmount}}</div>
                    <el-button type="danger" @click="buy">立即下单</el-button>
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
      totalAmount: 0
    };
  },
  components: {
    mainHeader
  },
  methods:{
    buy: function(){
      if(this.goodsList.length == 0){
        alert("请先选择菜品")
        return
      }
      var goodsList = this.goodsList;
      localStorage.setItem("payGoods", JSON.stringify(goodsList));
      this.$router.push("orderConfirm");
     
    },
    del(e){
      this.goodsList.splice(e, 1);
      var totalAmount = 0;
      for(var i = 0; i < this.goodsList.length; i++){
        totalAmount += this.goodsList[i].price * this.goodsList[i].num;
      }
      this.totalAmount = totalAmount;
      localStorage.setItem("shopCart", JSON.stringify(this.goodsList));
    },
    numChange(e){
      console.log(this.goodsList);
      var totalAmount = 0;
      for(var i = 0; i < this.goodsList.length; i++){
        totalAmount += this.goodsList[i].price * this.goodsList[i].num;
      }
      this.totalAmount = totalAmount;
      localStorage.setItem("shopCart", JSON.stringify(this.goodsList));
    }
      
  },
  created(){
    var user = localStorage.getItem("fuser");
    if(user){
        this.user = JSON.parse(user);
    }else{
        
    }
    // 获取购物车数据
    var goodsList = localStorage.getItem('shopCart');
    if (goodsList) {
      this.goodsList = JSON.parse(goodsList);
      var totalAmount = 0;
      for(var i = 0; i < this.goodsList.length; i++){
        totalAmount += this.goodsList[i].price * this.goodsList[i].num;
      }
      this.totalAmount = totalAmount;
    }
  }
};
</script>

<style scoped>

</style>