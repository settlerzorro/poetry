package com.poetry.modules.advert.dao;

import org.apache.ibatis.annotations.Mapper;

import com.poetry.modules.advert.entity.AdvertEntity;
import com.poetry.modules.sys.dao.BaseDao;

/**
 * @author lzl
 * @email 2803180149@qq.com
 */
@Mapper
public interface AdvertDao extends BaseDao<AdvertEntity> {
	
}
