package com.poetry.modules.goods.dao;

import com.poetry.modules.goods.entity.HistoryEntity;
import com.poetry.modules.sys.dao.BaseDao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

/**
 * 浏览记录
 * 
 * @author lizhengle
 * @email 2803180149@qq.com
 */
@Mapper
public interface HistoryDao extends BaseDao<HistoryEntity> {

	List<HistoryEntity> queryByUserId(Long userId);

	List<HistoryEntity> queryByGoodsId(Integer goodsId);
	
}
