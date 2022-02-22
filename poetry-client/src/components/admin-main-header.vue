<template>
  <div style="width: 100%" class="header">
    <a class="title">古诗词欣赏系统管理</a>
    <span style="float: right">
      <a v-if="user">欢迎，{{user.username}}</a>
      <a @click="logout()" style="margin-left: 20px">退出</a>
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
      logout(e){
        localStorage.removeItem("auser");
        localStorage.removeItem("atoken");
        this.$router.push("admin_login");
      }
    },
    created(){
      var user = localStorage.getItem("auser");
      if(user){
          this.user = JSON.parse(user);
      }else{
          this.$router.push("admin_login");
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