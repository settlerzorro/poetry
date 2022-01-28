package com.poetry.modules.order.api;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.poetry.common.annotation.Login;
import com.poetry.common.utils.R;
import com.poetry.modules.order.entity.OrderEntity;
import com.poetry.modules.order.service.OrderService;

/**
 * 订单接口
 * @author 2803180149
 *
 */
@RestController
@RequestMapping("/api/order")
public class ApiOrderController {
	
	@Autowired
	private OrderService orderService;
	
    @GetMapping("list")
    public R list(@RequestAttribute Long userId, Integer orderStatus){
    	Map<String, Object> params = new HashMap<String, Object>();
    	params.put("orderStatus", orderStatus);
    	params.put("memberId", userId);
    	List<OrderEntity> orderList = orderService.queryList(params);
        return R.ok().put("orderList", orderList);
    }
    
    @PostMapping("create")
    public R create(@RequestAttribute("userId") Long userId, @RequestBody OrderEntity order){
    	order.setMemberId(userId);
    	order.setCreateTime(new Date());
    	order.setOrderStatus(1);
    	orderService.createOrder(order);
    	return R.ok().put("id", order.getId());
    }
    
    @GetMapping("detail")
    public R detail(Integer id) {
    	OrderEntity order = orderService.queryObject(id);
    	return R.ok().put("order", order);
    }
    
    @GetMapping("cancel")
    public R cancel(Integer id) {
    	OrderEntity order = new OrderEntity();
    	order.setOrderStatus(0);
    	order.setId(id);
    	orderService.update(order);
    	return R.ok();
    }
	
	@GetMapping("pay")
    public R pay(Integer id) {
    	OrderEntity order = new OrderEntity();
    	order.setOrderStatus(2);
    	order.setId(id);
    	orderService.update(order);
    	return R.ok();
    }
    
    @Login
    @GetMapping("confirm")
    public R confirmOrder(Integer id) {
    	OrderEntity order = new OrderEntity();
    	order.setOrderStatus(4);
    	order.setId(id);
    	orderService.update(order);
    	return R.ok();
    }
    
}
