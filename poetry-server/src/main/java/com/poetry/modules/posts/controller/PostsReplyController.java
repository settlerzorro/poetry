package com.poetry.modules.posts.controller;

import com.poetry.common.annotation.AuthIgnore;
import com.poetry.common.utils.Query;
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

/**
 * 
 * @author lzl
 * @email 2803180149@qq.com
 */
@RestController
@RequestMapping("/posts/reply")
public class PostsReplyController {
	@Autowired
	private PostsReplyService postsReplyService;

	@AuthIgnore
	@GetMapping("/list")
	public R list(@RequestParam("postsId") Integer postsId){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("sidx", "sort");
		params.put("order", "ASC");
		params.put("postsId", postsId);
		List<PostsReplyEntity> postsReplyList = postsReplyService.queryList(params);
		return R.ok().put("postsReplyList", postsReplyList);
	}


	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	public R delete(@RequestBody Integer[] ids){
		postsReplyService.deleteBatch(ids);
		return R.ok();
	}
	
}
