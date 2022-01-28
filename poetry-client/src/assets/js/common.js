export default {
  data: {
    domain: "http://127.0.0.1:10001",
    storeId: 1
  },
  p(name){
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if(r!=null)return  unescape(r[2]); return null;
  }
}