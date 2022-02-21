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
                          古诗词数量
                          <div class="statistics">{{statistics.goodsTotal}}</div>
                        </el-card>
                      </el-col>
                      <el-col :span="8">
                        <el-card shadow="always">
                          用户数量
                          <div class="statistics">{{statistics.userTotal}}</div>
                        </el-card>
                      </el-col>
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