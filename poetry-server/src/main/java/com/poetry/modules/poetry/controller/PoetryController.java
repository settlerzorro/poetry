package com.poetry.modules.poetry.controller;

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
import com.poetry.modules.poetry.entity.PoetryEntity;
import com.poetry.modules.poetry.service.PoetryService;


/**
 * 菜品
 * 
 * @author lzl
 * @email 2803180149@qq.com
 * @date 2017-07-14 13:43:12
 */
@RestController
@RequestMapping("/goods")
public class PoetryController {
	@Autowired
	private PoetryService poetryService;
	
	/**
	 * 列表 √
	 */
	@RequestMapping("/list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<PoetryEntity> goodsList = poetryService.queryList(query);
		int total = poetryService.queryTotal(query);
		
		return R.ok().put("rows", goodsList).put("total", total);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	public R info(@PathVariable("id") Integer id){
		PoetryEntity goods = poetryService.queryObject(id);

		return R.ok().put("goods", goods);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	public R save(@RequestBody PoetryEntity goods){
		goods.setCreateTime(new Date());
		poetryService.save(goods);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	public R update(@RequestBody PoetryEntity goods){
		poetryService.update(goods);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	public R delete(@RequestBody Integer[] ids){
		poetryService.deleteBatch(ids);
		
		return R.ok();
	}
	
	@RequestMapping("/getAll")
	public R getAll() {
		List<PoetryEntity> goodsList = poetryService.queryList(null);
		return R.ok().put("goodsList", goodsList);
	}
	
}
