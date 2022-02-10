package com.poetry.modules.poetry.service;

import java.util.List;
import java.util.Map;

import com.poetry.modules.poetry.entity.PoetryEntity;

/**
 * 菜品
 * 
 * @author lzl
 * @email 2803180149@qq.com
 */
public interface PoetryService {
	
	PoetryEntity queryObject(Integer id);
	
	List<PoetryEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(PoetryEntity goods);
	
	void update(PoetryEntity goods);
	
	void delete(Integer id);
	
	void deleteBatch(Integer[] ids);
	

	List<PoetryEntity> getLike(Long userId);
}
