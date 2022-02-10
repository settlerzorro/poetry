<template>
    <div id="Index">
        <el-container>
            <el-header><mainHeader></mainHeader>
            </el-header>
            <el-container>
              <el-main>
                <div style="width: 1280px; margin: 0 auto">
                <el-row style="margin-top: 20px" :gutter="10">
                  <el-col :span="4">
                    <div>
                      <el-menu router default-active="3">
                        <el-menu-item route="user" index="1">用户信息</el-menu-item>
                        <el-menu-item route="order" index="2">我的收藏</el-menu-item>
                        <el-menu-item route="address" index="3">我的收藏</el-menu-item>
                      </el-menu>
                    </div>
                  </el-col>
                  <el-col :span="20">
                  <div v-if="showList">
                    <el-form :inline="true" :model="q" class="demo-form-inline">
                        
                        <el-form-item>
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
                            prop="contacts"
                            label="联系人"
                            >
                        </el-table-column>
												<el-table-column
                            prop="mobile"
                            label="手机"
                            >
                        </el-table-column>
												
												<el-table-column
                            prop="provinceName"
                            label="省"
                            >
                        </el-table-column>
												
												<el-table-column
                            prop="cityName"
                            label="市"
                            >
                        </el-table-column>
												
												<el-table-column
                            prop="districtName"
                            label="区"
                            >
                        </el-table-column>
												<el-table-column
                            prop="address"
                            label="详细地址"
                            >
                        </el-table-column>
												
												<el-table-column
                            prop="updateTime"
                            label="更新时间"
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
                        <el-form :model="memberAddress" label-width="120px">
                        
                        <el-form-item label="联系人">
                            <el-input v-model="memberAddress.contacts"></el-input>
                        </el-form-item>
                        <el-form-item label="手机">
                            <el-input v-model="memberAddress.mobile"></el-input>
                        </el-form-item>
                        <el-form-item label="省市区">
                            <el-cascader
                              size="large"
                              :options="options"
                              v-model="selectedOptions"
                              @change="handleChange">
                            </el-cascader>
                        </el-form-item>
                        <el-form-item label="详细地址">
                            <el-input v-model="memberAddress.address"></el-input>
                        </el-form-item>
                        
                        <el-form-item>
                            <el-button type="primary" @click="onSubmit">保存</el-button>
                            <el-button @click="cancel">取消</el-button>
                        </el-form-item>
                        </el-form>
                        </div>
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
import { regionData, CodeToText } from 'element-china-area-data'
export default {
  name: "Index",
  data() {
    return {
      tableList: [],
      memberAddress: {},
      showList: true,
      active: '4',
      q: {
        page: 1,
        limit: 10
      },
      total: 0,
      options: regionData,
      selectedOptions: []
    };
  },
  components: {
    mainHeader
  },
  methods:{
    query(){
        var that = this;
        this.$axios.get(that.domain + '/api/memberaddress/list',
        {headers: {
            'token': localStorage.getItem("ftoken")
        },
            params: that.q
        }).then(function(res){
            if(res.data.code == 0){//成功
              that.tableList = res.data.memberAddressList
              that.total = res.data.memberAddressList.length
            }else{}
        })
      },
      onSubmit(e){
        var that = this;
        var data = this.memberAddress;
        var provinceName = CodeToText[this.selectedOptions[0]]
        var cityName = CodeToText[this.selectedOptions[1]]
        var districtName = CodeToText[this.selectedOptions[2]]
        data.provinceName = provinceName;
        data.cityName = cityName;
        data.districtName = districtName
        var action = data.id == null ? "add" : "update";
        this.$axios.post(that.domain + '/api/memberaddress/' + action, 
            data,
            {
                headers: {'token': localStorage.getItem("ftoken")}
            }
        ).then(function(res){
            
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
        this.$axios.get(that.domain + '/api/memberaddress/detail?id='+id,
        {headers: {
            'token': localStorage.getItem("ftoken")
        },
            params: {}
        }).then(function(res){
            if(res.data.code == 0){//成功
              that.memberAddress = res.data.memberAddress
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
        if(this.ids.length != 1){
            this.$message.info("请选择一条数据");
            return;
        }
        var that = this;
        this.$axios.get(that.domain + '/api/memberaddress/delete',
            {
                params: {id: that.ids[0]},
                headers: {'token': localStorage.getItem("ftoken")}
            }).then(function(res){
            
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
      },
      handleChange (value) {        
      }

  },
  created(){
    var user = localStorage.getItem("fuser");
    if(user){
        this.user = JSON.parse(user);
    }else{
        this.$router.push("login");
    }
    this.query();
  }
};
</script>

<style scoped>

</style>