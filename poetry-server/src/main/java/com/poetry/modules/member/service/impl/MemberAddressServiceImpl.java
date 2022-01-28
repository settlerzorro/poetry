package com.poetry.modules.member.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.poetry.modules.member.dao.MemberAddressDao;
import com.poetry.modules.member.entity.MemberAddressEntity;
import com.poetry.modules.member.service.MemberAddressService;


@Service("memberAddressService")
public class MemberAddressServiceImpl implements MemberAddressService {
	@Autowired
	private MemberAddressDao memberAddressDao;
	
	@Override
	public MemberAddressEntity queryObject(Integer id){
		return memberAddressDao.queryObject(id);
	}
	
	@Override
	public List<MemberAddressEntity> queryList(Map<String, Object> map){
		return memberAddressDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return memberAddressDao.queryTotal(map);
	}
	
	@Override
	@Transactional
	public void save(MemberAddressEntity memberAddress){
		MemberAddressEntity t = new MemberAddressEntity();
		t.setMemberId(memberAddress.getMemberId());
		t.setDft(0);
		memberAddressDao.updateByUserId(t);
		memberAddressDao.save(memberAddress);
	}
	
	@Override
	public void update(MemberAddressEntity memberAddress){
		memberAddressDao.update(memberAddress);
	}
	
	@Override
	public void delete(Integer id){
		memberAddressDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Integer[] ids){
		memberAddressDao.deleteBatch(ids);
	}

	@Override
	public MemberAddressEntity queryByDefault(Integer userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", userId);
		map.put("dft", 1);
		List<MemberAddressEntity> memberAddressList = memberAddressDao.queryList(map);
		if(memberAddressList != null && memberAddressList.size() > 0) {
			return memberAddressList.get(0);
		}
		return null;
	}

	@Override
	@Transactional
	public void updateDft(MemberAddressEntity memberAddress) {
		MemberAddressEntity t = new MemberAddressEntity();
		t.setMemberId(memberAddress.getMemberId());
		t.setDft(0);
		memberAddressDao.updateByUserId(t);
		memberAddress.setMemberId(null);
		memberAddressDao.update(memberAddress);
	}
	
}
