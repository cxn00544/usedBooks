package com.service;

import java.util.List;


import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;


import com.pojo.BookItem;

public interface BookItemSrv {


	public int deleteBookItem(String bookId);

	public int updateBookItem(BookItem bookItem);

	public List<BookItem> selectBookItemAll();
	
	public List<BookItem> selectBookItemByValue(String bookId,String ISBN,String userId,String sellDate_yy ,String sellDate_mm ,String sellDate_dd ,String introduction,String status);



}
