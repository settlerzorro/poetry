package com.poetry.modules.poetry.entity;

import java.io.Serializable;

/**
 * 菜品图片
 * 
 * @author lzl
 * @email 2803180149@qq.com
 */
public class GoodsPicEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	//
	private Integer id;
	// 菜品ID
	private Integer goodsId;
	// 图片
	private String picUrl;

	/**
	 * 设置：
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * 获取：
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * 设置：菜品ID
	 */
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	/**
	 * 获取：菜品ID
	 */
	public Integer getGoodsId() {
		return goodsId;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}
	
}
