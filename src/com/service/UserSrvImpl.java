package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.UserMapper;
import com.pojo.User;
@Service("UserSrvImpl")
@Transactional(propagation=Propagation.REQUIRED)
public class UserSrvImpl implements UserSrv {

	@Autowired
	@Qualifier("UserMapper")
	private UserMapper um;
	
	@Override
	public List<User> selectUserAll() {
		List<User> u=um.selectUserAll();
		return u;
	}

	@Override
	public List<User> selectUserByUserId(String userId) {
		List<User> u=um.selectUserByUserId(userId);
		return u;
	}

	@Override
	public int deleteUserAll() {
		int flag=um.deleteUserAll();
		return flag;
	}

	@Override
	public int deleteUserByUserId(String userId) {
		um.deleteSellItemByUserId(userId);
		um.deleteBuyItemByUserId(userId);
		um.deleteOrderByUserId(userId);
		um.deleteConsigneeInfoByUserId(userId);
		um.deleteCollectByUserId(userId);
		um.deleteSPByUserId(userId);
		int flag=um.deleteUserByUserId(userId);
		
		return flag;
	}

	public UserMapper getUm() {
		return um;
	}

	public void setUm(UserMapper um) {
		this.um = um;
	}

}
