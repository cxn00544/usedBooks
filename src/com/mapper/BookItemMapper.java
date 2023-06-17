package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.UpdateProvider;
import org.springframework.stereotype.Repository;

import com.pojo.BookItem;

@Repository("BookItemMapper")
public interface BookItemMapper {

	// 删
	@Delete("delete from bookct.TsellbookItem where bookId=#{bookId};")
	public int deleteBookItem(String bookId);

	// 改
	@UpdateProvider(type = BookItemSqlProvider.class, method = "updateBookItem") // 动态sql
	public int updateBookItem(BookItem bookItem);

	// 查
	@Select("select * from bookct.TsellbookItem order by ISBN ASC;")
	public List<BookItem> selectBookItemAll();
	
	@SelectProvider(type = BookItemSqlProvider.class, method = "selectBookItemByValue")
	public List<BookItem> selectBookItemByValue(@Param("bookId")String bookId,@Param("ISBN")String ISBN,@Param("userId")String userId,@Param("sellDate_yy")String sellDate_yy ,@Param("sellDate_mm")String sellDate_mm ,@Param("sellDate_dd")String sellDate_dd ,@Param("introduction")String introduction,@Param("status")String status);
	
}
