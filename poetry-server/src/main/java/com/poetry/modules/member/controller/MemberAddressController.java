package com.poetry.modules.member.controller;

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
import com.poetry.modules.member.entity.MemberAddressEntity;
import com.poetry.modules.member.service.MemberAddressService;

/**
 * 用户地址
 * 
 * @author lizhengle
 * @email lizhengle@163.com
 */
@RestController
@RequestMapping("memberaddress")
public class MemberAddressController {
	@Autowired
	private MemberAddressService memberAddressService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<MemberAddressEntity> memberAddressList = memberAddressService.queryList(query);
		int total = memberAddressService.queryTotal(query);
		return R.ok().put("rows", memberAddressList).put("total", total);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	public R info(@PathVariable("id") Integer id){
		MemberAddressEntity memberAddress = memberAddressService.queryObject(id);
		
		return R.ok().put("memberAddress", memberAddress);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	public R save(@RequestBody MemberAddressEntity memberAddress){
		memberAddressService.save(memberAddress);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	public R update(@RequestBody MemberAddressEntity memberAddress){
		memberAddressService.update(memberAddress);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	public R delete(@RequestBody Integer[] ids){
		memberAddressService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
