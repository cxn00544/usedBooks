package com.mapper;

import com.pojo.TBuyBook;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
@Repository("tBuyBookMapper")
public interface TBuyBookMapper {
	@Insert("insert into tbuybookitem(bookName,isbn,price,publishDate,userId) values(#{bookName}, #{isbn}, #{price}, NOW(), #{userId})")
    public boolean addTBuyBook(TBuyBook tbook);
	@Delete(" delete from tbuybookitem where demandId=#{demandId}")
    public boolean deleteTBuyBook(int demandId);
	@Update("update tbuybookitem set bookName = #{bookName}, isbn=#{isbn}, price=#{price}\r\n" + 
			"                                 where demandId=#{demandId}")
    public boolean updateTBuyBook(TBuyBook tbook);
	@Select("select * from tbuybookitem,tuser where tbuybookitem.userId = tuser.userId")
    public List<TBuyBook> getAllTBuyBookList();
	
	@Select("select * from tbuybookitem where userId = #{userId}")
    public List<TBuyBook> getAllTBuyBookListByUserId(int userId);
	@Select("select isbn,publishDate,price,bookName,userName from tbuybookitem,tuser where tbuybookitem.userId = tuser.userId and demandId = #{demandId}")
    public TBuyBook getTBuyBookById(int demandId);
	
	
    @Select("select isbn from Tbook where isbn =#{isbn}")
	public TBuyBook checkisbn(String isbn); 
}
