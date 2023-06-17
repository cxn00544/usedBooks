package com.pojo;

import java.util.Date;

public class OrderMessage {
	private	 Integer orderNum; //订单编号
	private Integer userId;//卖家id
	private	Integer orderId; //地址id
	private Integer bookId;//二手书书籍编号
	private String submitDate;
	private int status;
	private boolean exist;
	
	public OrderMessage() {
		
	}
	public Integer getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(Integer orderNum) {
		this.orderNum = orderNum;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public Integer getBookId() {
		return bookId;
	}
	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}
	public String getSubmitDate() {
		return submitDate;
	}
	public void setSubmitDate(String submitDate) {
		this.submitDate = submitDate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public boolean isExist() {
		return exist;
	}
	public void setExist(boolean exist) {
		this.exist = exist;
	}
	@Override
	public String toString() {
		return "OrderMessage [orderNum=" + orderNum + ", userId=" + userId + ", orderId=" + orderId + ", bookId="
				+ bookId + ", submitDate=" + submitDate + ", status=" + status + ", exist=" + exist + "]";
	}
	public OrderMessage(Integer orderNum, Integer userId, Integer orderId, Integer bookId, String submitDate,
			int status, boolean exist) {
		super();
		this.orderNum = orderNum;
		this.userId = userId;
		this.orderId = orderId;
		this.bookId = bookId;
		this.submitDate = submitDate;
		this.status = status;
		this.exist = exist;
	}

	

	
	

	
}
