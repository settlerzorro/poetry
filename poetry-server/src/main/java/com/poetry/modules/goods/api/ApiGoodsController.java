package com.poetry.modules.goods.api;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.poetry.common.annotation.AuthIgnore;
import com.poetry.common.utils.Query;
import com.poetry.common.utils.R;
import com.poetry.modules.goods.entity.CategoryEntity;
import com.poetry.modules.goods.entity.GoodsEntity;
import com.poetry.modules.goods.service.CategoryService;
import com.poetry.modules.goods.service.GoodsService;

/**
 * 菜品接口
 * @author lzl
 *
 */
@RestController
@RequestMapping("/api/goods")
public class ApiGoodsController {
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private CategoryService categoryService;
	
	/**
	 * 查询全部+分类
	 * @param map
	 * @return
	 */
	@AuthIgnore
	@GetMapping("listAll")
    public R listAll(@RequestParam Map<String, Object> map){
		List<CategoryEntity> categoryList = categoryService.queryList(map);
		for (CategoryEntity category : categoryList) {
			map.put("categoryId", category.getId());
			map.put("status", 1);
	    	List<GoodsEntity> goodsList = goodsService.queryList(map);
	    	category.setGoodsList(goodsList);
		}
		
        return R.ok().put("goodsList", categoryList);
    }
	
	/**
	 * 查询列表
	 * @param map
	 * @return
	 */
	@AuthIgnore
	@GetMapping("list")
    public R list(@RequestParam Map<String, Object> map){
		map.put("status", 1);
		Query query = new Query(map);
    	List<GoodsEntity> goodsList = goodsService.queryList(query);
    	Integer total = goodsService.queryTotal(map);
        return R.ok().put("goodsList", goodsList).put("total", total);
    }
    
	/**
	 * 详情
	 * @param id
	 * @return
	 */
	@AuthIgnore
    @GetMapping("detail")
    public R detail(int id){
    	GoodsEntity goods = goodsService.queryObject(id);
    	return R.ok().put("goods", goods);
    }
    
	/**
	 * 推荐
	 * @param userId
	 * @return
	 */
	@GetMapping("recommend")
    public R recommend(@RequestAttribute("userId") Long userId){
    	List<GoodsEntity> goodsList = goodsService.getLike(userId);
        return R.ok().put("goodsList", goodsList);
    }
}
