package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.OrderBookMapper;
import com.pojo.OrderBook;

@Service("orderbookOrv")
//事务控制
@Transactional(propagation=Propagation.REQUIRED)
public class OrderBookOrvImpl implements OrderBookOrv{
//	注入方式
	@Autowired
	@Qualifier(value="orderBookMapper")
	public OrderBookMapper orderMapper;
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	
	@Override
	public List<OrderBook> findAll() {
		// TODO Auto-generated method stub
		return orderMapper.findAll();
	}

	@Override
	public OrderBook selectOrderBookOrderId(int orderId) {
		// TODO Auto-generated method stub
		return orderMapper.selectOrderBookOrderId(orderId);
	}

	@Override
	public List<OrderBook> OrderAddressByUserId(int userId) {
		// TODO Auto-generated method stub
		return orderMapper.OrderAddressByUserId(userId);
	}

	@Override
	public int addAddress(OrderBook orderbook) {
		// TODO Auto-generated method stub
		return orderMapper.addAddress(orderbook);
	}

	@Override
	public int DeleteAddress(int orderId) {
		// TODO Auto-generated method stub
		return orderMapper.DeleteAddress(orderId);
	}

	@Override
	public int UpdateAddress(OrderBook orderbook) {
		// TODO Auto-generated method stub
		return orderMapper.UpdateAddress(orderbook);
	}



}
