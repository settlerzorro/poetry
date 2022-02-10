package com.poetry.modules.posts.controller;

import com.poetry.common.utils.Query;
import com.poetry.common.utils.R;
import com.poetry.modules.posts.entity.PostsEntity;
import com.poetry.modules.posts.service.PostsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 
 * @author lzl
 * @email 2803180149@qq.com
 */
@RestController
@RequestMapping("/posts")
public class PostsController {
	@Autowired
	private PostsService postsService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
		params.put("sidx", "sort");
    	params.put("order", "ASC");
        Query query = new Query(params);

		List<PostsEntity> advertList = postsService.queryList(query);
		int total = postsService.queryTotal(query);
		
		return R.ok().put("rows", advertList).put("total", total);
	}

	/**
	 * 删除
	 */
	@PostMapping("/delete")
	public R delete(@RequestBody Integer[] ids){
		postsService.deleteBatch(ids);
		return R.ok();
	}
	
}
