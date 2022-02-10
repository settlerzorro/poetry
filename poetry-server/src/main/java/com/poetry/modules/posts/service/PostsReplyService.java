package com.poetry.modules.posts.service;

import com.poetry.modules.posts.entity.PostsEntity;
import com.poetry.modules.posts.entity.PostsReplyEntity;

import java.util.List;
import java.util.Map;


/**
 * 
 * @author lzl
 * @email 2803180149@qq.com
 */
public interface PostsReplyService {
	

	List<PostsReplyEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(PostsReplyEntity posts);
	
	void delete(Integer id);
	
	void deleteBatch(Integer[] ids);
}
