package com.poetry.modules.sys.dao;


import com.poetry.modules.sys.entity.SysUserEntity;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

/**
 * 系统用户
 * 
 * @author lzl
 * @email 2803180149@qq.com
 */
@Mapper
public interface SysUserDao extends BaseDao<SysUserEntity> {
	
	/**
	 * 根据用户名，查询系统用户
	 */
	SysUserEntity queryByUserName(String username);
	
	/**
	 * 修改密码
	 */
	int updatePassword(Map<String, Object> map);
}