package com.service;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.pojo.Admin;
import com.pojo.Book;
import com.pojo.Personal;
import com.pojo.sp;

public interface AdminSrv {

	public List<Admin> updateAdmin(Admin admin);

	public List<Admin> selectAdminByAdminId(String adminId,String adminPassword);
	
	
	public int deletesp(Integer spID);	
	public List<sp> selectspall();
	public int upstuss(Integer spID);

}
