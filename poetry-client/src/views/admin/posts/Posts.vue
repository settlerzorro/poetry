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
            <el-form-item label="帖子名称">
              <el-input v-model="q.name" placeholder="帖子名称"></el-input>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" @click="query">查询</el-button>
              <el-button type="danger" @click="del">删除</el-button>
            </el-form-item>
          </el-form>
          <el-table
            :data="postsList"
            style="width: 100%"
            @selection-change="handleSelectionChange"
          >
            <el-table-column type="selection" width="55"> </el-table-column>
            <el-table-column prop="name" label="帖子名称"> </el-table-column>
            <el-table-column prop="writer" label="作者"> </el-table-column>
            <el-table-column prop="createTime" label="创建时间">
            </el-table-column>
            <el-table-column
              label="操作"
              width="250"
              align="center"
              fixed="right"
            >
              <template #default="scope">
                <el-button
                  type="text"
                  icon="el-icon-lx-share"
                  class="opButton"
                  @click="showContent(scope.$index, scope.row)"
                  >帖子内容</el-button
                >
              </template>
            </el-table-column>
          </el-table>
          <el-pagination
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
            :current-page="q.page"
            :page-sizes="[10, 50, 100]"
            :page-size="q.limit"
            layout="total, sizes, prev, pager, next, jumper"
            :total="total"
          >
          </el-pagination>
        </el-main>
      </el-container>
    </el-container>
    <el-dialog title="帖子内容" :visible.sync="dialogVisible" v-if="dialogVisible" width="80%">
      <postsDetail :postId="postId"></postsDetail>
    </el-dialog>
  </div>
</template>
<script>
import mainHeader from "../../../components/admin-main-header";
import mainSidebar from "../../../components/admin-main-sidebar";
import postsDetail from "./PostsDetail";
export default {
  name: "AdminMember",
  data() {
    return {
      q: {
        nickname: "",
        page: 1,
        limit: 10,
      },
      postsList: [],
      active: "8",
      postId: "",
      total: 0,
      ids: [],
      dialogVisible: false
    };
  },
  components: {
    mainHeader,
    mainSidebar,
    postsDetail
  },
  methods: {
    query() {
      var that = this;
      this.$axios
        .get(that.domain + "/posts/list", {
          params: that.q,
          headers: { token: localStorage.getItem("atoken") },
        })
        .then(function (res) {
          if (res.data.code == 0) {
            //成功
            that.postsList = res.data.rows;
            that.total = res.data.total;
          } else {
          }
        });
    },
    del() {
      if (this.ids.length == 0) {
        this.$message.info("请选择数据");
        return;
      }
      var that = this;
      this.$axios
        .post(that.domain + "/posts/delete", that.ids, {
          headers: { token: localStorage.getItem("atoken") },
        })
        .then(function (res) {
          if (res.data.code == 0) {
            //成功
            that.query();
          } else {
            that.$message.error(res.data.msg);
          }
        });
    },
    handleSizeChange(e) {
      this.q.limit = e;
      this.query();
    },
    handleCurrentChange(e) {
      this.q.page = e;
      this.query();
    },
    handleSelectionChange(e) {
      var ids = [];
      for (var i = 0; i < e.length; i++) {
        ids.push(e[i].id);
      }
      this.ids = ids;
    },
    showContent(index, row) {
      this.postId = row.id;
      this.dialogVisible = true;
    }
  },
  created() {
    var user = localStorage.getItem("auser");
    if (user) {
      this.user = JSON.parse(user);
    } else {
      this.$router.push("admin_login");
      return;
    }
    this.query();
  },
};
</script>

<style scoped>
</style>