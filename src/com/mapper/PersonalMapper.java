package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.type.JdbcType;
import org.springframework.stereotype.Repository;

import com.pojo.OrderMessage_list;
import com.pojo.Personal;
import com.pojo.sp;

@Repository("personalMapper")
public interface PersonalMapper {
	@Select("select userName from Tuser where userName =#{userName}")
	public Personal ischeck(String userName);
	
	@Insert("insert into Tuser (userName,sex,telephone,email,userPassword) "
			+ "values(#{userName},#{sex},#{telephone},#{email},#{userPassword})")
	public int addPersonal(Personal personal);
	@Insert("insert into sp (userId,sp,sptittle,telephone) "
			+ "values(#{userId},#{sp},#{sptittle},#{telephone})")
	public int addsp(sp sp);
	
	@Select("select * from Tuser where userName=#{userName} and userPassword=#{userPassword} and del = 0")
	public Personal login(Personal Personal) ;
	
	@Select("select * from Tuser ")
	public List<Personal> findAll();

	@Select("select * from Tuser where userId=#{userId}")
	public Personal selectByuId(Integer userId);
	@Select("select * from Tuser where userId=#{userId}")
	public List<Personal> selectById(Integer userId);
	@Select("select * from sp where userId=#{userId}")
	public List<sp> selectspById(Integer userId);
	@Select("select * from sp where spID=#{spID}")
	public List<sp> selectspBysId(Integer spID);
	
	

	@Update("update Tuser set del=1 where userId=#{userId}")
	public int delete(Integer userId);	

	
	//	@Delete("delete from Tuser where userId=#{userId}")
//	public int delete(Integer userId);	
	@Delete("delete from sp where spID=#{spID} ")
	public int deletesp(Integer spID);	
//	@Update("update Tuser set is_delete=1 where userId=#{userId}")
//	public int del(Personal personal);
	@Update("update Tuser set  Telephone=#{telephone}, Email=#{email} ,userName=#{userName} where userId=#{userId}")
	public int upPersonal(Personal personal);	
	@Update("update Tuser set userPassword=#{userPassword} where userId=#{userId} ")
	public int uppwd(Personal personal);
   
	@Select("select * from Tuser where userId=#{userId} and userPassword=#{userPassword}")
	public Personal yzpwd(Personal Personal) ;
	
	
	@Select("select * from sp")
	public List<sp> selectspall();


	@Update("update sp set statuss=1 where spID=#{spID}")
	public int upstuss(Integer spID);

	
    
	//根据id查订单，
@Select("")
public List<OrderMessage_list> fillAllOrderById(Integer userId);



	
}
