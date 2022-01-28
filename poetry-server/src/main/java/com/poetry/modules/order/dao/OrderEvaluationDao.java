package com.poetry.modules.order.dao;

import com.poetry.modules.order.entity.OrderEvaluationEntity;
import com.poetry.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * 订单评价
 * 
 * @author lizhengle
 * @email 2803180149@qq.com
 */
@Mapper
public interface OrderEvaluationDao extends BaseDao<OrderEvaluationEntity> {
	
}
