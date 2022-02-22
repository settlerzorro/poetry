package com.poetry.modules.posts.service.impl;

import com.poetry.modules.posts.dao.PostsDao;
import com.poetry.modules.posts.entity.PostsEntity;
import com.poetry.modules.posts.service.PostsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service("postsService")
public class PostsServiceImpl implements PostsService {
	@Autowired
	private PostsDao postsDao;
	

	@Override
	public List<PostsEntity> queryList(Map<String, Object> map){
		return postsDao.queryList(map);
	}

	@Override
	public PostsEntity queryContent(Map<String, Object> map){
		return postsDao.queryObject(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return postsDao.queryTotal(map);
	}
	
	@Override
	public void save(PostsEntity advert){
		postsDao.save(advert);
	}
	
	@Override
	public void delete(Integer id){
		postsDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Integer[] ids){
		postsDao.deleteBatch(ids);
	}
	
}
