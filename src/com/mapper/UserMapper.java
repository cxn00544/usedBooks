package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.pojo.*;

@Repository("UserMapper")
public interface UserMapper {
	
	@Select("select userId,userName,sex,telephone,email from bookct.Tuser where del = 1;")
	public List<User> selectUserAll();
	
	@Select("select userId,userName,sex,telephone,email from bookct.Tuser where del = 1 and userId = #{userId};")
	public List<User> selectUserByUserId(String userId);
	
	@Delete("delete from bookct.Tuser where del = 1 ")
	public int deleteUserAll();	
	
	@Delete("delete from bookct.Tuser where userId = #{userId} ")
	public int deleteUserByUserId(String userId);
	
	@Delete("delete from bookct.TsellbookItem where userId = #{userId} ")
	public int deleteSellItemByUserId(String userId);
	
	@Delete("delete from bookct.TbuybookItem where userId = #{userId} ")
	public int deleteBuyItemByUserId(String userId);
	
	@Delete("delete from bookct.Torder where userId = #{userId} ")
	public int deleteOrderByUserId(String userId);
	
	@Delete("delete from bookct.TconsigneeInfo where userId = #{userId} ")
	public int deleteConsigneeInfoByUserId(String userId);
	
	@Delete("delete from bookct.Tcollect where userId = #{userId} ")
	public int deleteCollectByUserId(String userId);
	
	@Delete("delete from bookct.sp where userId = #{userId} ")
	public int deleteSPByUserId(String userId);
	
}
