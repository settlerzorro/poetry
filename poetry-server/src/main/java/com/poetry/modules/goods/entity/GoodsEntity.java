package com.poetry.modules.goods.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 菜品
 * 
 * @author lzl
 * @email 2803180149@qq.com
 */
public class GoodsEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	//
	private Integer id;
	// 菜品名称
	private String goodsName;
	// 分类ID
	private Integer categoryId;
	// 价格
	private BigDecimal price;

	private String picUrl;
	// 描述
	private String describe;
	// 创建时间
	private Date createTime;

	private String[] picUrls;
	
	//上下架
	private Integer status;
	
	private Integer stock;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * 分类
	 */
	private CategoryEntity category;
	
	/**
	 * 设置：菜品名称
	 */
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	/**
	 * 获取：菜品名称
	 */
	public String getGoodsName() {
		return goodsName;
	}

	/**
	 * 设置：分类ID
	 */
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	/**
	 * 获取：分类ID
	 */
	public Integer getCategoryId() {
		return categoryId;
	}

	/**
	 * 设置：价格
	 */
	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	/**
	 * 获取：价格
	 */
	public BigDecimal getPrice() {
		return price;
	}

	/**
	 * 设置：描述
	 */
	public void setDescribe(String describe) {
		this.describe = describe;
	}

	/**
	 * 获取：描述
	 */
	public String getDescribe() {
		return describe == null ? "" : describe;
	}

	/**
	 * 设置：创建时间
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * 获取：创建时间
	 */
	public Date getCreateTime() {
		return createTime;
	}

	public CategoryEntity getCategory() {
		return category;
	}

	public void setCategory(CategoryEntity category) {
		this.category = category;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public String[] getPicUrls() {
		return picUrls;
	}

	public void setPicUrls(String[] picUrls) {
		this.picUrls = picUrls;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

}
