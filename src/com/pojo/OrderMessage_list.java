package com.pojo;

public class OrderMessage_list {
	
	private	 Integer orderNum;
	private Integer bookId;
	private Integer userId;
	

	private String userName;
	private String customerId;
    private String isbn;
    private double price;
    
    private String name;
	private String phoneNum; 
	private String address;
	private String detail;
	
	public String getCustomerId() {
		return customerId;
	}



	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}



	private String submitDate;
	private int status;
	
	
	
	
	public double getPrice() {
		return price;
	}



	public void setPrice(double price) {
		this.price = price;
	}



	public OrderMessage_list(){
	
	}



	public Integer getOrderNum() {
		return orderNum;
	}



	public void setOrderNum(Integer orderNum) {
		this.orderNum = orderNum;
	}



	public Integer getBookId() {
		return bookId;
	}



	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}



	public Integer getUserId() {
		return userId;
	}



	public void setUserId(Integer userId) {
		this.userId = userId;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



//	public String getBookTitle() {
//		return bookTitle;
//	}
//
//
//
//	public void setBookTitle(String bookTitle) {
//		this.bookTitle = bookTitle;
//	}



	public String getIsbn() {
		return isbn;
	}



	public void setIsbn(String isbn) {
		this.isbn = isbn;
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



	@Override
	public String toString() {
		return "OrderMessage_list [orderNum=" + orderNum + ", bookId=" + bookId + ", userId=" + userId + ", userName="
				+ userName + ", customerId=" + customerId + ", isbn=" + isbn + ", price=" + price + ", name=" + name
				+ ", phoneNum=" + phoneNum + ", address=" + address + ", detail=" + detail + ", submitDate="
				+ submitDate + ", status=" + status + "]";
	}



	public OrderMessage_list(Integer orderNum, Integer bookId, Integer userId, String userName, String customerId,
			String isbn, double price, String name, String phoneNum, String address, String detail, String submitDate,
			int status) {
		super();
		this.orderNum = orderNum;
		this.bookId = bookId;
		this.userId = userId;
		this.userName = userName;
		this.customerId = customerId;
		this.isbn = isbn;
		this.price = price;
		this.name = name;
		this.phoneNum = phoneNum;
		this.address = address;
		this.detail = detail;
		this.submitDate = submitDate;
		this.status = status;
	}




	
	
}
