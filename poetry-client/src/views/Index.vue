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
                  <el-button @click="query" type="primary">查找</el-button>
                </div>
                <el-carousel>
                  <el-carousel-item v-for="(item, index) in adverts" :key="index">
                    <el-image :src="item.picUrl" style="width: 100%; height: 100%"></el-image>
                  </el-carousel-item>
                </el-carousel>

                <el-row style="margin-top: 20px" :gutter="10">
                  <el-col :span="4">
                    <div>
                      <el-menu :default-active="categoryId">
                        <el-menu-item @click="selCategory(-1)" index="-1">全部</el-menu-item>
                        <el-menu-item @click="selCategory(c.id)" v-for="(c, index) in categories" :index="c.id" :key="index">{{c.categoryName}}</el-menu-item>
                      </el-menu>
                    </div>
                  </el-col>
                  <el-col :span="20">
                    <el-row :gutter="10">
                      <el-col :span="4" v-for="(o, index) in goodses" :key="index" style="margin-bottom: 20px">
                      <el-card :body-style="{ padding: '0px' }" >
                        <img :src="o.picUrl" class="image" style="width: 100%">
                        <div style="padding: 8px;">
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
import mainHeader from '../components/main-header'
export default {
  name: "Index",
  data() {
    return {
      categories: [],
      goodses: [],
      user: null,
      page: 1,
      pageSize: 12,
      adverts: [],
      total: 0,
      categoryId: '-1',
      q: ''
    };
  },
  components: {
    mainHeader
  },
  methods:{
    //查询广告
    getAdvert: function(){
      var that = this;
      this.$axios({url: that.domain + "/api/advert/list", data: {}}).then(
        function(res){
          var r = res.data;
          console.log(r)
          if(r.code == 0){
            that.adverts = r.advertList;
          }
        }
      )
    },
    
    getCategory: function(){
      var that = this;
      this.$axios({url: that.domain + "/api/category/list", data: {}}).then(
        function(res){
          var r = res.data;
          console.log(r)
          if(r.code == 0){
            that.categories = r.categoryList;
          }
        }
      )
    },

    detail(id){
      this.$router.push({path: "detail", query: {id: id}});
    },

    query(){
      var q = this.q;
      this.$router.push({path: "list", query: {q: q}});
    },

    getGoods: function(){
      var that = this;
      var page = this.page
      var pageSize = this.pageSize
      var categoryId = this.categoryId
      this.$axios.get(that.domain + "/api/goods/list", {params: {categoryId: categoryId, page: page, limit: pageSize}}).then(
        function(res){
          var r = res.data;
          console.log(r)
          if(r.code == 0){
            that.goodses = r.goodsList;
            that.total = r.total;
          }
        }
      )
    },

    selCategory(id){
      this.categoryId = id;
      this.getGoods();
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
    this.getAdvert();
    this.getCategory();
    this.getGoods();
  }
};
</script>

<style scoped>

.el-carousel__item h3 {
  color: #475669;
  font-size: 14px;
  opacity: 0.75;
  line-height: 150px;
  margin: 0;
}

.el-carousel__item:nth-child(2n) {
    background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n+1) {
    background-color: #d3dce6;
}

.name{
  white-space: nowrap;/*一行显示*/
  overflow: hidden;/*超出部分隐藏*/
  text-overflow: ellipsis;/*用...代替超出部分*/
}
</style>