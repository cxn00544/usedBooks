package com.pojo;

import java.util.Date;
public class OrderBook {

	private Date createTime;  //发布时间
	private	Integer orderId;  //地址id
	private Integer userId;//用户id
	private String name; //收货人姓名 title
	private String phoneNum;    //收货人联系方式 editor
	private String address;	//收货人地址  content
	private String detail;
	private Integer exist;
	public OrderBook() {
		
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Integer getExist() {
		return exist;
	}
	public void setExist(Integer exist) {
		this.exist = exist;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	@Override
	public String toString() {
		return "OrderBook [createTime=" + createTime + ", orderId=" + orderId + ", userId=" + userId + ", name=" + name
				+ ", phoneNum=" + phoneNum + ", address=" + address + ", detail=" + detail + "]";
	}
	public OrderBook(Date createTime, Integer orderId, Integer userId, String name, String phoneNum, String address,
			String detail) {
		super();
		this.createTime = createTime;
		this.orderId = orderId;
		this.userId = userId;
		this.name = name;
		this.phoneNum = phoneNum;
		this.address = address;
		this.detail = detail;
	}
	

	
}
