package com.poetry.modules.goods.dao;

import org.apache.ibatis.annotations.Mapper;

import com.poetry.modules.goods.entity.CategoryEntity;
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
