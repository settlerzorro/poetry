package com.poetry.modules.order.dao;

import org.apache.ibatis.annotations.Mapper;

import com.poetry.modules.order.entity.OrderShipmentEntity;
import com.poetry.modules.sys.dao.BaseDao;

/**
 * 订单配送表
 * 
 * @author lizhengle
 * @email lizhengle@163.com
 */
@Mapper
public interface OrderShipmentDao extends BaseDao<OrderShipmentEntity> {

	OrderShipmentEntity queryByOrderId(Integer orderId);
	
}
