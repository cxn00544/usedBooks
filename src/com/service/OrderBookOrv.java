package com.service;

import java.util.List;

import com.pojo.OrderBook;

public interface OrderBookOrv {

	public List<OrderBook> findAll();
	
	public OrderBook selectOrderBookOrderId(int orderId);
	
	public List<OrderBook> OrderAddressByUserId(int userId);
	
	public int addAddress(OrderBook orderbook);
	
	public int DeleteAddress(int orderId);
	
	public int UpdateAddress(OrderBook orderbook);
	
}
