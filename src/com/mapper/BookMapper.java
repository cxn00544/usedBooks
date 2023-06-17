package com.mapper;

import java.util.List;



import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.databind.JavaType;
import com.pojo.Book;

@Repository("BookMapper")
public interface BookMapper {
	
	//增
	@Insert("insert into bookct.Tbook values (#{ISBN},#{bookTitle},#{author},#{press},#{publishDate},#{typeId});")
	public int addBook(Book book);
	
	//删
	@Delete("delete from bookct.Tbook where ISBN=#{ISBN};")
	public int deleteBook(String ISBN);
		
	//改
	@UpdateProvider(type=BookSqlProvider.class,method="updateBook")//动态sql
	public int updateBook(Book book);
	
	//查
	@Select("select ISBN,bookTitle,author,press,publishDate,Tbook.typeId,TbookType.typeName from bookct.Tbook,bookct.TbookType where Tbook.typeId=TbookType.typeId order by ISBN ASC;")
	public List<Book> selectBookAll();
	
	@Select("select ISBN,bookTitle,author,press,publishDate,Tbook.typeId,TbookType.typeName from bookct.Tbook,bookct.TbookType where Tbook.typeId=TbookType.typeId and Tbook.ISBN=#{ISBN} order by ISBN ASC;")
	public List<Book> selectBookByISBN(String value);
	
	@Select("select ISBN,bookTitle,author,press,publishDate,Tbook.typeId,TbookType.typeName from bookct.Tbook,bookct.TbookType where Tbook.typeId=TbookType.typeId and Tbook.bookTitle=#{bookTitle} order by ISBN ASC;")
	public List<Book> selectBookByBookTitle(String value);
	
	@Select("select ISBN,bookTitle,author,press,publishDate,Tbook.typeId,TbookType.typeName from bookct.Tbook,bookct.TbookType where Tbook.typeId=TbookType.typeId and Tbook.author=#{author} order by ISBN ASC;")
	public List<Book> selectBookByAuthor(String value);
	
	@Select("select ISBN,bookTitle,author,press,publishDate,Tbook.typeId,TbookType.typeName from bookct.Tbook,bookct.TbookType where Tbook.typeId=TbookType.typeId and Tbook.typeId=#{typeId} order by ISBN ASC;")
	public List<Book> selectBookByTypeId(String value);
	

}
