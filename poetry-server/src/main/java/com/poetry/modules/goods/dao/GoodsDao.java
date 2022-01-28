package com.poetry.modules.goods.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.poetry.modules.goods.entity.GoodsEntity;
import com.poetry.modules.sys.dao.BaseDao;

/**
 * 菜品
 * 
 * @author lzl
 * @email 2803180149@qq.com
 * @date 2017-07-14 13:43:12
 */
@Mapper
public interface GoodsDao extends BaseDao<GoodsEntity> {

	void updateStatus(@Param("status")Integer status, @Param("ids")Integer[] ids);

	List<GoodsEntity> queryByIds(Integer[] ids);
	
	void delStock(@Param("id")Integer id, @Param("stock")int stock);

	void addStock(@Param("id")Integer id, @Param("stock")int stock);
}
