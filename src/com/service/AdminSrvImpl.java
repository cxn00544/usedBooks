package com.service;

import java.util.ArrayList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.AdminMapper;
import com.pojo.Admin;
import com.pojo.Personal;
import com.pojo.sp;

@Service("AdminSrvImpl")
@Transactional(propagation=Propagation.REQUIRED)
public class AdminSrvImpl implements AdminSrv {
	
	@Autowired
	@Qualifier("AdminMapper")
	private AdminMapper am;
	
	public List<Admin> updateAdmin(Admin admin) {
		System.out.println("service:updateAdmin   "+admin.getAdminId()+admin.getAdminName()+admin.getAdminPassword()+admin.getTelephone()+admin.getEmail());
		int flag =am.updateAdmin(admin);
		List<Admin> list=new ArrayList<>();
		if(flag==1) {
			list=am.selectAdminInfo(admin.getAdminId());
			list.get(0).toString();
		}
		return list;
	}

	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Admin> selectAdminByAdminId(String adminId,String adminPassword) {
		List<Admin> a=am.selectAdminByAdminId(adminId,adminPassword);
		return a;
	}
	



	public AdminMapper getAm() {
		return am;
	}


	public void setBm(AdminMapper am) {
		this.am = am;
	}



	@Override
	public List<sp> selectspall() {
		// TODO 自动生成的方法存根
		return am.selectspall();
	}

	@Override
	public int upstuss(Integer spID) {
		// TODO 自动生成的方法存根
		return am.upstuss(spID);
	}

	@Override
	public int deletesp(Integer spID) {
		// TODO 自动生成的方法存根
		return am.deletesp(spID);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
