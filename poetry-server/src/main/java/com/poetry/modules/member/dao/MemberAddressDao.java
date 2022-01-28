package com.poetry.modules.member.dao;

import org.apache.ibatis.annotations.Mapper;

import com.poetry.modules.member.entity.MemberAddressEntity;
import com.poetry.modules.sys.dao.BaseDao;

/**
 * 用户地址
 * 
 * @author lizhengle
 * @email lizhengle@163.com
 */
@Mapper
public interface MemberAddressDao extends BaseDao<MemberAddressEntity> {

	void updateByUserId(MemberAddressEntity t);
	
}
