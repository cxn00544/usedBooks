package com.mapper;

import java.util.Map;


import org.apache.ibatis.jdbc.SQL;

import com.pojo.Book;

public class BookSqlProvider {//动态sql语句
	
    public String updateBook(Book book) {
        return new SQL() {
            {
            	UPDATE("bookct.Tbook");
                if(book.getBookTitle() != "") {
                    SET("bookTitle = #{bookTitle}");
                }
                if(book.getAuthor() != "") {
                    SET("author = #{author}");
                }
                if(book.getPress() != "") {
                    SET("press = #{press}");
                }
                if(book.getPublishDate() != "") {
                    SET("publishDate = #{publishDate}");
                }
                if(book.getTypeId() != "") {
                    SET("typeId = #{typeId}");
                }
                WHERE("ISBN = #{ISBN}");
            }
        }.toString();
    }
    
	
}

