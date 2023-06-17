package com.service;

import com.pojo.SellBook;
import com.pojo.TBuyBook;

import java.util.List;

public interface SellBookService {
	public List<SellBook> getAllSellBookByUserId(int userId);
	
    public List<SellBook> getAllSellBook();

    public SellBook getSellBookById(int bookId);

    public boolean addSellBook(SellBook sellBook);

    public List<SellBook> getSellBookByKeyword(String keyword);

    public boolean deleteSellBook(int bookId);

    public boolean updateSellBook(SellBook sellBook);

	public SellBook checkisbn(String isbn);



	public List<SellBook> getAllSellBookExceptOwner(Integer userId);
}
