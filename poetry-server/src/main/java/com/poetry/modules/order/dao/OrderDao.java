package com.poetry.modules.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.poetry.modules.order.entity.OrderEntity;
import com.poetry.modules.sys.dao.BaseDao;

/**
 * 订单
 * 
 * @author lzl
 * @email 2803180149@qq.com
 */
@Mapper
public interface OrderDao extends BaseDao<OrderEntity> {

	void updateByOrderNumber(OrderEntity order);

	List<Map<String, String>> queryOrderCount();
	
}
