package com.poetry.modules.posts.service.impl;

import com.poetry.modules.posts.dao.PostsReplyDao;
import com.poetry.modules.posts.entity.PostsReplyEntity;
import com.poetry.modules.posts.service.PostsReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service("postsReplyService")
public class PostsReplyServiceImpl implements PostsReplyService {
	@Autowired
	private PostsReplyDao postsReplyDao;
	

	@Override
	public List<PostsReplyEntity> queryList(Map<String, Object> map){
		return postsReplyDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return postsReplyDao.queryTotal(map);
	}
	
	@Override
	public void save(PostsReplyEntity advert){
		postsReplyDao.save(advert);
	}
	
	@Override
	public void delete(Integer id){
		postsReplyDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Integer[] ids){
		postsReplyDao.deleteBatch(ids);
	}
	
}
