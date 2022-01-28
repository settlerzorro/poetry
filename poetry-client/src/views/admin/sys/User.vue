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
                        <el-form-item label="登录名">
                            <el-input v-model="q.username" placeholder="登录名"></el-input>
                        </el-form-item>
                        <el-form-item>
                            <el-button type="primary" @click="query">查询</el-button>
                            <el-button type="warning" @click="add">新增</el-button>
                            <el-button type="success" @click="update">修改</el-button>
                            <el-button type="danger" @click="del">删除</el-button>
                        </el-form-item>
                    </el-form>
    
					<el-table
                        :data="tableList"
                        style="width: 100%"
                        @selection-change="handleSelectionChange">
                        <el-table-column
                          type="selection"
                          width="55">
                        </el-table-column>
						
                        <el-table-column
                            prop="username"
                            label="用户名"
                            >
                        </el-table-column>
												
												<el-table-column
                            prop="email"
                            label="邮箱"
                            >
                        </el-table-column>
												<el-table-column
                            prop="mobile"
                            label="手机号"
                            >
                        </el-table-column>
												<el-table-column
                            prop="status"
                            label="状态"
                            >
                            <template slot-scope="scope">
                              <el-tag type="info" v-if="scope.row.status == 0">禁用</el-tag>
                              <el-tag type="primary" v-if="scope.row.status == 1">启用</el-tag>
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
                  <el-form :model="user" label-width="120px">
                              <el-form-item label="用户名">
                      <el-input v-model="user.username"></el-input>
                  </el-form-item>
                  <el-form-item label="密码">
                      <el-input v-model="user.password"></el-input>
                  </el-form-item>
                  
                  <el-form-item label="邮箱">
                      <el-input v-model="user.email"></el-input>
                  </el-form-item>
                  <el-form-item label="手机号">
                      <el-input v-model="user.mobile"></el-input>
                  </el-form-item>
                  <el-form-item label="状态">
                      <el-radio-group v-model="user.status">
                        <el-radio :label="0">禁用</el-radio>
                        <el-radio :label="1">启用</el-radio>
                      </el-radio-group>
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
  name: "AdminUser",
  data() {
    return {
      tableList: [],
      user: {},
      showList: true,
      active: '99',
      q: {
        page: 1,
        limit: 10
      },
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
        this.$axios.get(that.domain + '/sys/user/list',
        {headers: {
            'token': localStorage.getItem("atoken")
        },
            params: that.q
        }).then(function(res){
            if(res.data.code == 0){//成功
              that.tableList = res.data.rows
              that.total = res.data.total
            }else{}
        })
      },
      onSubmit(e){
        var that = this;
        var data = this.user;
        var action = data.id == null ? "save" : "update";
        this.$axios.post(that.domain + '/sys/user/' + action, 
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
      },
      getInfo(id){
        var that = this;
        this.$axios.get(that.domain + '/sys/user/info/'+id,
        {headers: {
            'token': localStorage.getItem("atoken")
        },
            params: {}
        }).then(function(res){
            if(res.data.code == 0){//成功
              res.data.user.password = ''
              that.user = res.data.user
            }else{
              
            }
        })
      },
      update(){
      	if(this.ids.length != 1){
	        this.$message.info("请选择一条数据");
	        return;
        }
        this.showList = false
        this.getInfo(this.ids[0])
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
        this.$axios.post(that.domain + '/sys/user/delete',
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
      handleSelectionChange(e){
        var ids = [];
        for(var i = 0; i < e.length; i++){
            ids.push(e[i].id)
        }
        this.ids = ids;
      },
      handleCurrentChange(e){
          this.q.page = e;
          this.query();
      },
      handleSizeChange(e){
          this.q.limt = e;
          this.query();
      }
  },
  created(){
    this.query()
  }
};
</script>

<style scoped>

</style>