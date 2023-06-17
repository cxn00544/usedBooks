package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.mapper.PersonalMapper;
import com.pojo.OrderMessage_list;
import com.pojo.Personal;
import com.pojo.sp;


@Service("personalSrv")
@Transactional(propagation=Propagation.REQUIRED)
public class PersonalSrvImpl implements PersonalSrv {
	
	@Autowired
	@Qualifier(value="personalMapper")
	public PersonalMapper perMapper;
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	
	public Personal ischeck(String userName) {
		return perMapper.ischeck(userName);
	}
	@Override
	public int addpersonal(Personal personal) {
		// TODO Auto-generated method stub
		return perMapper.addPersonal(personal);
	}
	@Override
	public int addsp(sp sp) {
		// TODO Auto-generated method stub
		return perMapper.addsp(sp);
	}
	
	
	
	
	@Override
	public Personal selectByuId(Integer userId) {
		// TODO Auto-generated method stub

		return perMapper.selectByuId(userId);
	}
//	public Personal selectId(String userId) {
//		return perMapper.selectId(userId);
//	}
//	
	
	@Override
	public int upPersonal(Personal personal) {
		// TODO Auto-generated method stub
		return perMapper.upPersonal(personal);
	}	
	@Override
	public int uppwd(Personal personal) {
		// TODO Auto-generated method stub
		return perMapper.uppwd(personal);
	}	
	
	@Override
	public int delete(Integer userId) {
		// TODO Auto-generated method stub
		return perMapper.delete(userId);
	}
	
	@Override
	public Personal login(Personal Personal) {
		// TODO Auto-generated method stub
		return perMapper.login(Personal);
	}

	@Override
	public Personal yzpwd(Personal Personal) {
		// TODO Auto-generated method stub
		return perMapper.yzpwd(Personal);
	}
	

	@Override
	public List<Personal> findAll() {
		// TODO Auto-generated method stub
		return perMapper.findAll();
	}

	public PersonalMapper getPerMapper() {
		return perMapper;
	}

	public void setPerMapper(PersonalMapper perMapper) {
		this.perMapper = perMapper;
	}
	@Override
	public void showselectByuId(Integer userId) {
		// TODO �Զ����ɵķ������		
	}
	@Override
	public List<Personal> selectById(Integer userId) {
	
		 return perMapper.selectById(userId);
		
		
	}
	@Override
	public List<sp> selectspById(Integer userId) {
		// TODO Auto-generated method stub
		return perMapper.selectspById(userId);
	}

	@Override
	public int deletesp(Integer spID) {
		// TODO 自动生成的方法存根
		return perMapper.deletesp(spID);
	}
	@Override
	public List<sp> selectspBysId(Integer spID) {
		// TODO 自动生成的方法存根
		return perMapper.selectspBysId(spID);
	}
	
	
	
	
	@Override
	public List<sp> selectspall() {
		// TODO 自动生成的方法存根
		return perMapper.selectspall();
	}
	@Override
	public int upstuss(Integer spID) {
		// TODO 自动生成的方法存根
		return perMapper.upstuss(spID);
	}

	@Override
public List<OrderMessage_list> fillAllOrderById(Integer userId) {
	// TODO 自动生成的方法存根
	return perMapper.fillAllOrderById(userId);
}

	


}
