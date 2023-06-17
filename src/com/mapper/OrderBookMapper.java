package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.pojo.OrderBook;

@Repository("orderBookMapper")
public interface OrderBookMapper {

	@Select("select * from TconsigneeInfo")
	@ResultType(OrderBook.class)
	public List<OrderBook> findAll();
	
	@Select("select * from TconsigneeInfo where orderId=#{orderId}")
	@ResultType(OrderBook.class)
	public OrderBook selectOrderBookOrderId(int orderId);
	

	@Select("select * from TconsigneeInfo,Tuser where TconsigneeInfo.userId = Tuser.userId and Tuser.userId=#{userId} and tconsigneeInfo.exist=1")
	@ResultType(OrderBook.class)
	public List<OrderBook> OrderAddressByUserId(int userId);
	
	@Insert("insert into TconsigneeInfo(userId,name,phoneNum,address,detail) values(#{userId},#{name},#{phoneNum},#{address},#{detail})")
	public int addAddress(OrderBook orderbook);
	
	@Delete("update TconsigneeInfo set exist = 0 where orderId=#{orderId}")
	public int DeleteAddress(int orderId);
	
	@Update("update TconsigneeInfo set name = #{name},phoneNum = #{phoneNum},address = #{address},detail = #{detail} where orderId=#{orderId}")
	public int UpdateAddress(OrderBook orderbook);
//	
	
	
	
	
	
}
