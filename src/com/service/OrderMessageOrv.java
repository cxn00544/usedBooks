 package com.service;

import java.util.List;

import com.pojo.OrderMessage;
import com.pojo.OrderMessage_list;

public interface OrderMessageOrv {
//	public int addorderMessage(OrderMessage ordermessage);
//	public List<OrderMessage> findAll();
//	public List<OrderMessage_list> fillAllOrder(int orderId);
//	List<OrderMessage_list> fillAllOrder();
	
	public boolean addorderMessages(int userId,String submitDate,int orderId,int bookId);
	
//	public boolean deleteOrderMesaage(Integer orderNum);
//	

	
	public boolean updateOrderMeassageStatus(int status,int orderNum);
	
	public List<OrderMessage_list> getOrderMessageByUserId(int userId);
	
	public List<OrderMessage_list> getOrderMessageOverByUserId(int userId);
	
	public List<OrderMessage_list> getOrderStatusByUserId(int userId,int status);

	public List<OrderMessage_list> findAllOrder();
	
	public OrderMessage getOrderByNum(Integer orderNum);

	public int delbook(int bookId);
	
	public int ADDbook(int bookId);

//	boolean updateOrderMeassageStatus(int status, int orderNum);
}
