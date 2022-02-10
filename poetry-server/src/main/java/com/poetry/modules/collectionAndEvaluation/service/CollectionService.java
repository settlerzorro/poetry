package com.poetry.modules.collectionAndEvaluation.service;

import java.util.List;
import java.util.Map;

import com.poetry.modules.collectionAndEvaluation.entity.CollectionEntity;

/**
 * 订单
 * 
 * @author lzl
 * @email 2803180149@qq.com
 */
public interface CollectionService {

	CollectionEntity queryObject(Integer id);
	
	List<CollectionEntity> queryList(Map<String, Object> map);
	
	void createCollection(CollectionEntity orderEntity);

	void deleteCollection(Integer id);

}
