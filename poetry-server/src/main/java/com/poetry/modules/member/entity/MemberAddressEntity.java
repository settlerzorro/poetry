package com.poetry.modules.member.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户地址
 * 
 * @author lizhengle
 * @email lizhengle@163.com
 */
public class MemberAddressEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	//
	private Integer id;
	// 会员id
	private Integer memberId;
	// 联系人
	private String contacts;
	// 手机
	private String mobile;
	// 省
	private Integer provinceId;
	private String provinceName;
	// 市
	private String cityId;
	private String cityName;
	// 区
	private String districtId;
	private String districtName;
	// 详细地址
	private String address;
	// 邮政编码
	private Integer zipcode;
	// 更新时间
	private Date updateTime;
	// 默认地址
	private Integer dft;

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
	 * 设置：联系人
	 */
	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	/**
	 * 获取：联系人
	 */
	public String getContacts() {
		return contacts;
	}

	/**
	 * 设置：手机
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	/**
	 * 获取：手机
	 */
	public String getMobile() {
		return mobile;
	}

	public Integer getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(Integer provinceId) {
		this.provinceId = provinceId;
	}

	public String getProvinceName() {
		return provinceName;
	}

	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}

	public String getCityId() {
		return cityId;
	}

	public void setCityId(String cityId) {
		this.cityId = cityId;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getDistrictId() {
		return districtId;
	}

	public void setDistrictId(String districtId) {
		this.districtId = districtId;
	}

	public String getDistrictName() {
		return districtName;
	}

	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}

	/**
	 * 设置：详细地址
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * 获取：详细地址
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * 设置：更新时间
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	/**
	 * 获取：更新时间
	 */
	public Date getUpdateTime() {
		return updateTime;
	}

	public Integer getZipcode() {
		return zipcode;
	}

	public void setZipcode(Integer zipcode) {
		this.zipcode = zipcode;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Integer getDft() {
		return dft;
	}

	public void setDft(Integer dft) {
		this.dft = dft;
	}

}
