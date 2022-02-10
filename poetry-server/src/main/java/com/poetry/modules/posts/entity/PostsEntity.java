package com.poetry.modules.posts.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Banner
 * 
 * @author lzl
 * @email 2803180149@qq.com
 * @date 2017-07-14 13:43:12
 */
public class PostsEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer id;
	// 发帖者
	private String writer;
	// 发帖者Id
	private Integer memberId;
	//贴名
	private String name;

	private Date createTime;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}
