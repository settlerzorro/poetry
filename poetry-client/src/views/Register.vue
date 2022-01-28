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
                  <span>用户注册</span>
                </div>
                <el-form>
                  <el-form-item>
                      <el-input v-model="registerForm.loginName" placeholder="用户名"></el-input>
                  </el-form-item>
                  <el-form-item>
                      <el-input v-model="registerForm.password" placeholder="密码" type="password"></el-input>
                  </el-form-item>
                  <el-form-item>
                      <el-input v-model="registerForm.nickname" placeholder="昵称"></el-input>
                  </el-form-item>
                  <el-form-item>
                      <el-input v-model="registerForm.realName" placeholder="姓名"></el-input>
                  </el-form-item>
                  <el-form-item>
                      <el-input v-model="registerForm.mobile" placeholder="手机"></el-input>
                  </el-form-item>
                  <el-form-item>
                      <el-button type="primary" @click="register">注册</el-button>
                      <el-button @click="login">登录</el-button>
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
  name: "Register",
  data() {
    return {
      errorMsg: '',
      loginImg: require('../assets/img/login-banner.jpg'),
      user: null,
      registerForm: {
        loginName: "",
        password: "",
        realName: "",
        mobile: "",
        email: ""
      },
    };
  },
  methods: {
      login(){
        this.$router.push("/login");
      },
      register(){
        
        var that = this;
        var data = this.registerForm;
        this.$axios({
            method: 'post',
            url: that.domain + '/api/register',
            data: data
        }).then(function(r){
            console.log(r)
            if(r.data.code == 0){//注册成功
              that.$router.push("/login");
            }else{
              that.errorMsg = r.data.msg;
              that.$message.error(r.data.msg);
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