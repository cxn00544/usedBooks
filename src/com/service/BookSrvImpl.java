package com.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.BookMapper;
import com.pojo.Book;

@Service("BookSrvImpl")
@Transactional(propagation=Propagation.REQUIRED)
public class BookSrvImpl implements BookSrv {
	
	@Autowired
	@Qualifier("BookMapper")
	private BookMapper bm;
	
	public int addBook(Book book) {
		int flag=bm.addBook(book);
		return flag;
	}

	
	public int deleteBook(String ISBN) {
		int flag=bm.deleteBook(ISBN);
		return flag;
	}

	
	public int updateBook(Book book) {
		int flag=bm.updateBook(book);
		return flag;
	}

	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Book> selectBookAll() {
		List<Book> list=new ArrayList();
		list=bm.selectBookAll();
		return list;
	}

	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Book> selectBookByISBN(String value) {
		System.out.println("key = ISBN,value = "+value);
		List<Book> list=new ArrayList();
		list=bm.selectBookByISBN(value);
		return list;
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Book> selectBookByBookTitle(String value) {
		System.out.println("key = BookTitle,value = "+value);
		List<Book> list=new ArrayList();
		list=bm.selectBookByBookTitle(value);
		return list;
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Book> selectBookByAuthor(String value) {
		System.out.println("key = Author,value = "+value);
		List<Book> list=new ArrayList();
		list=bm.selectBookByAuthor(value);
		return list;
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Book> selectBookByTypeId(String value) {
		System.out.println("key = TypeId,value = "+value);
		List<Book> list=new ArrayList();
		list=bm.selectBookByTypeId(value);
		return list;
	}


	public BookMapper getBm() {
		return bm;
	}


	public void setBm(BookMapper bm) {
		this.bm = bm;
	}


	


	
}
