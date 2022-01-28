<template>
    <div>
      <el-container>
        <el-header>
          <div class="header">
            <a class="title">点餐外卖系统</a>
          </div>
        </el-header>
        <el-main>
          <el-row :gutter="10">
          <el-col :span="8" :offset="5">
            <el-image :src="loginImg"></el-image>
          </el-col>
          <el-col :span="10">
              <el-card class="box-card login-box">
                <div slot="header">
                  <span>管理员登录</span>
                </div>
                <el-form>
                  <el-form-item>
                      <el-input v-model="loginForm.username" placeholder="用户名"></el-input>
                  </el-form-item>
                  <el-form-item>
                      <el-input v-model="loginForm.password" placeholder="密码" type="password"></el-input>
                  </el-form-item>
                  <el-form-item>
                      <el-button type="primary" @click="login">登录</el-button>
                  </el-form-item>
                </el-form>
              </el-card>
          </el-col>
          </el-row>
        </el-main>
      </el-container>
    </div>
</template>
<script>
export default {
  name: "Login",
  data() {
    return {
      errorMsg: '',
      user: null,
      loginImg: require('../../assets/img/login-banner.jpg'),
      loginForm: {
        username: "",
        password: "",
      },
    };
  },
  methods: {
      login(){
        var that = this;
        var data = "username="+that.loginForm.username+"&password="+that.loginForm.password;
        this.$axios({
            method: 'post',
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
            },
            url: that.domain + '/sys/login',
            data: data
        }).then(function(res){
            console.log(res)
            if(res.data.code == 0){//登录成功
              localStorage.setItem("atoken", res.data.token);
              localStorage.setItem("auser", JSON.stringify(res.data.user));
              that.$router.push("admin_index");
            }else{
              that.errorMsg = res.data.msg;
              that.$message.error(res.data.msg);
            }
        })
        
      }
  },
  created(){
    
  }
};
</script>

<style scoped>
.login-box{
  width: 350px;
  margin-top: 0px;
}

.header, .footer {
  background-color: #409EFF;
  line-height: 58px;
}

a{
  color: #fff;
  font-size: 12px;
  text-decoration: none
}

.title{
  font-size: 18px;
}
</style>