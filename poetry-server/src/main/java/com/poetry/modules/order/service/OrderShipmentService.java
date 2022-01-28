package com.poetry.modules.order.service;

import java.util.List;
import java.util.Map;

import com.poetry.modules.order.entity.OrderShipmentEntity;

/**
 * 订单配送表
 * 
 * @author lizhengle
 * @email lizhengle@163.com
 */
public interface OrderShipmentService {
	
	OrderShipmentEntity queryObject(Integer id);
	
	List<OrderShipmentEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(OrderShipmentEntity orderShipment);
	
	void update(OrderShipmentEntity orderShipment);
	
	void delete(Integer id);
	
	void deleteBatch(Integer[] ids);
}
