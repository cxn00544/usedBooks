package com.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.BookTypeMapper;

import com.pojo.BookType;

@Service("BookTypeSrvImpl")
public class BookTypeSrvImpl  implements BookTypeSrv{

	@Autowired
	@Qualifier("BookTypeMapper")
	private BookTypeMapper btm;
	
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<BookType> selectBookTypeAll() {
		List<BookType> list=new ArrayList();
		list=btm.selectBookTypeAll();
		return list;
	}

}
