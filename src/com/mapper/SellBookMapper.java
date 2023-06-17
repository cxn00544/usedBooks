package com.mapper;

import com.pojo.SellBook;
import com.pojo.TBuyBook;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
@Repository("sellBookMapper")
public interface SellBookMapper {
	@Insert("insert into tsellbookitem(isbn,userId,price,sellDate,introduction,status) values(#{isbn}, #{userId}, #{price}, NOW(), #{introduction},'N')")
    boolean addSellBook(SellBook sellBook);

	@Delete("delete from tsellbookitem where bookId=#{bookId} and status='N'")
    boolean deleteSellBook(int bookId);

    @Update("update tsellbookitem set price=#{price},introduction=#{introduction}\r\n" + 
    		"                                 where bookId=#{bookId}")
    boolean updateSellBook(SellBook sellBook);

    @Select("select bookId,tbook.ISBN,tuser.userId,tuser.userName,sellDate,price,introduction,`status`,bookTitle\r\n" + 
    		"        from tsellbookitem,tbook,tuser where tsellbookitem.userId = tuser.userId and\r\n" + 
    		"                                                  tbook.ISBN = tsellbookitem.ISBN and tuser.userId = #{userId}")
    List<SellBook> getAllSellBookByUserId(int userId);
    
    
    @Select("select bookId,tbook.ISBN,tuser.userId,tuser.userName,sellDate,price,introduction,`status`,bookTitle\r\n" + 
    		"        from tsellbookitem,tbook,tuser where tsellbookitem.userId = tuser.userId and\r\n" + 
    		"                                                  tbook.ISBN = tsellbookitem.ISBN and status='N'")
    List<SellBook> getAllSellBook();

    @Select("select bookId,tbook.ISBN,price,introduction,bookTitle,tuser.userName from tsellbookitem,tbook,tuser where tsellbookitem.userId = tuser.userId and"
    		+ " tbook.ISBN = tsellbookitem.ISBN and bookId = #{bookId}")
    SellBook getSellBookById(int bookId);

    @Select("select bookId,tbook.ISBN,tuser.userId,tuser.userName,sellDate,price,introduction,`status`,bookTitle\r\n" + 
    		"        from tsellbookitem,tbook,tuser where tsellbookitem.userId = tuser.userId and\r\n" + 
    		"            tbook.ISBN = tsellbookitem.ISBN and bookTitle like concat('%',#{bookTitle},'%')")
    List<SellBook> getSellBookByKeyword(String keyword);
    @Select("select bookId,tbook.ISBN,tuser.userId,tuser.userName,sellDate,price,introduction,`status`,bookTitle\r\n" + 
    		"        from tsellbookitem,tbook,tuser where tsellbookitem.userId = tuser.userId and\r\n" + 
    		"                                                  tbook.ISBN = tsellbookitem.ISBN and status='N' and tuser.userId != #{userId}")
    List<SellBook> getAllSellBookExceptOwner(Integer userId);
    @Select("select isbn from Tbook where isbn =#{isbn}")
	public SellBook checkisbn(String isbn); 
}
