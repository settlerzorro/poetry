package com.poetry.modules.poetry.dao;

import org.apache.ibatis.annotations.Mapper;

import com.poetry.modules.poetry.entity.CategoryEntity;
import com.poetry.modules.sys.dao.BaseDao;

/**
 * 分类
 * 
 * @author lzl
 * @email 2803180149@qq.com
 */
@Mapper
public interface CategoryDao extends BaseDao<CategoryEntity> {

	
}
