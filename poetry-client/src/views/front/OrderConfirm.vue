<template>
    <div id="Index">
        <el-container>
            <el-header><mainHeader></mainHeader>
            </el-header>
            <el-container>
              <el-main>
                <div style="width: 1280px; margin: 0 auto">
                <el-form label-width="80px">
                <el-form-item label="配送方式">
                    <el-radio-group v-model="distributionType">
                      <el-radio label="1">自取</el-radio>
                      <el-radio label="2">外送</el-radio>
                    </el-radio-group>
                </el-form-item>
                <div v-if="distributionType == 2">
                <div style="display: flex; margin-bottom: 10px">
                  <div v-if="orderShipment.contacts">
                    <div>
                      {{orderShipment.contacts}}({{orderShipment.mobile}})
                    </div>
                    <div>{{orderShipment.address}}</div>
                  </div>
                  <el-button type="text" @click="dialogTableVisible = true">选择地址</el-button>
                  </div>

                  <el-dialog title="收货地址" :visible.sync="dialogTableVisible">
                    <el-table :data="addressList">
                      <el-table-column property="contacts" label="姓名" width="150"></el-table-column>
                      <el-table-column property="mobile" label="手机号码" width="200"></el-table-column>
                      <el-table-column property="address" label="详细地址"></el-table-column>
                      <el-table-column property="opt" label="操作">
                        <template slot-scope="scope">
                          <el-button @click="addressClick(scope.row)" type="text" size="small">选择</el-button>
                        </template>
                      </el-table-column>
                    </el-table>
                  </el-dialog>
                </div>
                </el-form>
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
                   </el-table-column>
                  </el-table>
                  <div style="margin-top: 20px; display: flex; align-items: center">
                    <div class="price" style="flex: 1; text-align: right; padding-right: 10px">￥{{totalAmount}}</div>
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
      totalAmount: 0,
      orderShipment: {},
      distributionType: "1",
      dialogTableVisible: false,
      addressList: []
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
      var orderGoodsList = [];
      for(var i = 0; i < this.goodsList.length; i++){
        var orderGoods = {
            goodsId: this.goodsList[i].id,
            goodsName: this.goodsList[i].goodsName,
            price: this.goodsList[i].price,
            picUrl: this.goodsList[i].picUrl,
            num: 1
          }
        orderGoodsList.push(orderGoods);
      }
      var data = {
        totalAmount: this.totalAmount,
        orderGoodsList: orderGoodsList,
        orderShipment: this.orderShipment
      }

      var that = this;

      this.$axios.post(that.domain + "/api/order/create", data, {headers: {token: localStorage.getItem("ftoken")}}).then(
        function(res){
          var r = res.data;
          console.log(r)
          if(r.code === 0){
              alert("下单成功");
              that.$router.push({path: "orderPay", query: {id: r.id}});
            }else{
              alert(r.msg);
            }
        }
      )
    },
    addressClick(address){
      this.orderShipment.contacts = address.contacts;
      this.orderShipment.mobile = address.mobile;
      this.orderShipment.provinceName = address.provinceName
      this.orderShipment.cityName = address.cityName
      this.orderShipment.districtName = address.districtName
      this.orderShipment.address = address.address
      this.dialogTableVisible = false
    },
    getAddress(){
      var that = this;
      this.$axios.get(that.domain + '/api/memberaddress/list',
      {headers: {
          'token': localStorage.getItem("ftoken")
      },
          params: {}
      }).then(function(res){
          if(res.data.code == 0){//成功
            that.addressList = res.data.memberAddressList
            that.total = res.data.memberAddressList.length
          }else{}
      })
    }
      
  },
  created(){
    var user = localStorage.getItem("fuser");
    if(user){
        this.user = JSON.parse(user);
    }else{
        
    }
    // 获取下单数据
    var goodsList = localStorage.getItem('payGoods');
    if (goodsList) {
      this.goodsList = JSON.parse(goodsList);
      var totalAmount = 0;
      for(var i = 0; i < this.goodsList.length; i++){
        totalAmount += this.goodsList[i].price * this.goodsList[i].num;
      }
      this.totalAmount = totalAmount;
    }
    this.getAddress();
  }
};
</script>

<style scoped>

</style>