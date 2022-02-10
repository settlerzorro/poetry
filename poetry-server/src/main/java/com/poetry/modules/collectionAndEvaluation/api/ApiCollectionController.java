package com.poetry.modules.collectionAndEvaluation.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.poetry.modules.collectionAndEvaluation.entity.CollectionEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.poetry.common.utils.R;
import com.poetry.modules.collectionAndEvaluation.service.CollectionService;

/**
 * 订单接口
 * @author 2803180149
 *
 */
@RestController
@RequestMapping("/api/order")
public class ApiCollectionController {
	
	@Autowired
	private CollectionService collectionService;

    /**
     * 收藏列表
     * @param userId
     * @param orderStatus
     * @return
     */
    @GetMapping("list")
    public R list(@RequestAttribute Long userId, Integer orderStatus){
    	Map<String, Object> params = new HashMap<String, Object>();
    	params.put("memberId", userId);
    	List<CollectionEntity> orderList = collectionService.queryList(params);
        return R.ok().put("orderList", orderList);
    }

    /**
     * 收藏
     * @param userId
     * @param order
     * @return
     */
    @PostMapping("create")
    public R create(@RequestAttribute("userId") Long userId, @RequestBody CollectionEntity order){
    	order.setMemberId(userId);
        collectionService.createCollection(order);
    	return R.ok().put("id", order.getId());
    }

    /**
     * 取消收藏
     * @return
     */
    @PostMapping("delete")
    public R delete(@RequestParam(value = "id",required = false) Integer id){
        collectionService.deleteCollection(id);
        return R.ok().put("id", id);
    }
}
