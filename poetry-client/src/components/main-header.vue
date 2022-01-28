<template>
  <div class="header" style="width: 1280px; margin: 0 auto"><a class="title" href="/#/">点餐外卖系统</a>
    <span style="float: right">
    <a href="/#/login" v-if="!user">登录</a>
    <a href="/#/user" v-if="user">欢迎，{{user.loginName}}</a>
    <a href="/#/cart" v-if="user" style="margin-left: 20px">购物车</a>
    <a v-if="user" @click="logout()" style="margin-left: 20px">退出</a>
    <a href="/#/admin_index" style="margin-left: 20px" target="_blank">管理端</a>
    </span>
  </div>
</template>

<script>
  export default {
    data () {
      return {
        user: null
      }
    },
    methods: {
      logout(){
        localStorage.removeItem("fuser");
        localStorage.removeItem("ftoken");
        this.user = null;
        this.$router.push("/");
      }
    },
    created(){
      var user = localStorage.getItem("fuser");
      if(user){
          this.user = JSON.parse(user);
      }else{
          
      }

    }
  }
</script>
<style scoped>
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