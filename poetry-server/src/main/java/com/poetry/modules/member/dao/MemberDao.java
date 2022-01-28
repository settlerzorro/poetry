package com.poetry.modules.member.dao;

import org.apache.ibatis.annotations.Mapper;

import com.poetry.modules.member.entity.MemberEntity;
import com.poetry.modules.sys.dao.BaseDao;


/**
 * 会员
 * 
 * @author lzl
 * @email 2803180149@qq.com
 * @date 2017-09-17 22:24:01
 */
@Mapper
public interface MemberDao extends BaseDao<MemberEntity> {

	MemberEntity queryByOpenid(String openid);

	MemberEntity queryByLoginName(String loginName);
}
