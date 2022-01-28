package com.poetry.modules.order.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.poetry.common.utils.DateUtils;
import com.poetry.common.utils.R;
import com.poetry.modules.goods.service.GoodsService;
import com.poetry.modules.member.service.MemberService;
import com.poetry.modules.order.service.OrderService;


/**
 * 分类
 * 
 * @author lizhengle
 * @email 2803180149@qq.com
 */
@RestController
@RequestMapping("statistics")
public class StatisticsController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private MemberService memberService;
	
	/**
	 * 
	 */
	@RequestMapping("/query")
	public R query(@RequestParam Map<String, Object> params){
		Map<String, Object> map = new HashMap<String, Object>();
		Integer userTotal = memberService.queryTotal(map);
		Integer goodsTotal = goodsService.queryTotal(map);
		Integer orderTotal = orderService.queryTotal(map);

		Map<String, Object> result = new HashMap<String, Object>();
		result.put("userTotal", userTotal);
		result.put("orderTotal", orderTotal);
		result.put("goodsTotal", goodsTotal);
		
		// 近7天订单数
		List<Map<String, String>> orderCountList = orderService.queryOrderCount();
		List<Map<String, String>> newOrderCountList = new ArrayList<>();
		if (orderCountList == null || orderCountList.size() < 7) {
			for (int i = -7; i < 0; i++) {
				// 补齐近7天数据，值为0
				Date now = new Date();
				Map<String, String> c = hasDate(DateUtils.format(DateUtils.add(now, i)), orderCountList);
				if(c == null) {
					Map<String, String> m = new HashMap<>();
					m.put("createTime", DateUtils.format(DateUtils.add(now, i)));
					m.put("count", "0");
					newOrderCountList.add(m);
				}else {
					newOrderCountList.add(c);
				}
			}
			result.put("orderCountList", newOrderCountList);
		}else {
			result.put("orderCountList", orderCountList);
		}
		return R.ok().put("statistics", result);
	}
	
	private Map<String, String> hasDate(String date, List<Map<String, String>> list) {
		for (Map<String, String> map : list) {
			if(date.equals(map.get("createTime"))) {
				return map;
			}
		}
		return null;
	}
}
