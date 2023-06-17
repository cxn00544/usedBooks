package com.service;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.pojo.Book;

public interface BookSrv {

	public int addBook(Book book);

	public int deleteBook(String ISBN);

	public int updateBook(Book book);

	public List<Book> selectBookAll();

	public List<Book> selectBookByISBN(String value);
	public List<Book> selectBookByBookTitle(String value);
	public List<Book> selectBookByAuthor(String value);
	public List<Book> selectBookByTypeId(String value);

}
