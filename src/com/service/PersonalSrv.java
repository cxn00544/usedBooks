package com.service;

import java.util.List;

import com.pojo.OrderMessage_list;
import com.pojo.Personal;
import com.pojo.sp;



public interface PersonalSrv {
	public Personal ischeck(String userName);
	public int addpersonal(Personal personal);
	public int addsp(sp sp);

	public Personal selectByuId(Integer userId);
	public int upPersonal(Personal personal);
	public int uppwd(Personal personal);
	public int delete(Integer userId);
	public List<Personal> findAll();
	public List<Personal> selectById(Integer userId);
	public Personal login(Personal Personal);
	public Personal yzpwd(Personal Personal);
//	public Personal selectId(String userId);
	public void showselectByuId(Integer userId);
	public List<sp> selectspById(Integer userId);
	public int deletesp(Integer spID);
	public List<sp> selectspBysId(Integer spID);
	public List<sp> selectspall();
	public int upstuss(Integer spID);
	public List<OrderMessage_list> fillAllOrderById(Integer userId);
	

}
