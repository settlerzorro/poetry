package com.poetry.modules.posts.api;

import com.poetry.common.annotation.AuthIgnore;
import com.poetry.common.utils.R;
import com.poetry.modules.posts.entity.PostsEntity;
import com.poetry.modules.posts.entity.PostsReplyEntity;
import com.poetry.modules.posts.service.PostsReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/api/posts/reply/")
public class ApiPostsReplyController {
	
	@Autowired
	private PostsReplyService postsReplyService;
	
	@AuthIgnore
    @GetMapping("list")
    public R list(@RequestParam("postsId") Integer postsId){
    	Map<String, Object> params = new HashMap<String, Object>();
    	params.put("sidx", "sort");
    	params.put("order", "ASC");
		params.put("postsId", postsId);
    	List<PostsReplyEntity> postsReplyList = postsReplyService.queryList(params);
        return R.ok().put("postsReplyList", postsReplyList);
    }

	/**
	 * 保存
	 */
	@PostMapping("save")
	public R save(@RequestBody PostsReplyEntity postsReply){
		postsReply.setTime(new Date());
		postsReplyService.save(postsReply);
		return R.ok();
	}

}
