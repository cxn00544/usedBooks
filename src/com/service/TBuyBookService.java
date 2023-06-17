package com.service;

import com.pojo.TBuyBook;

import java.util.List;

public interface TBuyBookService {
    public TBuyBook getTBuyBookById(int demandId);

	public boolean updateTBuyBook(TBuyBook tbook);

	public List<TBuyBook> getAllTBuyBook();
	
	public List<TBuyBook> getAllTBuyBookByUserId(int userId);

	public boolean deleteTBuyBook(int demandId);

	public boolean addTBuyBook(TBuyBook tbook);

	public TBuyBook checkisbn(String isbn);

	public List<TBuyBook> getAllTBuyBookListByUserId(int userId);
}
