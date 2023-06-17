package com.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pojo.OrderBook;
import com.pojo.OrderMessage;
import com.pojo.OrderMessage_list;
import com.pojo.Personal;
import com.pojo.SellBook;
import com.service.OrderBookOrv;
import com.service.OrderMessageOrv;
import com.service.PersonalSrv;
import com.service.SellBookService;





@Controller
 
public class orderMessageController {
//	订单信息 
	@Autowired
	@Qualifier(value="orderbookmessageOrv")
	OrderMessageOrv ordermessageOrv;
//地址信息
	@Autowired
	@Qualifier(value="orderbookOrv")
	OrderBookOrv OrderOrv;
//	订单信息
	@Autowired
	@Qualifier(value="sellBookService")
	private SellBookService sellBookService;
	
   @Autowired
	@Qualifier(value="personalSrv")
	PersonalSrv perSrv;
//	显示个人所有的订单
	
	@RequestMapping(value="/selectOrderByUserId")
	public String selectOrderByUserId( Integer userId, Model model) {
		
	List<OrderMessage_list> OrderMessage_list = ordermessageOrv.getOrderMessageByUserId(userId);
//		request.setAttribute("OrderMessageList", OrderMessage_list);
		
		
		 System.out.println(userId);  
//      List<OrderMessage_list> OrderMessage_list = perSrv.fillAllOrderById(userId);
	      System.out.print(OrderMessage_list);
	      model.addAttribute("OrderMessageList", OrderMessage_list); 
	      return "ShowOrderMessage";
	  
	}
//跳转到生成订单页面，选择收货地址
	//  删除商品的同时生成订单
	  @RequestMapping("/doDeleteSellBookToIndex")
	  public String doDeleteSellBookToIndex(Integer userId,Model model,int bookId) {
	ordermessageOrv.delbook(bookId);  
	  SellBook sellBook = sellBookService.getSellBookById(bookId);
	  model.addAttribute("sellBook", sellBook);
	  System.out.println(bookId); 
//	  收货地址
	  List<OrderBook> list1 = OrderOrv.OrderAddressByUserId(userId);
	  model.addAttribute("addressList", list1); 
	  
		  return "noapymessgae";
	  }
	  
	//生成一条新的订单信息 noapymessage
		@RequestMapping("/addordermeaasge")
		public String createOrder(OrderMessage ordermessage,HttpServletRequest request,Integer userId) {
		
			HttpSession session = request.getSession( );		
			Personal user = (Personal)session.getAttribute("user");
			int userId1 = user.getUserId();
			
//		付款时间
		Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String  submitDate= dateFormat.format(new Date());
		
		int orderId = Integer.parseInt(request.getParameter("addOrderaddressid"));
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		

		request.setAttribute("orderId", orderId);
		request.setAttribute("bookId", bookId);
		
		ordermessageOrv.addorderMessages(userId1,submitDate,orderId,bookId);
		ordermessageOrv.getOrderMessageByUserId(userId1);
//将订单状态改为等待发货
		

    return "redirect:/selectOrderByUserId?&userId="+userId;
    
    }
//	退货
	@RequestMapping("/doAddsellbookToIndex")
public String doAddsellbookToIndex(HttpServletRequest request,Model model,Integer userId)throws UnsupportedEncodingException {
		
		int orderNum = Integer.parseInt(request.getParameter("orderNum"));
		OrderMessage order = ordermessageOrv.getOrderByNum(orderNum);
		int bookId = Integer.parseInt(request.getParameter("bookId"));

	
		ordermessageOrv.ADDbook(bookId);
		ordermessageOrv.updateOrderMeassageStatus(3,orderNum);
		 return "redirect:/selectallcancelOrder?&userId="+userId;
	}
	
	
//	显示所有完成的订单
	@RequestMapping("/ConfirmCeceipt")
	public String ConfirmCeceipt(HttpServletRequest request) {
		HttpSession session = request.getSession( );		
		Personal user = (Personal)session.getAttribute("user");
		int userId1 = user.getUserId();
		

		int orderNum = Integer.parseInt(request.getParameter("orderNum"));
		OrderMessage order = ordermessageOrv.getOrderByNum(orderNum);
		
		List<OrderMessage_list> OrderMessage_list = ordermessageOrv.getOrderMessageByUserId(userId1);
		ordermessageOrv.updateOrderMeassageStatus(3,orderNum);
		request.setAttribute("OrderMessage_list", OrderMessage_list);
		
		return "redirect:/selectOrderByUserId?&userId="+userId1;
	}
//	显示所有退货的订单
	@RequestMapping(value="/selectallcancelOrder")
	public String selectallcancelOrder(Integer userId, Model model) {
		
		List<OrderMessage_list> OrderMessage_list = ordermessageOrv.getOrderStatusByUserId(userId,3);
		  model.addAttribute("OrderMessageList", OrderMessage_list); 

		  System.out.println(userId); 
		 System.out.println(OrderMessage_list); 

		
		return "showCancelorder";
	}

	
//	将订单状态改为完成
	@RequestMapping("/Confirmorder")
public String Confirmorder(HttpServletRequest request,Model model,Integer userId)throws UnsupportedEncodingException {
		
		int orderNum = Integer.parseInt(request.getParameter("orderNum"));
		OrderMessage order = ordermessageOrv.getOrderByNum(orderNum);
		int bookId = Integer.parseInt(request.getParameter("bookId"));

		
		ordermessageOrv.updateOrderMeassageStatus(2,orderNum);
		 return "redirect:/selectallevaluatedOrder?&userId="+userId;
	}

//	显示所有待评价的订单
	@RequestMapping(value="/selectallevaluatedOrder")
	public String selectallevaluatedOrder(Integer userId, Model model) {
	
		List<OrderMessage_list> OrderMessage_list = ordermessageOrv.getOrderStatusByUserId(userId,2);
		  model.addAttribute("OrderMessageList", OrderMessage_list); 

		  System.out.println(userId); 
		 System.out.println(OrderMessage_list); 

		return "showevaluatedOrder";
	}

//	显示所有等待发货的订单
	@RequestMapping(value="/showallwaitorder")
	public String showallwaitorder(HttpServletRequest request,Model model,Integer userId) {
	
		HttpSession session = request.getSession( );		
		Personal user = (Personal)session.getAttribute("user");
		int userId1 = user.getUserId();
		
		List<OrderMessage_list> OrderMessage_list = ordermessageOrv.getOrderStatusByUserId(userId,0);
		  model.addAttribute("OrderMessageList", OrderMessage_list); 
		  
		  System.out.println(userId); 
		  System.out.println("6666666666666"); 
		 System.out.println(OrderMessage_list); 
		  System.out.println("6666666666666"); 
		return "showallwaitorder";
	}
//	删除订单
//	@RequestMapping(value="/deleteorder")
//	public String DeleteOrderByIdServlet(HttpServletRequest request,Model model ){
//		HttpSession session = request.getSession( );		
//		Personal user = (Personal)session.getAttribute("user");
//		int userId1 = user.getUserId();
//		
//		int orderNum = Integer.parseInt(request.getParameter("orderNum"));
//		ordermessageOrv.deleteOrderMesaage(orderNum);
//		List<OrderMessage_list> OrderMessage_list = ordermessageOrv.getOrderMessageByUserId(userId1);
//		
//		  System.out.println("6666666666666"); 
//			 System.out.println(userId1); 
//			 System.out.println(OrderMessage_list);
//			  System.out.println("6666666666666");
//
//			    return "redirect:/selectOrderByUserId?&userId="+userId1;
//	}
//	

}



