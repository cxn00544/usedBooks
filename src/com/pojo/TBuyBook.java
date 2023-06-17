package com.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class TBuyBook {
	private int demandId;
	private int userId;
	private String bookName;
	private String isbn;
	private String userName;
	private String telephone;
	public String getUserName() {
		return userName;
	}
	public int getDemandId() {
		return demandId;
	}
	public void setDemandId(int demandId) {
		this.demandId = demandId;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	private Date publishDate;
	private BigDecimal price;
	
	
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}


	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String iSBN) {
		isbn = iSBN;
	}

	public Date getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "TBuyBook [demandId=" + demandId + ", userId=" + userId + ", bookName=" + bookName + ", isbn=" + isbn
				+ ", userName=" + userName + ", telephone=" + telephone + ", publishDate=" + publishDate + ", price="
				+ price + "]";
	}

	
	
}
