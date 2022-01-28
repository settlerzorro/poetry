<template>
    <div>
        <el-container>
            <el-header>
              <mainHeader></mainHeader>
            </el-header>
            <el-container>
                <mainSidebar :active="active"></mainSidebar>
                <el-main>
                    <el-form :inline="true" :model="q" class="demo-form-inline">
                        <el-form-item>
                            <el-button type="primary" @click="add">新增</el-button>
                            <el-button type="warning" @click="update">修改</el-button>
                            <el-button type="danger" @click="del">删除</el-button>
                        </el-form-item>
                    </el-form>
                        <div v-if="showList">
                        <el-table
                        :data="advertList"
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
                                    style="width: 150px"
                                    :src="scope.row.picUrl"></el-image>
                            </template>
                        </el-table-column>
                        <el-table-column
                            prop="sort"
                            label="排序"
                            >
                        </el-table-column>
                        <el-table-column
                            prop="enable"
                            label="状态">
                            <template slot-scope="scope">
                              <el-tag type="info" v-if="scope.row.enable == 0">禁用</el-tag>
                              <el-tag type="primary" v-if="scope.row.enable == 1">启用</el-tag>
                            </template>
                        </el-table-column>
                        <el-table-column
                            prop="createTime"
                            label="创建时间"
                            >
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
                        <el-form :model="advert" label-width="120px">
                            <el-form-item label="图片">
                                <el-upload
                                class="avatar-uploader"
                                action="http://127.0.0.1:10001/api/fileupload/upload"
                                :on-success="handleAvatarSuccess"
                                :before-upload="beforeAvatarUpload">
                                <img v-if="advert.picUrl" :src="advert.picUrl" class="avatar">
                                <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                                </el-upload>
                            </el-form-item>
                            <el-form-item>
                                <el-radio-group v-model="advert.enable">
                                  <el-radio :label="0">禁用</el-radio>
                                  <el-radio :label="1">启用</el-radio>
                                </el-radio-group>

                            </el-form-item>
                        <el-form-item label="排序">
                            <el-input v-model="advert.sort"></el-input>
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
import mainHeader from '../../../components/admin-main-header'
import mainSidebar from '../../../components/admin-main-sidebar'
export default {
  name: "AdminAdvert",
  data() {
    return {
      advertList: [],
      q: {
        page: 1,
        limit: 10
      },
      showList: true,
      advert: {
          picUrl: ''
      },
      active: '3',
      total: 0,
      ids: []
    };
  },
  components: {
    mainHeader,
    mainSidebar
  },
  methods:{
      query(){
        var that = this;
        this.$axios.get(that.domain + '/advert/list',
        {
            headers:{
                'token': window.localStorage.getItem('atoken')
            },
            params: that.q
        }
        ).then(function(res){
            if(res.data.code == 0){//成功
              that.advertList = res.data.rows
              that.data.total = res.data.total
            }else{
              
            }
        })
      },
      queryAdvert(id){
        var that = this;
        this.$axios.get(that.domain + '/advert/info/'+id,
        {
            headers:{ token: localStorage.getItem("atoken") }
        }).then(function(res){
            if(res.data.code == 0){//成功
              that.advert = res.data.advert
            }else{
              
            }
        })
      },
      onSubmit(e){
        var that = this;
        var data = this.advert;
        var action = data.id == null ? "save" : "update";
        this.$axios.post(that.domain + '/advert/'+action, 
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
          this.advert = {}
      },
      update(){
        if(this.ids.length != 1){
            this.$message.info("请选择一条数据");
            return;
        }
        this.showList = false;
        this.queryAdvert(this.ids[0]);
      },
      cancel(){
          this.showList = true
      },
      del(){
        if(this.ids.length == 0){
            this.$message.info("请选择数据");
            return;
        }
        var that = this;
        this.$axios.post(that.domain + '/advert/delete',
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
          console.log(e)
          this.advert.picUrl = e.url
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
    var user = localStorage.getItem("auser");
    if(user){
        this.user = JSON.parse(user);
    }else{
        this.$router.push("Login");
    }
    this.query()
  }
};
</script>

<style scoped>

</style>