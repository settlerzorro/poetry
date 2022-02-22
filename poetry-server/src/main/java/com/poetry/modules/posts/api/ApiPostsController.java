package com.poetry.modules.posts.api;

import com.poetry.common.annotation.AuthIgnore;
import com.poetry.common.utils.R;
import com.poetry.modules.posts.entity.PostsEntity;
import com.poetry.modules.posts.service.PostsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/api/posts/")
public class ApiPostsController {
	
	@Autowired
	private PostsService postsService;
	
	@AuthIgnore
    @GetMapping("list")
    public R list(){
    	Map<String, Object> params = new HashMap<String, Object>();
    	params.put("sidx", "sort");
    	params.put("order", "ASC");
    	List<PostsEntity> postsList = postsService.queryList(params);
        return R.ok().put("postsList", postsList);
    }

	@AuthIgnore
	@GetMapping("queryContent")
	public R queryContent(@RequestParam(value = "id",required = false) Integer id){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		PostsEntity post = postsService.queryContent(params);
		return R.ok().put("post", post);
	}

	/**
	 * 保存
	 */
	@PostMapping("save")
	public R save(@RequestBody PostsEntity posts){
		posts.setCreateTime(new Date());
		postsService.save(posts);
		return R.ok();
	}

}
