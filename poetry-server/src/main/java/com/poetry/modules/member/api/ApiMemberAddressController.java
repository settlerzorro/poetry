package com.poetry.modules.member.api;

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

import com.poetry.common.utils.R;
import com.poetry.modules.member.entity.MemberAddressEntity;
import com.poetry.modules.member.service.MemberAddressService;

/**
 * 用户地址接口
 * @author Administrator
 *
 */
@RestController
@RequestMapping("/api/memberaddress")
public class ApiMemberAddressController {
	
	@Autowired
	private MemberAddressService memberAddressService;
	
	/**
	 * 获取用户默认地址
	 * @param user
	 * @return
	 */
    @GetMapping("dft")
    public R dft(@RequestAttribute("userId") Integer userId){
    	MemberAddressEntity memberAddress = memberAddressService.queryByDefault(userId);
        return R.ok().put("memberAddress", memberAddress);
    }
	
    @GetMapping("setDft")
    public R setDft(@RequestAttribute("userId") Integer userId, Integer id){
		MemberAddressEntity memberAddress = new MemberAddressEntity();
		memberAddress.setId(id);
		memberAddress.setDft(1);
		memberAddress.setMemberId(userId);
		memberAddressService.updateDft(memberAddress);
        return R.ok();
    }
    
    /**
     * 获取地址详情
     * @param id
     * @return
     */
    @GetMapping("detail")
    public R detail(Integer id){
    	MemberAddressEntity memberAddress = memberAddressService.queryObject(id);
        return R.ok().put("memberAddress", memberAddress);
    }
    
    /**
     * 添加地址
     * @param user
     * @param memberAddress
     * @return
     */
    @PostMapping("add")
    public R add(@RequestAttribute("userId") Integer userId, @RequestBody MemberAddressEntity memberAddress) {
    	memberAddress.setMemberId(userId);
    	memberAddress.setUpdateTime(new Date());
    	memberAddress.setDft(1);
    	memberAddressService.save(memberAddress);
    	return R.ok();
    }
    
    /**
     * 修改地址
     * @param user
     * @param memberAddress
     * @return
     */
	@PostMapping("update")
    public R update(@RequestBody MemberAddressEntity memberAddress) {
    	memberAddressService.update(memberAddress);
    	return R.ok();
    }
    
    /**
     * 删除地址
     * @param id
     * @return
     */
    @GetMapping("delete")
    public R delete(Integer id) {
    	memberAddressService.delete(id);
    	return R.ok();
    }
    
    /**
     * 获取用户所有地址
     * @param user
     * @return
     */
    @GetMapping("list")
    public R list(@RequestAttribute("userId") Integer userId){
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("memberId", userId);
    	List<MemberAddressEntity> memberAddressList = memberAddressService.queryList(map);
        return R.ok().put("memberAddressList", memberAddressList);
    }
}
