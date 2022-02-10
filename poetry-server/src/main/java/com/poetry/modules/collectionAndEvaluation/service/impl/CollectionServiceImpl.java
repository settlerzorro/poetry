package com.poetry.modules.collectionAndEvaluation.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.poetry.modules.member.dao.MemberDao;
import com.poetry.modules.collectionAndEvaluation.dao.CollectionDao;
import com.poetry.modules.collectionAndEvaluation.entity.CollectionEntity;
import com.poetry.modules.collectionAndEvaluation.service.CollectionService;



@Service("collectionService")
public class CollectionServiceImpl implements CollectionService {
	@Autowired
	private CollectionDao collectionDao;
	@Autowired
	private MemberDao memberDao;

	@Override
	public CollectionEntity queryObject(Integer id){
		CollectionEntity og = collectionDao.queryObject(id);
		return og;
	}
	
	@Override
	public List<CollectionEntity> queryList(Map<String, Object> map){
		List<CollectionEntity> orderList = collectionDao.queryList(map);
		return orderList;
	}

	@Override
	@Transactional
	public void createCollection(CollectionEntity order) {
		collectionDao.save(order);
	}

	@Override
	public void deleteCollection(Integer id) {
		collectionDao.delete(id);
	}
}
