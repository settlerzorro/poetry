package com.poetry.modules.collectionAndEvaluation.entity;

import com.poetry.modules.poetry.entity.PoetryEntity;

import java.io.Serializable;

/**
 * 
 * 
 * @author lzl
 * @email 2803180149@qq.com
 */
public class CollectionEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer id;
	// 菜品ID
	private Integer goodsId;

	private String picUrl;

	private String goodsName;

	private Long memberId;

	private com.poetry.modules.poetry.entity.PoetryEntity poetryEntity;

	public PoetryEntity getPoetryEntity() {
		return poetryEntity;
	}

	public void setPoetryEntity(PoetryEntity poetryEntity) {
		this.poetryEntity = poetryEntity;
	}

	public Long getMemberId() {
		return memberId;
	}

	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}

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


	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

}
