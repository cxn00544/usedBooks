package com.pojo;

import java.util.Date;

public class CollectBook {

	private	Integer collectId;           //二手书书籍编号
	private Integer userId; 
	private Integer bookId; //收藏人id

	
	public CollectBook() {}
	public Integer getCollectId() {
		return collectId;
	}
	public void setCollectId(Integer collectId) {
		this.collectId = collectId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getBookId() {
		return bookId;
	}
	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}
	@Override
	public String toString() {
		return "CollectBook [collectId=" + collectId + ", userId=" + userId + ", bookId=" + bookId + "]";
	}
	public CollectBook(Integer collectId, Integer userId, Integer bookId) {
		super();
		this.collectId = collectId;
		this.userId = userId;
		this.bookId = bookId;
	}

	
		
	
	
	
	
}