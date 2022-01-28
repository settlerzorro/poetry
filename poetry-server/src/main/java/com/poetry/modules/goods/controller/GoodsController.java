package com.poetry.modules.goods.controller;

import java.util.Date;
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
import com.poetry.modules.goods.entity.GoodsEntity;
import com.poetry.modules.goods.service.GoodsService;


/**
 * 菜品
 * 
 * @author lzl
 * @email 2803180149@qq.com
 * @date 2017-07-14 13:43:12
 */
@RestController
@RequestMapping("/goods")
public class GoodsController {
	@Autowired
	private GoodsService goodsService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<GoodsEntity> goodsList = goodsService.queryList(query);
		int total = goodsService.queryTotal(query);
		
		return R.ok().put("rows", goodsList).put("total", total);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	public R info(@PathVariable("id") Integer id){
		GoodsEntity goods = goodsService.queryObject(id);
		
		return R.ok().put("goods", goods);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	public R save(@RequestBody GoodsEntity goods){
		goods.setCreateTime(new Date());
		goodsService.save(goods);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	public R update(@RequestBody GoodsEntity goods){
		goodsService.update(goods);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	public R delete(@RequestBody Integer[] ids){
		goodsService.deleteBatch(ids);
		
		return R.ok();
	}
	
    @RequestMapping("/lower")
    public R lower(@RequestBody Integer[] ids) {
    	goodsService.updateStatus(0, ids);
    	return R.ok();
    }
    
    @RequestMapping("/upper")
    public R upper(@RequestBody Integer[] ids) {
    	goodsService.updateStatus(1, ids);
    	return R.ok();
    }
	
	@RequestMapping("/getAll")
	public R getAll() {
		List<GoodsEntity> goodsList = goodsService.queryList(null);
		return R.ok().put("goodsList", goodsList);
	}
	
}
