package com.poetry.modules.collectionAndEvaluation.service;

import java.util.List;
import java.util.Map;

import com.poetry.modules.collectionAndEvaluation.entity.EvaluationEntity;

/**
 * 订单评价
 * 
 * @author lizhengle
 * @email 2803180149@qq.com
 */
public interface EvaluationService {
	
	EvaluationEntity queryObject(Integer id);
	
	List<EvaluationEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(EvaluationEntity evaluation);
	
	void update(EvaluationEntity evaluation);
	
	void delete(Integer id);
	
	void deleteBatch(Integer[] ids);
}
