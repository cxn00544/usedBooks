package com.service;

import com.pojo.SellBook;
import com.mapper.SellBookMapper;
import com.service.SellBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service("sellBookService")
@Transactional
public class SellBookServiceImpl implements SellBookService {
    @Autowired
    @Qualifier(value="sellBookMapper")
    private SellBookMapper sellBookMapper;

    
    public List<SellBook> getAllSellBookByUserId(int userId) {
        return sellBookMapper.getAllSellBookByUserId(userId);
    }
    
    
    public List<SellBook> getAllSellBook() {
        return sellBookMapper.getAllSellBook();
    }

    public boolean addSellBook(SellBook sellBook) {
        return sellBookMapper.addSellBook(sellBook);
    }

    public List<SellBook> getSellBookByKeyword(String keyword) {
        return sellBookMapper.getSellBookByKeyword(keyword);
    }

    public SellBook getSellBookById(int bookId) {
        return sellBookMapper.getSellBookById(bookId);
    }

    public boolean deleteSellBook(int bookId) {
        return sellBookMapper.deleteSellBook(bookId);
    }

    public boolean updateSellBook(SellBook sellBook){
        return sellBookMapper.updateSellBook(sellBook);
    }


	@Override
	public SellBook checkisbn(String isbn) {
		// TODO 自动生成的方法存根
		return sellBookMapper.checkisbn(isbn);
	}


	@Override
	public List<SellBook> getAllSellBookExceptOwner(Integer userId) {
		// TODO 自动生成的方法存根
		return sellBookMapper.getAllSellBookExceptOwner(userId);
	}
}
