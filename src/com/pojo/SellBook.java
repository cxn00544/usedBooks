package com.pojo;

public class SellBook {
    private int bookId;
    private String bookTitle;
    private String isbn;
    private int userId;
    private String sellDate;
    private double price;
    private String introduction;
    private String status;
    private String userName;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    // 图片链接地址
//    private String img;

    public String getBookTitle() {
        return bookTitle;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public String getStatus() {
        return status;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getSellDate() {
        return sellDate;
    }

    public void setSellDate(String sellDate) {
        this.sellDate = sellDate;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }


    public void setStatus(String status) {
        this.status = status;
    }

	@Override
	public String toString() {
		return "SellBook [bookId=" + bookId + ", bookTitle=" + bookTitle + ", isbn=" + isbn + ", userId=" + userId
				+ ", sellDate=" + sellDate + ", price=" + price + ", introduction=" + introduction + ", status="
				+ status + ", userName=" + userName + "]";
	}

//    public String getImg() {
//        return img;
//    }
//
//    public void setImg(String img) {
//        this.img = img;
//    }


}
