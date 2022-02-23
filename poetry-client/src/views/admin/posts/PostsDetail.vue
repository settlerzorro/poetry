<template>
  <div id="Index">
    <el-container>
      <el-main>
        <el-row>
          <el-col :span="24">
            <el-container style="border-bottom: 1px solid #ddd">
              <el-aside width="200px">
                <div
                  style="
                    background: #e5edf2;
                    height: calc(100% - 40px);
                    padding: 20px;
                  "
                ></div>
              </el-aside>
              <el-main style="background: #ffffff; padding: 8px 20px">
                <div
                  class="title"
                  style="font-size: 22px; margin-bottom: 0px; line-height: 36px"
                >
                  {{ post.name }}
                </div>
              </el-main>
            </el-container>
            <div
              v-for="(post, index) in postsList.slice(
                (pageIndex - 1) * pageSize,
                pageIndex * pageSize
              )"
              :key="index"
              style="background: #fff; border-bottom: 1px solid #ddd"
            >
              <div class="orderList">
                <el-container>
                  <el-aside width="200px">
                    <div
                      style="
                        background: #e5edf2;
                        height: calc(100% - 40px);
                        padding: 20px;
                      "
                    >
                      <div
                        class="pi"
                        style="
                          font-size: 20px;
                          margin-bottom: 0px;
                          border-bottom: 1px dashed #cdcdcd;
                          line-height: 36px;
                        "
                      >
                        <div class="authi">
                          {{ post.memberName }}
                        </div>
                      </div>
                      <div class="avatar" style="margin: 10px 15px">
                        <img
                          :file="touxiangImg"
                          :src="touxiangImg"
                          lazyloaded="true"
                          _load="1"
                          style="
                            padding: 5px 5px 8px;
                            background: #fff 0 100% repeat-x;
                            width: 120px;
                          "
                        />
                      </div>
                    </div>
                  </el-aside>
                  <el-main>
                    <div
                      class="time"
                      style="
                        font-size: 12px;
                        margin-bottom: 0px;
                        border-bottom: 1px dashed #cdcdcd;
                        line-height: 36px;
                      "
                    >
                      发表于 {{ post.time }}
                      <div
                        style="
                          display: inline-block;
                          float: right;
                          text-align: right;
                          margin-left: 8px;
                        "
                        v-if="index + (pageIndex - 1) * pageSize > 0"
                      >
                        <el-popconfirm
                          confirm-button-text="是"
                          cancel-button-text="否"
                          icon="el-icon-info"
                          icon-color="red"
                          title="是否要删除该条回复？"
                          @confirm="deleteReplay(post.id)"
                        >
                          <el-button type="text" size="mini" slot="reference">删除</el-button>
                        </el-popconfirm>
                      </div>
                      <div style="display: inline-block; float: right">
                        {{
                          index + (pageIndex - 1) * pageSize > 0
                            ? index + (pageIndex - 1) * pageSize + "楼"
                            : ""
                        }}
                      </div>
                    </div>
                    <div
                      class="content"
                      style="font-size: 16px; margin-bottom: 0px"
                      v-html="post.content"
                    >
                      {{ post.content }}
                    </div>
                  </el-main>
                </el-container>
              </div>
            </div>
            <div class="pagination" style="float: right; margin-top: 16px">
              <el-pagination
                background
                layout="prev, pager, next"
                :current-page="pageIndex"
                :page-size="pageSize"
                :total="pageTotal"
                @current-change="handlePageChange"
              ></el-pagination>
            </div>
          </el-col>
        </el-row>
      </el-main>
    </el-container>
  </div>
</template>

<script>
export default {
  name: "Index",
  data() {
    return {
      touxiangImg: require("../../../assets/img/96_avatar_middle.gif"),
      postsList: [],
      pageIndex: 1,
      pageSize: 10,
      pageTotal: 0,
      post: {},
    };
  },
  props: ["postId"],
  components: {},
  methods: {
    getPost() {
      this.postsList = [];
      var that = this;
      let id = this.postId;
      this.$axios({
        url: that.domain + "/api/posts/queryContent?id=" + id,
        data: {},
      }).then(function (res) {
        var r = res.data;
        if (r.code == 0) {
          that.post = r.post;
          that.post.memberName = r.post.writer;
          that.post.time = r.post.createTime;
          that.postsList.push(that.post);
          that
            .$axios({
              url: that.domain + "/api/posts/reply/list?postsId=" + id,
              data: {},
            })
            .then(function (res) {
              var r = res.data;
              if (r.code == 0) {
                that.postsList.push.apply(that.postsList, r.postsReplyList);
                that.pageTotal = r.postsReplyList.length + 1;
              }
            });
        }
      });
    },
    detail(id) {
      this.$router.push({ path: "detail", query: { id: id } });
    },
    // 分页导航
    handlePageChange(val) {
      this.pageIndex = val;
      // getData();
    },
    deleteReplay(id) {
      var that = this;
      this.$axios.post(that.domain + '/posts/reply/delete',
          [id],
          {
              headers: {'token': localStorage.getItem("atoken")}
          }).then(function(res){
          if(res.data.code == 0){//成功
            that.getPost();
          }else{
            that.$message.error(res.data.msg);
          }
      })
    },
  },
  created() {
    this.getPost();
  },
};
</script>

<style scoped>
.quill-editor {
  line-height: normal !important;
  height: 300px;
}
</style>
