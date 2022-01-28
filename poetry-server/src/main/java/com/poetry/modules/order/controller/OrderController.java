package com.poetry.modules.order.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.poetry.common.utils.Query;
import com.poetry.common.utils.R;
import com.poetry.modules.goods.service.GoodsService;
import com.poetry.modules.member.service.MemberService;
import com.poetry.modules.order.entity.OrderEntity;
import com.poetry.modules.order.service.OrderService;


/**
 * 订单
 * 
 * @author lzl
 * @email 2803180149@qq.com
 */
@RestController
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private MemberService memberService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<OrderEntity> orderList = orderService.queryList(query);
		int total = orderService.queryTotal(query);
		
		return R.ok().put("rows", orderList).put("total", total);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	public R info(@PathVariable("id") Integer id){
		OrderEntity order = orderService.queryObject(id);
		return R.ok().put("order", order);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	public R save(@RequestBody OrderEntity order){
		orderService.save(order);
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	public R update(@RequestBody OrderEntity order){
		orderService.update(order);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	public R delete(@RequestBody Integer[] ids){
		orderService.deleteBatch(ids);
		
		return R.ok();
	}
	
	/**
	 * 发货
	 */
	@RequestMapping("/sendGoods/{orderId}")
	public R sendGoods(@PathVariable("orderId")Integer orderId, String courierNum) {
		OrderEntity order = new OrderEntity();
		order.setId(orderId);
		order.setOrderStatus(3);
		order.setCourierNum(courierNum);
		orderService.update(order);
		return R.ok();
	}
	
}
