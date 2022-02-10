package com.poetry.modules.posts.dao;

import com.poetry.modules.posts.entity.PostsEntity;
import com.poetry.modules.posts.entity.PostsReplyEntity;
import com.poetry.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author lzl
 * @email 2803180149@qq.com
 */
@Mapper
public interface PostsReplyDao extends BaseDao<PostsReplyEntity> {
	
}
