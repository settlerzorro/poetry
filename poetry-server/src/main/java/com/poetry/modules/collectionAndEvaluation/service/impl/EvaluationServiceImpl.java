package com.poetry.modules.collectionAndEvaluation.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poetry.modules.collectionAndEvaluation.dao.EvaluationDao;
import com.poetry.modules.collectionAndEvaluation.dao.CollectionDao;
import com.poetry.modules.collectionAndEvaluation.entity.EvaluationEntity;
import com.poetry.modules.collectionAndEvaluation.service.EvaluationService;


@Service("evaluationService")
public class EvaluationServiceImpl implements EvaluationService {
	@Autowired
	private EvaluationDao evaluationDao;
	@Autowired
	private CollectionDao collectionDao;
	
	@Override
	public EvaluationEntity queryObject(Integer id){
		return evaluationDao.queryObject(id);
	}
	
	@Override
	public List<EvaluationEntity> queryList(Map<String, Object> map){
		return evaluationDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return evaluationDao.queryTotal(map);
	}
	
	@Override
	public void save(EvaluationEntity evaluation){
		evaluationDao.save(evaluation);
	}
	
	@Override
	public void update(EvaluationEntity evaluation){
		evaluationDao.update(evaluation);
	}
	
	@Override
	public void delete(Integer id){
		evaluationDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Integer[] ids){
		evaluationDao.deleteBatch(ids);
	}
	
}
