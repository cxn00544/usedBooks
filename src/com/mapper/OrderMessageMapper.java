package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.pojo.OrderBook;
import com.pojo.OrderMessage;
import com.pojo.OrderMessage_list;


@Repository("orderMessageMapper")
public interface OrderMessageMapper {
	
	@Insert("insert into Torder(userId,submitDate,orderId,bookId) "
			+ "values(#{arg0},#{arg1},#{arg2},#{arg3})")
	
	
	public boolean addorderMessages(int userId,String submitDate,int orderId,int bookId);

	
//	查询用户个人的订单
	@Select("select * from OrderMessageList where userId=#{userId}")
	@ResultType(OrderMessage_list.class)
	public List<OrderMessage_list> getOrderMessageByUserId(int userId);
	
//用户已经完成的订单
	@Select("select * from OrderMessageList where userId=#{userId} and (status=2 or status=3 )  and orderExist=1")
	@ResultType(OrderMessage_list.class)
	public List<OrderMessage_list> getOrderMessageOverByUserId(int userId);
	
//用户还没有完成的订单
	@Select("select * from OrderMessageList where userId=#{arg0} and status=#{arg1} and orderExist=1")
	@ResultType(OrderMessage_list.class)
	public List<OrderMessage_list> getOrderStatusByUserId(int userId,int status);

//查询用户的订单
	@Select("select * from OrderMessageList")
	@ResultType(OrderMessage_list.class)
	public List<OrderMessage_list> findAllOrder();
	
//通过订单编号查询
	@Select("select * from `Torder` where orderNum=#{orderNum} and exist=1")
	public OrderMessage getOrderByNum(Integer orderNum);

//
//	@Update("update `Torder` set exist=0 where orderNum=#{arg0}")
//    public boolean deleteOrderMesaage(Integer orderNum);
//	

	@Update("update `Torder` set status=#{arg0} where orderNum=#{arg1}")
	public boolean updateOrderMeassageStatus(int status,int orderNum);
	
	@Update("update tsellbookitem set status='Y' where bookId=#{bookId}")
	public int delbook(int bookId);
	
	@Update("update tsellbookitem set status='N' where bookId=#{bookId}")
	public int ADDbook(int bookId);
	
}
