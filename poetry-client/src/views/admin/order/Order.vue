<template>
    <div>
        <el-container>
            <el-header>
                <mainHeader></mainHeader>
            </el-header>
            <el-container>
                <mainSidebar :active="active"></mainSidebar>
                <el-main>
                    <div v-if="showList">
                    <el-form :inline="true" :model="q" class="demo-form-inline">
                        <el-form-item label="订单编号">
                            <el-input v-model="q.orderNumber" placeholder="订单编号"></el-input>
                        </el-form-item>
                        <el-form-item>
                            <el-button type="primary" @click="query">查询</el-button>
                            <el-button type="warning" @click="sendGoods">配送</el-button>
                        </el-form-item>
                    </el-form>
                        <el-table
                        :data="orderList"
                        style="width: 100%"
                        @selection-change="handleSelectionChange">
                        <el-table-column
                          type="selection"
                          width="55">
                        </el-table-column>
                        <el-table-column
                            prop="orderNumber"
                            label="订单编号">
                            <template slot-scope="scope">
                              <el-link type="primary" @click="detail(scope.row.id)">{{scope.row.orderNumber}}</el-link>
                            </template>
                        </el-table-column>
                        <el-table-column
                            prop="member.realName"
                            label="姓名">
                        </el-table-column>
                        <el-table-column
                            prop="totalAmount"
                            label="价格">
                        </el-table-column>
                        <el-table-column
                            prop="orderStatus"
                            label="状态">
                            <template slot-scope="scope">
                              <el-tag type="info" v-if="scope.row.orderStatus == 0">已取消</el-tag>
                              <el-tag type="primary" v-if="scope.row.orderStatus == 1">待付款</el-tag>
                              <el-tag type="success" v-if="scope.row.orderStatus == 2">待配送</el-tag>
                              <el-tag type="warning" v-if="scope.row.orderStatus == 3">待收货</el-tag>
                              <el-tag type="danger" v-if="scope.row.orderStatus == 4">已完成</el-tag>
                              <el-tag type="danger" v-if="scope.row.orderStatus == 5">已评价</el-tag>
                            </template>
                        </el-table-column>
                        <el-table-column
                            prop="createTime"
                            label="创建时间">
                        </el-table-column>
                        </el-table>
                        <el-pagination
                            @size-change="handleSizeChange"
                            @current-change="handleCurrentChange"
                            :current-page="q.page"
                            :page-sizes="[10, 50, 100]"
                            :page-size="q.limit"
                            layout="total, sizes, prev, pager, next, jumper"
                            :total="total">
                        </el-pagination>
                    </div>
                    <div v-if="!showList">
                        <h3>基本信息</h3>
                        <el-row :gutter="10">
                        <el-col :span="6"><div>订单编号：{{order.orderNumber}}</div></el-col>
                        <el-col :span="6"><div>姓名：{{order.member.realName}}</div></el-col>
                        <el-col :span="6"><div>联系电话：{{order.member.mobile}}</div></el-col>
                        <el-col :span="6"><div>订单状态：{{order.orderStatus == 0 ? '已取消': order.orderStatus == 1? '待付款': order.orderStatus == 2? '待配送': order.orderStatus == 3? '待收货': order.orderStatus == 4? '已完成': '' }}</div></el-col>
                        </el-row>

                        <el-divider></el-divider>
                        <h3>菜品信息</h3>
                        <el-row>
                            <el-table
                            :data="order.orderGoodsList"
                            style="width: 100%">
                            <el-table-column
                                prop="picUrl"
                                label="菜品图片">
                                <template slot-scope="scope">
                                    <el-image
                                        style="width: 80px; height: 80px"
                                        :src="scope.row.picUrl"></el-image>
                                </template>
                            </el-table-column>
                            <el-table-column
                                prop="goodsName"
                                label="菜品名称">
                            </el-table-column>
                            <el-table-column
                                prop="num"
                                label="数量">
                            </el-table-column>
                            <el-table-column
                                prop="price"
                                label="价格">
                            </el-table-column>
                            </el-table>
                        </el-row>
                        <el-button @click="cancel" style="margin-top: 20px">返回</el-button>

                    </div>
                </el-main>
            </el-container>
        </el-container>
    </div>
</template>
<script>
import mainHeader from '../../../components/admin-main-header'
import mainSidebar from '../../../components/admin-main-sidebar'
export default {
  name: "Order",
  data() {
    return {
      q:{
          page: 1,
          limit: 10,
          orderNumber: ''
      },
      orderList: [],
      showList: true,
      order: {
          goodsList: [],
          member: {}
      },
      active: '6',
      total: 0
    };
  },
  components: {
    mainHeader,
    mainSidebar
  },
  methods:{
      query(){
        var that = this;
        this.$axios.get(that.domain + '/order/list',{
            params: that.q,
            headers: {'token': localStorage.getItem("atoken")}
        }).then(function(res){
            console.log(res)
            if(res.data.code == 0){//成功
              that.orderList = res.data.rows
              that.total = res.data.total
            }else{
              
            }
        })
      },
      detail(id){
        var that = this;
        this.showList = false;
        this.$axios.get(that.domain + '/order/info/' + id,{
            params: {},
            headers: {'token': localStorage.getItem("atoken")}
        }).then(function(res){
            console.log(res)
            if(res.data.code == 0){//成功
              that.order = res.data.order
            }else{
              
            }
        })
      },
      cancel(){
        this.showList = true;
      },
      sendGoods(){
        var that = this;
        if(this.ids.length != 1){
          this.$message.info("请选择一条数据");
          return;
        }
        var id = this.ids[0];
        this.$axios.get(that.domain + '/order/sendGoods/' + id,{
            params: {
              courierNum: ''
            },
            headers: {'token': localStorage.getItem("atoken")}
        }).then(function(res){
            console.log(res)
            if(res.data.code == 0){//成功
              that.query();
            }else{
              
            }
        })
      },
      handleSelectionChange(e){
        var ids = [];
        for(var i = 0; i < e.length; i++){
            ids.push(e[i].id)
        }
        this.ids = ids;
      },
      logout(e){
        localStorage.removeItem("auser");
        this.$router.push("admin_login");
      },
      handleSizeChange(e){
          console.log(e)
          this.q.limit = e
          this.query();
      },
      handleCurrentChange(e){
          this.q.page = e;
          this.query()
          console.log(e)
      }
  },
  created(){
    var user = localStorage.getItem("auser");
    if(user){
        this.user = JSON.parse(user);
    }else{
        this.$router.push("admin_login");
    }
    this.query();
  }
};
</script>

<style scoped>

</style>