<template>
<el-aside width="200px" height="100%">
  <el-menu
      :default-active="active"
      :style="asideStyle"
      router>
      <el-menu-item index="1" route="/admin_index">
          <i class="el-icon-menu"></i>
          <span slot="title">统计分析</span>
      </el-menu-item>
      <el-menu-item index="2" route="admin_member">
          <i class="el-icon-menu"></i>
          <span slot="title">会员管理</span>
      </el-menu-item>
      <el-menu-item index="3" route="admin_advert">
          <i class="el-icon-menu"></i>
          <span slot="title">广告管理</span>
      </el-menu-item>
      <el-menu-item index="4" route="admin_category">
          <i class="el-icon-menu"></i>
          <span slot="title">分类管理</span>
      </el-menu-item>
      <el-menu-item index="5" route="admin_goods">
          <i class="el-icon-menu"></i>
          <span slot="title">菜品管理</span>
      </el-menu-item>
      <el-menu-item index="6" route="admin_order">
          <i class="el-icon-menu"></i>
          <span slot="title">订单管理</span>
      </el-menu-item>
      <el-menu-item index="7" route="admin_evaluation">
          <i class="el-icon-menu"></i>
          <span slot="title">评价管理</span>
      </el-menu-item>
      <el-menu-item index="99" route="admin_user">
          <i class="el-icon-menu"></i>
          <span slot="title">管理员管理</span>
      </el-menu-item>
  </el-menu>
</el-aside>
</template>

<script>
  export default {
    data () {
      return {
        user: null,
        asideStyle: {
          height: '500px'
        }
      }
    },
    props: ['active'],
    methods: {
      
    },
    created(){
      var docHeight = document.documentElement.clientHeight;
      this.asideStyle.height = docHeight - 76 + "px";
    }
  }
</script>
