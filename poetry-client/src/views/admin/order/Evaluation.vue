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
                        <el-form-item label="内容">
                            <el-input v-model="q.content" placeholder="内容"></el-input>
                        </el-form-item>
                        <el-form-item>
                            <el-button type="primary" @click="query">查询</el-button>
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
                            prop="member.nickname"
                            label="用户"
                            >
                        </el-table-column>
												<el-table-column
                            prop="content"
                            label="评价内容"
                            >
                        </el-table-column>
												
												<el-table-column
                            prop="createTime"
                            label="评价时间"
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
                </el-main>
            </el-container>
        </el-container>
		</div>
</template>
<script>
import mainHeader from '../../../components/admin-main-header'
import mainSidebar from '../../../components/admin-main-sidebar'
export default {
  name: "AdminEvaluation",
  data() {
    return {
      ids: [],
      tableList: [],
      evaluation: {},
      showList: true,
      active: '7',
      q: {
        page: 1,
        limit: 10,
        content: ''
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
        this.$axios.get(that.domain + '/evaluation/list',
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
        var data = this.evaluation;
        var action = data.id == null ? "save" : "update";
        this.$axios.post(that.domain + '/evaluation/' + action, 
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
        this.$axios.get(that.domain + '/evaluation/info/'+id,
        {headers: {
            'token': localStorage.getItem("atoken")
        }},{
            params: {}
        }).then(function(res){
            if(res.data.code == 0){//成功
              that.evaluation = res.data.evaluation
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
        this.$axios.post(that.domain + '/evaluation/delete',
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