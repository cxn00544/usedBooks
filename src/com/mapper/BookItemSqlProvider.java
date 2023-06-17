package com.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.jdbc.SQL;


import com.pojo.BookItem;

public class BookItemSqlProvider {//动态sql语句
	
    public String updateBookItem(BookItem bookItem) {
        return new SQL() {
            {
            	UPDATE("bookct.TsellbookItem");
                if(bookItem.getISBN() != "") {
                    SET("ISBN = #{ISBN}");
                }
                if(bookItem.getPrice() != "") {
                    SET("price = #{price}");
                }
                if(bookItem.getIntroduction() != "") {
                    SET("introduction = #{introduction}");
                }
                if(bookItem.getStatus() != "") {
                    SET("status = #{status}");
                }
                WHERE("bookId = #{bookId}");
            }
        }.toString();
    }
    
    public String selectBookItemByValue(@Param("bookId")String bookId,@Param("ISBN")String ISBN,@Param("userId")String userId,@Param("sellDate_yy")String sellDate_yy ,@Param("sellDate_mm")String sellDate_mm ,@Param("sellDate_dd")String sellDate_dd ,@Param("introduction")String introduction,@Param("status")String status) {
    	
    	String sql=new SQL() {
            {
            	SELECT("*");
            	FROM("bookct.TsellbookItem");
                if(bookId!= "") {
                    WHERE("bookId = #{bookId}");
                }
                if(ISBN != "") {
                    WHERE("ISBN = #{ISBN}");
                }
                if(userId != "") {
                    WHERE("userId = #{userId}");
                }
                if(sellDate_yy != "") {
                	WHERE("YEAR(sellDate) = #{sellDate_yy}");                	
                }
                if(sellDate_mm != "") {
                	WHERE("MONTH(sellDate) = #{sellDate_mm}");                	
                }
                if(sellDate_dd != "") {
                	WHERE("DAY(sellDate) = #{sellDate_dd}");                	
                }
                if(introduction != "") {
                	WHERE(" introduction Like \'%"+introduction+"%\'");                	
                }
                if(status != null) {
                	WHERE(" status = #{status}");                	
                }
            }
        }.toString();
        System.out.println("动态sql-----------"+sql);
        return sql;
    }
    
    
}

