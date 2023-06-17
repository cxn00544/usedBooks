package com.service;

import java.util.ArrayList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.BookItemMapper;
import com.pojo.Book;
import com.pojo.BookItem;

@Service("BookItemSrvImpl")
@Transactional(propagation=Propagation.REQUIRED)
public class BookItemSrvImpl implements BookItemSrv {
	
	@Autowired
	@Qualifier("BookItemMapper")
	private BookItemMapper bim;

	@Override
	public int deleteBookItem(String bookId) {
		int flag=bim.deleteBookItem(bookId);
		return flag;
	}


	@Override
	public int updateBookItem(BookItem bookItem) {
		int flag=bim.updateBookItem(bookItem);
		return flag;
	}


	@Override
	public List<BookItem> selectBookItemAll() {
		List<BookItem> list=new ArrayList();
		list=bim.selectBookItemAll();
		BookItem bi=list.get(0);
		return list;
	}


	@Override
	public List<BookItem> selectBookItemByValue(String bookId,String ISBN,String userId,String sellDate_yy ,String sellDate_mm ,String sellDate_dd ,String introduction,String status) {
		System.out.println("service（前）: selectBookByValue "+bookId+"\t"+ISBN+"\t"+userId+"\t"+sellDate_yy+"\t"+sellDate_mm+"\t"+sellDate_dd+"\t"+introduction+"\t"+status);
		List<BookItem> list=bim.selectBookItemByValue(bookId, ISBN, userId, sellDate_yy , sellDate_mm , sellDate_dd , introduction, status);
		if(list.size()!=0) {BookItem bi=list.get(0);
		System.out.println("service（后）: selectBookByValue "+bi.getBookId()+bi.getISBN()+bi.getUserId()+bi.getPrice());
		}return list;
	}





	public BookItemMapper getBim() {
		return bim;
	}


	public void setBim(BookItemMapper bim) {
		this.bim = bim;
	}

	
}
