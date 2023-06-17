package com.service;

import java.util.List;

import com.pojo.User;

public interface UserSrv {
	
	public List<User> selectUserAll();
	public List<User> selectUserByUserId(String userId);
	public int deleteUserAll();	
	public int deleteUserByUserId(String userId);

}
