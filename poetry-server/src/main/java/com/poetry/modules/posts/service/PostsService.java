package com.poetry.modules.posts.service;

import com.poetry.modules.posts.entity.PostsEntity;

import java.util.List;
import java.util.Map;


/**
 * 
 * @author lzl
 * @email 2803180149@qq.com
 */
public interface PostsService {
	

	List<PostsEntity> queryList(Map<String, Object> map);

	PostsEntity queryContent(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(PostsEntity posts);
	
	void delete(Integer id);
	
	void deleteBatch(Integer[] ids);
}
