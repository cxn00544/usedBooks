package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;
import org.springframework.stereotype.Repository;

import com.pojo.Admin;
import com.pojo.sp;

@Repository("AdminMapper")
public interface AdminMapper {

	// 改
	@Update("update bookct.Tadministrator set adminName=#{adminName},adminPassword=#{adminPassword},telephone=#{telephone},email=#{email} where adminId=#{adminId}") 
	public int updateAdmin(Admin admin);

	// 查
	@Select("select * from bookct.Tadministrator where adminId=#{adminId} and adminPassword=#{adminPassword};")
	public List<Admin> selectAdminByAdminId(@Param("adminId")String adminId,@Param("adminPassword")String adminPassword);
	
	@Select("select * from bookct.Tadministrator where adminId=#{adminId} ;")
	public List<Admin> selectAdminInfo(String adminId);
	
	
	@Delete("delete from sp where spID=#{spID} ")
	public int deletesp(Integer spID);	
	@Select("select * from sp")
	public List<sp> selectspall();
	@Update("update sp set statuss=1 where spID=#{spID}")
	public int upstuss(Integer spID);


}
