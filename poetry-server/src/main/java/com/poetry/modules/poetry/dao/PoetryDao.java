package com.poetry.modules.poetry.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.poetry.modules.poetry.entity.PoetryEntity;
import com.poetry.modules.sys.dao.BaseDao;

/**
 * 菜品
 * 
 * @author lzl
 * @email 2803180149@qq.com
 * @date 2017-07-14 13:43:12
 */
@Mapper
public interface PoetryDao extends BaseDao<PoetryEntity> {


	List<PoetryEntity> queryByIds(Integer[] ids);
	
}
