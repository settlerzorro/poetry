<template>
    <div>
        <el-container>
            <el-header><mainHeader></mainHeader>
            </el-header>
            <el-container>
                <mainSidebar :active="active"></mainSidebar>
                <el-main>
                     <div v-if="showList">
                    <el-form :inline="true" :model="q" class="demo-form-inline">
                        <el-form-item label="古诗词名称">
                            <el-input v-model="q.goodsName" placeholder="古诗词名称"></el-input>
                        </el-form-item>
                        <el-form-item>
                            <el-button type="primary" @click="query">查询</el-button>
                            <el-button type="success" @click="add">新增</el-button>
                            <el-button type="warning" @click="update">修改</el-button>
                            <el-button type="danger" @click="del">删除</el-button>
                        </el-form-item>
                    </el-form>
                        <el-table
                        :data="goodsList"
                        style="width: 100%"
                        @selection-change="handleSelectionChange">
                        <el-table-column
                          type="selection"
                          width="55">
                        </el-table-column>
                        <el-table-column
                            prop="picUrl"
                            label="图片"
                            >
                            <template slot-scope="scope">
                                <el-image
                                    style="width: 80px; height: 80px"
                                    :src="scope.row.picUrl"></el-image>
                            </template>
                        </el-table-column>
                        <el-table-column
                            prop="goodsName"
                            label="古诗词名称"
                            >
                        </el-table-column>
                        <el-table-column
                            prop="category.categoryName"
                            label="分类">
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
                        <el-form :model="goods" label-width="120px">
                            <el-form-item label="图片">
                                <el-upload
                                class="avatar-uploader"
                                action="http://127.0.0.1:10001/api/fileupload/upload"
                                list-type="picture-card"
                                multiple
                                :file-list="fileList"
                                :on-success="handleAvatarSuccess"
                                :before-upload="beforeAvatarUpload">
                                <i class="el-icon-plus avatar-uploader-icon"></i>
                                </el-upload>

                            </el-form-item>
                        <el-form-item label="菜品名称">
                            <el-input v-model="goods.goodsName"></el-input>
                        </el-form-item>
                        <el-form-item label="分类">
                            <el-select v-model="goods.categoryId" placeholder="请选择">
                                <el-option
                                v-for="item in categoryList"
                                :key="item.id"
                                :label="item.categoryName"
                                :value="item.id">
                                </el-option>
                            </el-select>
                        </el-form-item>
                        <el-form-item label="详情">
                            <quill-editor ref="text" v-model="goods.describe" :options="editorOption" style="height: 300px; margin-bottom: 50px;" />
                        </el-form-item>
                        <el-form-item>
                            <el-button type="primary" @click="onSubmit">保存</el-button>
                            <el-button @click="cancel">取消</el-button>
                        </el-form-item>
                        </el-form>
                    </div>
                </el-main>
            </el-container>
        </el-container>
    </div>
</template>
<script>
import { quillEditor } from 'vue-quill-editor'
import mainHeader from '../../../components/admin-main-header'
import mainSidebar from '../../../components/admin-main-sidebar'
import 'quill/dist/quill.core.css'
import 'quill/dist/quill.bubble.css'
import 'quill/dist/quill.snow.css'
export default {
  name: "Goods",
  data() {
    return {
      goodsList: [],
      total: 0,
      categoryList: [],
      q: {
        goodsName: '',
        page: 1,
        limit: 10
      },
      asideStyle: {
        height: '500px'
      },
      goods: {
          picUrl: ''
      },
      showList: true,
      editorOption: {},
      fileList: [],
      ids: [],
      active: '5'
    };
  },
  components: {
    quillEditor,
    mainHeader,
    mainSidebar
  },
  methods:{
      handleSizeChange(e){
          console.log(e)
          this.q.limit = e
          this.query();
      },
      handleCurrentChange(e){
          this.q.page = e;
          this.query()
          console.log(e)
      },
      query(){
        var that = this;
        this.$axios.get(that.domain + '/goods/list',
        { headers:{ token: localStorage.getItem("atoken") },
          params: that.q
        }).then(function(res){
            if(res.data.code == 0){//成功
              that.goodsList = res.data.rows
              that.total = res.data.total
            }else{
              
            }
        })
      },
      queryCategory(){
        var that = this;
        this.$axios.get(that.domain + '/category/listAll',
        {
            headers:{ token: localStorage.getItem("atoken") }
        }).then(function(res){
            if(res.data.code == 0){//成功
              that.categoryList = res.data.categoryList
            }else{
              
            }
        })
      },
      queryGoods(id){
        var that = this;
        this.$axios.get(that.domain + '/goods/info/'+id,
        {
            headers:{ token: localStorage.getItem("atoken") }
        }).then(function(res){
            if(res.data.code == 0){//成功
              that.goods = res.data.goods
              that.initImage(res.data.goods.picUrls)
            }else{
              
            }
        })
      },
      initImage(picUrls){
        this.fileList = picUrls.map(function(item, index){
            return {url: picUrls[index]}
        })
      },
      onSubmit(e){
        var that = this;
        var data = this.goods;
        data.picUrls = this.fileList.map(function(item, index){
            return item.url
        })
        data.picUrl = data.picUrls[0]
        var action = data.id == null ? "save" : "update";
        this.$axios.post(that.domain + '/goods/' + action, 
            data,
            {
                headers: {'token': localStorage.getItem("atoken")}
            }
        ).then(function(res){
            console.log(res)
            if(res.data.code == 0){//成功
              that.showList = true;
              that.query();
            }else{
              that.errorMsg = res.data.msg;
              that.$message.error(res.data.msg);
            }
        })
      },
      add(){
          this.showList = false
          this.goods = {
              picUrls: []
          }
      },
      cancel(){
          this.showList = true
      },
      update(){
        if(this.ids.length != 1){
            this.$message.info("请选择一条数据");
            return;
        }
        this.showList = false;
        this.queryGoods(this.ids[0]);
      },
      del(){
        if(this.ids.length == 0){
            this.$message.info("请选择数据");
            return;
        }
        var that = this;
        this.$axios.post(that.domain + '/goods/delete',
        that.ids,
        {
            headers: {'token': localStorage.getItem("atoken")}
        }).then(function(res){
            console.log(res)
            if(res.data.code == 0){//成功
              that.query();
            }else{
              that.errorMsg = res.data.msg;
              that.$message.error(res.data.msg);
            }
        })
      },
      upper(){
        if(this.ids.length == 0){
            this.$message.info("请选择数据");
            return;
        }
        var that = this;
        this.$axios.post(that.domain + '/goods/upper',
        that.ids,
        {
            headers: {'token': localStorage.getItem("atoken")}
        }).then(function(res){
            console.log(res)
            if(res.data.code == 0){//成功
              that.query();
            }else{
              that.errorMsg = res.data.msg;
              that.$message.error(res.data.msg);
            }
        })
      },
      lower(){
        if(this.ids.length == 0){
            this.$message.info("请选择数据");
            return;
        }
        var that = this;
        this.$axios.post(that.domain + '/goods/lower',
        that.ids,
        {
            headers: {'token': localStorage.getItem("atoken")}
        }).then(function(res){
            console.log(res)
            if(res.data.code == 0){//成功
              that.query();
            }else{
              that.errorMsg = res.data.msg;
              that.$message.error(res.data.msg);
            }
        })
      },
      handleAvatarSuccess(e){
          this.fileList.push({
              url: e.url
          });
      },
      beforeAvatarUpload(e){

      },
      handleSelectionChange(e){
        var ids = [];
        for(var i = 0; i < e.length; i++){
            ids.push(e[i].id)
        }
        this.ids = ids;
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
    this.queryCategory();
    this.editorOption = quillRedefine(
    {
        // 图片上传的设置
        uploadConfig: {
        action: that.domain + '/api/fileupload/upload',  // 必填参数 图片上传地址
        size: 500,  // 可选参数   图片限制大小，单位为Kb, 1M = 1024Kb
        accept: 'image/png, image/gif, image/jpeg, image/bmp, image/x-icon',  // 可选参数 可上传的图片格式
        // 必选参数  res是一个函数，函数接收的response为上传成功时服务器返回的数据
        // 你必须把返回的数据中所包含的图片地址 return 回去
        res: (respnse) => {
            return respnse.url
        },
        name: 'file'  // 图片上传参数名
        }
    }
    )
  }
};
</script>

<style scoped>

</style>