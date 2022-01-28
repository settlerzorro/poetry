<template>
    <div id="Index">
        <el-container>
            <el-header><mainHeader></mainHeader>
            </el-header>
            <el-container>
              <el-main>
                <div style="width: 1280px; margin: 0 auto">
                <el-row :gutter="10">
                <el-col :span="6">
                  <div class="grid-content bg-purple">
                    <el-image
                      style="width: 250px; height: 250px"
                      :src="goods.picUrl"></el-image>
                  </div>
                </el-col>
                <el-col :span="18">
                  <div class="grid-content bg-purple">
                    <div>
                      <p>{{goods.goodsName}}</p>  
                      <p class="price">￥{{goods.price}}</p>  
                    </div>
                    <div>
                      <el-button type="warning" @click="addShopCart">加入购物车</el-button>
                      <el-button type="danger" @click="buy">立即下单</el-button>
                    </div>
                  </div>
                </el-col>
              </el-row>
               <el-tabs v-model="activeName" type="card" @tab-click="handleClick">
                <el-tab-pane label="详情" name="1">
                  <div v-html="goods.describe"></div>
                </el-tab-pane>
                <el-tab-pane label="评价" name="2">
                  <div style="margin-bottom: 10px; text-align: right" hidden>
                    <el-button @click="dialogFormVisible = true" type="primary">评价</el-button>
                  </div>
                  <div class="comment" v-for="(comment, index) in evaluations" :key="index">
                    <div class="user">
                      <img class="media-object avatar" :src="comment.member.avatarUrl" alt="">
                      <div class="nickname">{{comment.member.nickname}}</div>
                      <div class="time">
                        <div>{{comment.createTime}}</div>
                      </div>
                    </div>
                    <div class="content">
                      {{comment.content}}
                    </div>
                  </div>
                  
                  <el-dialog title="评价" :visible.sync="dialogFormVisible">
                  <el-form>
                    <el-form-item>
                      <el-input type="textarea" v-model="content" autocomplete="off" placeholder="评价内容"></el-input>
                    </el-form-item>
                  </el-form>
                  <div slot="footer" class="dialog-footer">
                    <el-button @click="dialogFormVisible = false">取 消</el-button>
                    <el-button type="primary" @click="confirm">确 定</el-button>
                  </div>
                </el-dialog>
                </el-tab-pane>
              </el-tabs>
                </div>
              </el-main>
            </el-container>
        </el-container>
    </div>
</template>
<script>
import mainHeader from '../../components/main-header'
export default {
  name: "Detail",
  data() {
    return {
      categories: [],
      goods: {
        picUrl: ''
      },
      user: null,
      page: 1,
			pageSize: 8,
      activeName: '2',
      evaluations: [],
      content: '',
      dialogFormVisible: false,
      id: ''
    };
  },
  components: {
    mainHeader
  },
  methods:{
    getGoods: function(id){
      var that = this;
      this.$axios.get(that.domain + "/api/goods/detail", {params: {id: id}}).then(
        function(res){
          var r = res.data;
          console.log(r)
          if(r.code == 0){
            that.goods = r.goods;
          }
        }
      )
    },
    getEvaluation: function(){
      var that = this;
      var id = this.id;
      this.$axios.get(that.domain + "/api/order/evaluation/list", {params: {goodsId: id}}).then(
        function(res){
          var r = res.data;
          if(r.code == 0){
            that.evaluations = r.evaluations;
          }
        }
      )
    },
    handleClick(e){
      console.log(e)
    },
    confirm(){
      var that = this;
      var data = {
        content: this.content,
        goodsId: this.goods.id
      };
      this.$axios.post(that.domain + '/api/order/evaluation/save', 
          data,
          {
              headers: {'token': localStorage.getItem("ftoken")}
          }
      ).then(function(res){
          if(res.data.code == 0){//成功
            that.dialogFormVisible = false
            that.getEvaluation();
          }else{
            that.$message.error(res.data.msg);
          }
      })
    },
    addShopCart: function (e) {
      // 加入购物车
      var goodsList = localStorage.getItem("shopCart");
      var goods = this.goods;
      var num = 1;
      var isExist = false;
      if (goodsList) {
        goodsList = JSON.parse(goodsList);
        for (var i = 0; i < goodsList.length; i++) {
          if (goodsList[i].id == goods.id) {
            goodsList[i].num += 1;
            isExist = true;
            break;
          }
        }
        if(!isExist){
          var temp = {
            id: goods.id,
            goodsName: goods.goodsName,
            picUrl: goods.picUrl,
            price: goods.price,
            num: num
          }
          goodsList.push(temp);
        }
        
      } else {
        goodsList = [{
          id: goods.id,
          goodsName: goods.goodsName,
          picUrl: goods.picUrl,
          price: goods.price,
          num: 1
        }];
      }
      localStorage.setItem("shopCart", JSON.stringify(goodsList));
      alert("加入购物车成功");
    },
    buy: function(){
      var goods = this.goods;
      var goodsList = [{
          id: goods.id,
          goodsName: goods.goodsName,
          picUrl: goods.picUrl,
          price: goods.price,
          num: 1
      }];
      localStorage.setItem("payGoods", JSON.stringify(goodsList));
      this.$router.push("orderConfirm");
    }
  },
  created(){
    var user = localStorage.getItem("fuser");
    if(user){
        this.user = JSON.parse(user);
    }else{
        
    }

    var id = this.$route.query.id;
    this.getGoods(id)
    this.id = id;
    this.getEvaluation()
  }
};
</script>

<style scoped>

.comment{
  border-bottom: 1px solid #ddd;
  margin-bottom: 10px;
  padding-bottom: 10px;
}

.time{
  color: #999;
  font-size: 12px
}

.avatar{
  width: 30px;
  height: 30px;
  border-radius: 50%;
}

.user{
	display: flex;
	align-items: center;
	margin-bottom: 6px;
}

.user .nickname{
	flex: 1
}

.user .avatar{
	width: 30px;
	height: 30px;
	margin-right: 4px
}

.user .like img{
	width: 20px;
	height: 20px;
	margin-top: 8px;
	margin-right: 16px;
	margin-left: 16px
}

</style>