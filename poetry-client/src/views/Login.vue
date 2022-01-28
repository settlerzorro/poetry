<template>
    <div>
      <el-container>
        <el-header>
          <div style="width: 1280px; margin: 0 auto" class="header">
          <a href="/#/" class="title">点餐外卖系统</a>
          </div>
        </el-header>
        <el-main>
          <div style="width: 1280px; margin: 0 auto">
          <el-row :gutter="10">
          <el-col :span="10" :offset="4">
            <el-image :src="loginImg"></el-image>
          </el-col>
          <el-col :span="10">
              <el-card class="box-card login-box">
                <div slot="header">
                  <span>用户登录</span>
                </div>
                <el-form>
                  <el-form-item>
                      <el-input v-model="loginForm.loginName" placeholder="用户名"></el-input>
                  </el-form-item>
                  <el-form-item>
                      <el-input v-model="loginForm.password" placeholder="密码" type="password"></el-input>
                  </el-form-item>
                  <el-form-item>
                      <el-button type="primary" @click="login">登录</el-button>
                      <el-button @click="register">注册</el-button>
                  </el-form-item>
                </el-form>
              </el-card>
          </el-col>
          </el-row>
          </div>
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
      loginImg: require('../assets/img/login-banner.jpg'),
      user: null,
      loginForm: {
        loginName: "",
        password: "",
      },
      loginBg: {
        
      }
    };
  },
  methods: {
      login(){
        var that = this;
        var data = "loginName="+that.loginForm.loginName+"&password="+that.loginForm.password;
        this.$axios({
            method: 'post',
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
            },
            url: that.domain + '/api/login',
            data: data
        }).then(function(res){
            console.log(res)
            if(res.data.code == 0){//登录成功
              localStorage.setItem("ftoken", res.data.token);
              localStorage.setItem("fuser", JSON.stringify(res.data.member));
              that.$router.push("/");
            }else{
              that.errorMsg = res.data.msg;
              that.$message.error(res.data.msg);
            }
        })
        
      },
      register(){
        this.$router.push("register");
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