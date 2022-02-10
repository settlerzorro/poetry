package com.poetry.modules.poetry.dao;

import org.apache.ibatis.annotations.Mapper;

import com.poetry.modules.poetry.entity.GoodsPicEntity;
import com.poetry.modules.sys.dao.BaseDao;

/**
 * 菜品图片
 * 
 * @author lzl
 * @email 2803180149@qq.com
 * @date 2017-07-14 13:43:12
 */
@Mapper
public interface GoodsPicDao extends BaseDao<GoodsPicEntity> {

	String[] queryByGoodsId(Integer goodsId);

	void deleteByGoodsId(Integer goodsId);
	
}
