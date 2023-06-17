package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.OrderMessageMapper;
import com.pojo.OrderMessage;
import com.pojo.OrderMessage_list;
@Service("orderbookmessageOrv")
//事务控制
@Transactional(propagation=Propagation.REQUIRED)
public class OrderMessageOrvImpl implements OrderMessageOrv {
//	注入方式
	@Autowired
	@Qualifier(value="orderMessageMapper")
	public OrderMessageMapper ordermessageMapper;
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	@Override
	public boolean addorderMessages(int userId, String submitDate, int orderId, int bookId) {
		// TODO Auto-generated method stub
		return ordermessageMapper.addorderMessages(userId, submitDate, orderId, bookId);
	}

//	@Override
//	public boolean deleteOrderMesaage(Integer orderNum) {
//		// TODO Auto-generated method stub
//		return ordermessageMapper.deleteOrderMesaage(orderNum);
//	}


	

	@Override
	public List<OrderMessage_list> getOrderMessageByUserId(int userId) {
		// TODO Auto-generated method stub
		return ordermessageMapper.getOrderMessageByUserId(userId);
	}

	@Override
	public List<OrderMessage_list> getOrderMessageOverByUserId(int userId) {
		// TODO Auto-generated method stub
		return ordermessageMapper.getOrderMessageOverByUserId(userId);
	}

	@Override
	public List<OrderMessage_list> getOrderStatusByUserId(int userId, int status) {
		// TODO Auto-generated method stub
		return ordermessageMapper.getOrderStatusByUserId(userId, status);
	}

	@Override
	public List<OrderMessage_list> findAllOrder() {
		// TODO Auto-generated method stub
		return ordermessageMapper.findAllOrder();
	}

	@Override
	public OrderMessage getOrderByNum(Integer orderNum) {
		// TODO Auto-generated method stub
		return ordermessageMapper.getOrderByNum(orderNum);
	}

	@Override
	public int delbook(int bookId) {
		// TODO 自动生成的方法存根
		return ordermessageMapper.delbook(bookId);
	}

	@Override
	public int ADDbook(int bookId) {
		// TODO Auto-generated method stub
		return ordermessageMapper.ADDbook(bookId);
	}

	@Override
	public boolean updateOrderMeassageStatus(int status, int orderNum) {
		// TODO Auto-generated method stub
		return ordermessageMapper.updateOrderMeassageStatus(status, orderNum);
	}
	

	
	

}
