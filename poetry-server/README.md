首页：http://127.0.0.1:8010/#/  
用户端：  
1.首页中右上角的购物车功能不需要。  
2.首页的模糊搜索功能需要将key放入url中，key为搜索的字段，支持categoryId goodsName author dynasty describe.goodsName为诗词名，原意为菜品名，担心前后端对接麻烦，就没改字段名。  
3.首页中商品上面的立即下单可改为查看详情。点击后的页面里面有个加入购物车，购物车功能不要，删除掉。购物车旁边的立即下单改为收藏。点击收藏需要登录。  
4.详情页面有个评价，我看客户给我的视频中评价下面用户可以评价（有评价按钮）但是我这边打开后只有个展示评价的功能，没法输入评价。但是后台已经写好了。  
5.首页右上角点击用户名进入的页面，左侧导航中删除“我的地址”，。只需要用户信息和我的收藏。我的收藏是我自己改的vue，原先叫我的订单。所以点击后可能有展示错误，需要改一下。  
6.原先点击我的订单后右侧展示的是所有订单，由于我改成我的收藏了，返回的数据结构有些变化，所以展示的内容和格式都不对，需要改正。  
7.我的收藏页面中：待付款，待配送，待收货等都删了，不需要。  
8.目前上传图片是上传成功了，但是展示不出来，不晓得为啥子  
9.还有需要新增一个论坛，用户可以自行发表帖子，回复其他人的内容，上传音频等，音频我不知道后台咋处理，目前可能没这个字段，先写着吧。  
管理端:  
1.统计分析页面中 订单数量不需要，原本正中间还有个折线图的，但是由于数据和一些接口被我改了 删了，所以没得展示  
2.会员管理就是注册的用户，应该不用动  
3.广告管理不用动，上传图片有问题，展示不出来  
4.分类管理也用他们的  
5.菜品管理 也就是诗词管理 大体上也不用动，新增时记得根据修改后的实体类数据格式重新改一下。  
6.订单管理应该用不着，可以删了  
7.评价管理改为论坛管理，目前展示的是所有商品的评价，需要改为论坛，接口已写好，可以自己设计一下  
8.管理员管理，就是后台用户（admin之类的角色）  
  
  
账号密码：  
用户端：zhang zhang  
test 123456  
管理端：admin admin  
