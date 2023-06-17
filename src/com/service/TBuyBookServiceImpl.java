package com.service;

import com.pojo.TBuyBook;
import com.mapper.TBuyBookMapper;
import com.service.TBuyBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("tBuyBookService")
public class TBuyBookServiceImpl implements TBuyBookService {
	@Autowired
	@Qualifier(value="tBuyBookMapper")
	private TBuyBookMapper tbookMapper;
	public TBuyBook getTBuyBookById(int demandId) {
		return tbookMapper.getTBuyBookById(demandId);
	}

	public boolean updateTBuyBook(TBuyBook tbook) {
		return tbookMapper.updateTBuyBook(tbook);
	}

	public List<TBuyBook> getAllTBuyBook() {
		return tbookMapper.getAllTBuyBookList();
	}
	
	public List<TBuyBook> getAllTBuyBookByUserId(int userId) {
		return tbookMapper.getAllTBuyBookListByUserId(userId);
	}

	public boolean deleteTBuyBook(int demandId) {
		return tbookMapper.deleteTBuyBook(demandId);
	}

	public boolean addTBuyBook(TBuyBook tbook) {
		return tbookMapper.addTBuyBook(tbook);
	}

	@Override
	public TBuyBook checkisbn(String isbn) {
		// TODO 自动生成的方法存根
		return tbookMapper.checkisbn(isbn);
	}

	@Override
	public List<TBuyBook> getAllTBuyBookListByUserId(int userId) {
		// TODO 自动生成的方法存根
		return tbookMapper.getAllTBuyBookListByUserId(userId);
	}


}
