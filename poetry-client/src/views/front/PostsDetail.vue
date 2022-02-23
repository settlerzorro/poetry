<template>
  <div id="Index">
    <el-container>
      <el-header><mainHeader></mainHeader> </el-header>
    </el-container>
    <el-container>
      <el-main>
        <el-row>
          <el-col :span="18" :offset="3">
            <el-button
              type="primary"
              style="margin-bottom: 16px"
              @click="addPost"
              >回复</el-button
            >
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
    <el-dialog title="回复" :visible.sync="dialogVisible" width="80%">
      <el-form
        :model="postForm"
        :rules="postRules"
        ref="postForm"
        label-width="80px"
      >
        <el-form-item label="回复内容" prop="content">
          <quill-editor
            :content="postForm.content"
            :options="editorOption"
            @change="onEditorChange($event)"
          />
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitForm('postForm')"
          >确 定</el-button
        >
      </span>
    </el-dialog>
  </div>
</template>

<script>
import mainHeader from "../../components/main-header-posts";

import "quill/dist/quill.core.css";
import "quill/dist/quill.snow.css";
import "quill/dist/quill.bubble.css";

import { quillEditor } from "vue-quill-editor";
export default {
  name: "Index",
  data() {
    return {
      touxiangImg: require("../../assets/img/96_avatar_middle.gif"),
      postsList: [],
      pageIndex: 1,
      pageSize: 10,
      pageTotal: 0,
      dialogVisible: false,
      postForm: {
        content: "",
      },
      post: {},
      postRules: {},
      editorOption: {
        modules: {
          //工具栏定义的
          toolbar: [
            ["bold", "italic", "underline", "strike"], // 加粗 斜体 下划线 删除线 -----['bold', 'italic', 'underline', 'strike']
            ["blockquote", "code-block"], // 引用  代码块-----['blockquote', 'code-block']
            [{ header: 1 }, { header: 2 }], // 1、2 级标题-----[{ header: 1 }, { header: 2 }]
            [{ list: "ordered" }, { list: "bullet" }], // 有序、无序列表-----[{ list: 'ordered' }, { list: 'bullet' }]
            [{ script: "sub" }, { script: "super" }], // 上标/下标-----[{ script: 'sub' }, { script: 'super' }]
            [{ indent: "-1" }, { indent: "+1" }], // 缩进-----[{ indent: '-1' }, { indent: '+1' }]
            [{ direction: "rtl" }], // 文本方向-----[{'direction': 'rtl'}]
            [{ size: ["small", false, "large", "huge"] }], // 字体大小-----[{ size: ['small', false, 'large', 'huge'] }]
            [{ header: [1, 2, 3, 4, 5, 6, false] }], // 标题-----[{ header: [1, 2, 3, 4, 5, 6, false] }]
            [{ color: [] }, { background: [] }], // 字体颜色、字体背景颜色-----[{ color: [] }, { background: [] }]
            [{ font: [] }], // 字体种类-----[{ font: [] }]
            [{ align: [] }], // 对齐方式-----[{ align: [] }]
            ["clean"], // 清除文本格式-----['clean']
            ["image", "video"], // 链接、图片、视频-----['link', 'image', 'video']
          ],
        },
        //主题
        theme: "snow",
        placeholder: "请输入回复内容",
      },
    };
  },
  components: {
    mainHeader,
    quillEditor,
  },
  methods: {
    getPost() {
      this.postsList = []
      var that = this;
      let id = this.$route.query.id;
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
          that.$axios({
            url: that.domain + "/api/posts/reply/list?postsId=" + id,
            data: {},
          }).then(function (res) {
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
    addPost() {
      let token = localStorage.getItem("ftoken");
      let user = localStorage.getItem("fuser");
      if (!token || !user) {
        this.$router.push("/login");
        return;
      }
      this.dialogVisible = true;
    },
    submitForm(formName) {
      let that = this;
      this.$refs[formName].validate((valid) => {
        if (valid) {
          let data = this.postForm;
          let userJson = JSON.parse(localStorage.getItem("fuser"));
          data.memberName = userJson.nickname;
          data.memberId = userJson.id;
          data.postsId = this.$route.query.id;
          this.$axios
            .post(that.domain + "/api/posts/reply/save", data, {
              headers: { token: localStorage.getItem("ftoken") },
            })
            .then(function (res) {
              if (res.data.code == 0) {
                //成功
                that.dialogVisible = false;
                that.$refs[formName].resetFields();
                that.getPost();
              } else {
                that.$message.error(res.data.msg);
              }
            });
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
    //失去焦点事件
    onEditorBlur(quill) {
      console.log("editor blur!", quill);
    },
    //获得焦点事件
    onEditorFocus(quill) {
      console.log("editor focus!", quill);
    },
    // 准备富文本编辑器
    onEditorReady(quill) {
      console.log("editor ready!", quill);
    },
    //内容改变事件
    onEditorChange({ quill, html, text }) {
      this.postForm.content = html;
    },
    // 分页导航
    handlePageChange(val) {
      this.pageIndex = val;
      // getData();
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