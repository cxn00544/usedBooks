package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.CollectBookMapper;
import com.pojo.CollectBook;
import com.pojo.CollectBookDetail;
@Service("collectbookOrv")
//事务控制
@Transactional(propagation=Propagation.REQUIRED)
public class CollectBookOrvIml implements CollectBookOrv {
//	注入方式
	@Autowired
	@Qualifier(value="collectBookMapper")
	public CollectBookMapper collectMapper;
	
	public CollectBookMapper getCollectMapper() {
		return collectMapper;
	}

	public void setCollectMapper(CollectBookMapper collectMapper) {
		this.collectMapper = collectMapper;
	}

	@Override
	public List<CollectBookDetail> findAll() {
		// TODO Auto-generated method stub
		return collectMapper.findAll();
	}

	@Override
	public List<CollectBookDetail> CollectBookDetailByUserId(int userId) {
		// TODO Auto-generated method stub
		return collectMapper.CollectBookDetailByUserId(userId);
	}

	@Override
	public CollectBookDetail CollectBookBycollectId(String collectId) {
		// TODO Auto-generated method stub
		return collectMapper.CollectBookBycollectId(collectId);
	}

	@Override
	public int collectId(int collectId) {
		// TODO Auto-generated method stub
		return collectMapper.collectId(collectId);
	}

	@Override
	public int DeleteCollect(int collectId) {
		// TODO Auto-generated method stub
		return collectMapper.DeleteCollect(collectId);
	}

	@Override
	public int addCollect(CollectBook CollectBookDetail) {
		// TODO Auto-generated method stub
		return collectMapper.addCollect(CollectBookDetail);
	}

	@Override
	public List<CollectBook> CollectBookByBookId(CollectBook bookId) {
		// TODO Auto-generated method stub
		return collectMapper.CollectBookByBookId(bookId);
	}

	

	

}
