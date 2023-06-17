package com.pojo;

public class CollectBookDetail {
	private	Integer collectId;//收藏ID
	private Integer bookId;//书籍编号
	private Integer coustemid;//卖家ID
	private Double price;	//书籍定价
	private String introduction;//卖家介绍
	private String sellDate; //发布时间
	private String userName;
//	private String status;
	
	private String  bookTitle;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	private String ISBN;
	
	public CollectBookDetail() {
		
	}
	public Integer getCollectId() {
		return collectId;
	}
	public void setCollectId(Integer collectId) {
		this.collectId = collectId;
	}
	public Integer getBookId() {
		return bookId;
	}
	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}
	public String getSellDate() {
		return sellDate;
	}
	public void setSellDate(String sellDate) {
		this.sellDate = sellDate;
	}
	public Integer getCoustemid() {
		return coustemid;
	}
	public void setCoustemid(Integer coustemid) {
		this.coustemid = coustemid;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getBookTitle() {
		return bookTitle;
	}
	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}
	@Override
	public String toString() {
		return "CollectBookDetail [collectId=" + collectId + ", bookId=" + bookId + ", coustemid=" + coustemid
				+ ", price=" + price + ", introduction=" + introduction + ", sellDate=" + sellDate + ", userName="
				+ userName + ", bookTitle=" + bookTitle + ", ISBN=" + ISBN + "]";
	}
	public CollectBookDetail(Integer collectId, Integer bookId, Integer coustemid, Double price, String introduction,
			String sellDate, String userName, String bookTitle, String iSBN) {
		super();
		this.collectId = collectId;
		this.bookId = bookId;
		this.coustemid = coustemid;
		this.price = price;
		this.introduction = introduction;
		this.sellDate = sellDate;
		this.userName = userName;
		this.bookTitle = bookTitle;
		ISBN = iSBN;
	}


	
	
	
	
}
