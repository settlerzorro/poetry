<template>
    <div>
        <el-container>
            <el-header><mainHeader></mainHeader>
            </el-header>
            <el-container>
                <mainSidebar :active="active"></mainSidebar>
                <el-main>
                    <el-row :gutter="12">
                      <el-col :span="8">
                        <el-card shadow="always">
                          菜品数量
                          <div class="statistics">{{statistics.goodsTotal}}</div>
                        </el-card>
                      </el-col>
                      <el-col :span="8">
                        <el-card shadow="always">
                          用户数量
                          <div class="statistics">{{statistics.userTotal}}</div>
                        </el-card>
                      </el-col>
                      <el-col :span="8">
                        <el-card shadow="always">
                          订单数量
                          <div class="statistics">{{statistics.orderTotal}}</div>
                        </el-card>
                      </el-col>
                    </el-row>
                  <el-row>
                    <div id="main" style="width: 100%;height:400px;"></div>
                  </el-row>
                </el-main>
            </el-container>
        </el-container>
    </div>
</template>
<script>
import echarts from 'echarts'
import mainHeader from '../../components/admin-main-header'
import mainSidebar from '../../components/admin-main-sidebar'
export default {
  name: "AdminIndex",
  data() {
    return {
      statistics: {},
      user: null,
      asideStyle: {
        height: '500px'
      },
      active: '1'
    };
  },
  components: {
    mainHeader,
    mainSidebar
  },
  methods:{
    logout: function(){
      localStorage.removeItem("auser");
      localStorage.removeItem("atoken");
      this.$router.push("admin_login");
    },
    query: function() {
      var that = this;
      this.$axios.get(that.domain + "/statistics/query", {headers: {
            'token': localStorage.getItem("atoken")
        }}).then(
        function(res){
          var r = res.data;
          console.log(r)
          if(r.code == 0){
            that.statistics = r.statistics;
            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('main'));

            // 指定图表的配置项和数据
            var option = {
                title: {
                    text: ''
                },
                tooltip: {},
                legend: {
                    data:['销量']
                },
                xAxis: {
                    data: r.statistics.orderCountList.map(function(v){return v.createTime})
                },
                yAxis: {
                    minInterval: 1,
                },
                series: [{
                    name: '订单数量',
                    type:'line',
                    data: r.statistics.orderCountList.map(function(v){return v.count})
                }]
            };

            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
          }
        }
      )
		}
  },
  created(){
    var docHeight = document.documentElement.clientHeight;
    this.asideStyle.height = docHeight - 76 + "px";
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
.statistics{
  font-size: 20px; 
  margin-top: 10px; 
  font-weight: blod
}
</style>