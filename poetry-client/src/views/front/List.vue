<template>
    <div id="Index">
        <el-container>
            <el-header><mainHeader></mainHeader>
            </el-header>
            <el-container>
              <el-main>
                <div style="width: 1280px; margin: 0 auto">
                <div style="margin-bottom: 20px; display: flex; justify-content: center;">
                  <el-input v-model="q" placeholder="请输入诗词信息（诗词名称、作者、朝代、内容）" style="max-width: 600px"></el-input>
                  <el-button @click="getGoods" type="primary">查找</el-button>
                </div>

                <el-row style="margin-top: 20px" :gutter="10">
                  <el-col :span="24">
                    <el-row :gutter="10">
                      <el-col :span="4" v-for="(o, index) in goodses" :key="index" style="margin-bottom: 20px">
                      <el-card :body-style="{ padding: '0px' }" >
                        <img :src="o.picUrl" class="image" style="width: 100%;height:160px">
                        <div style="padding: 14px;">
                          <div class="name">{{o.goodsName}}</div>
                          <div class="bottom clearfix">
                            <el-button type="text" class="button" @click="detail(o.id)">查看详情</el-button>
                          </div>
                        </div>
                      </el-card>
                    </el-col>
                    </el-row>
                  <el-pagination
                  @current-change="handleCurrentChange"
                  :current-page="page"
                  style="margin-top: 20px"
                  background
                  layout="prev, pager, next"
                  :total="total">
                </el-pagination>
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
  name: "Index",
  data() {
    return {
      goodses: [],
      user: null,
      page: 1,
      pageSize: 10,
      total: 0,
      q: '',
      categoryId: '-1'
    };
  },
  components: {
    mainHeader
  },
  methods:{

    detail(id){
      this.$router.push({path: "detail", query: {id: id}});
    },

    getGoods: function(){
      var that = this;
      var page = this.page
      var pageSize = this.pageSize
      this.$axios.get(that.domain + "/api/goods/list", {params: {goodsName: this.q, page: page, limit: pageSize}}).then(
        function(res){
          var r = res.data;
          
          if(r.code == 0){
            that.goodses = r.goodsList;
            that.total = r.total;
          }
        }
      )
    },

    handleCurrentChange(e){
      this.page = e;
      this.getGoods();
    }
  },
  
  created(){
    var user = localStorage.getItem("fuser");
    if(user){
      this.user = JSON.parse(user);
    }else{
        
    }
    var q = this.$route.query.q;
    this.q = q;
    this.getGoods();
    
  }
};
</script>

<style scoped>

.title {
  font-size: 14px;
  font-weight: bold;
  margin: 10px;
  border-left: 3px solid #e64340;
  padding-left: 4px;
}

.name{
  white-space: nowrap;/*一行显示*/
  overflow: hidden;/*超出部分隐藏*/
  text-overflow: ellipsis;/*用...代替超出部分*/
}
</style>