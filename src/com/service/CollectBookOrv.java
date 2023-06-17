package com.service;

import java.util.List;

import com.pojo.CollectBook;
import com.pojo.CollectBookDetail;

public interface CollectBookOrv {
	public List<CollectBookDetail> findAll();
	
	public List<CollectBookDetail> CollectBookDetailByUserId(int userId);
	
	public CollectBookDetail CollectBookBycollectId(String collectId);
	
	public int collectId(int collectId);
	
	public int DeleteCollect(int collectId);
	
	public int addCollect( CollectBook CollectBookDetail);
	
	List<CollectBook> CollectBookByBookId(CollectBook bookId);
	
}
