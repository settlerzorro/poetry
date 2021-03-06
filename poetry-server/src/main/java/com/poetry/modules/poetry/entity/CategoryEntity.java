package com.poetry.modules.poetry.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 分类
 * 
 * @author lzl
 * @email 2803180149@qq.com
 */
public class CategoryEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	//
	private Integer id;
	// 分类名称
	private String categoryName;
	// 排序
	private Integer sort;

	private String picUrl;

	private Date createTime;
	
	private List<PoetryEntity> goodsList;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * 设置：分类名称
	 */
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	/**
	 * 获取：分类名称
	 */
	public String getCategoryName() {
		return categoryName;
	}

	/**
	 * 设置：排序
	 */
	public void setSort(Integer sort) {
		this.sort = sort;
	}

	/**
	 * 获取：排序
	 */
	public Integer getSort() {
		return sort;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public List<PoetryEntity> getGoodsList() {
		return goodsList;
	}

	public void setGoodsList(List<PoetryEntity> goodsList) {
		this.goodsList = goodsList;
	}

}
