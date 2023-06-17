package com.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pojo.OrderBook;
import com.pojo.Personal;
import com.service.OrderBookOrv;
import com.service.PersonalSrv;




@Controller
public class oadddressaddController {
	@Autowired
	@Qualifier(value="orderbookOrv")
	OrderBookOrv OrderOrv;
	

	
	@Autowired
	private HttpSession session;
	
	
	
	
//	  显示用户个人所有的收货地址
//	@RequestMapping(value="/showalltaddressbookByUserID")
//	public String showalltaddressbook(HttpServletRequest request,Model model)throws UnsupportedEncodingException{
//		int userId=(int)session.getAttribute("userId");
//		 System.out.println(userId);
//		List<OrderBook> list1 = OrderOrv.OrderAddressByUserId(userId);
//		
//		request.setAttribute("addressList",list1);
//		
//		return "showalltaddressbook";
//
//	}

	 //显示用户个人所有的收货地址:
	   @RequestMapping("/showalltaddressbookByUserID")
	    public String showalltaddressbook(Integer userId, Model model){
     System.out.println(userId);  
     List<OrderBook> list1 = OrderOrv.OrderAddressByUserId(userId);	
     model.addAttribute("addressList", list1); 
     return "showalltaddressbook";

 }	  
//	新增收货地址
	  @RequestMapping(value="/oadddressadd")
	  public String oadddressadd() {
		return "oadddressadd";
		  
	  }
	  
//	  新增收货地址
	  @RequestMapping("/addone")
      public String addone(HttpServletRequest request,Model model){

		  String userId = request.getParameter("userId");
		  String address = request.getParameter("address");
		  String phoneNum = request.getParameter("phoneNum");
		  String name = request.getParameter("name");
		  String detail = request.getParameter("detail");
		  OrderBook  orderbook = new OrderBook();
		  
		  orderbook.setUserId(Integer.parseInt(userId));
		  orderbook.setAddress(address);
		  orderbook.setPhoneNum(phoneNum);
		  orderbook.setName(name);
		  orderbook.setDetail(detail);
		  
		  OrderOrv.addAddress(orderbook);

      return "redirect:/showalltaddressbookByUserID?&userId="+userId;
  }

//	@RequestMapping("/showaddress")
//	public ModelAndView showaddress(OrderBook orderbook) {
//		ModelAndView mv=new ModelAndView();
//		List<OrderBook> list1 = OrderOrv.findAll();
//		mv.addObject("addressList",list1);
//		mv.setViewName("noapymessgae");
//		return mv;
//
//	}
//	对地址信息进行查询
	@RequestMapping("/showAddressDetailById")
	public String showAddressDetailById(@RequestParam(value="orderId") int orderId,Model model) {
//		OrderBook address = OrderOrv.selectOrderBookOrderId(orderId);
		
		
		OrderOrv.selectOrderBookOrderId(orderId);
		return "showAddressDetailById";
	}
	 @RequestMapping("/deleteAddress")
	 public String deleteAddress(HttpServletRequest request,Model model){
		 HttpSession session = request.getSession( );		
			Personal user = (Personal)session.getAttribute("user");
			int userId = user.getUserId();
			int orderId =Integer.parseInt(request.getParameter("orderId"));
		
		 OrderOrv.DeleteAddress(orderId);
		 
		 return "redirect:/showalltaddressbookByUserID?&userId="+userId;
	        
	 }
	 @RequestMapping("/toupdateAddress")
	  public String toupdateAddress(Model model,int orderId) {
		 
		 OrderBook orderbook = OrderOrv.selectOrderBookOrderId(orderId);
		 System.out.print(orderbook);
		 model.addAttribute("orderbook1",orderbook);
		 return "orderbookAddressedit";
			  
		  }

//	 对地址进行更新 原本有的jsp页面
//	 所有  toupdate = updateaddress  updatebook=orderbookAddressedit=updateaddress
	 @RequestMapping("/orderbookAddressedit")
	 public String UpdateAddress(Model model,OrderBook orderbook1) {
		System.out.print(orderbook1);
		OrderOrv.UpdateAddress(orderbook1);
		int userId =orderbook1.getUserId();
		OrderBook orderbook = OrderOrv.selectOrderBookOrderId(orderbook1.getOrderId());
		model.addAttribute("orderbook",orderbook);
	    return "redirect:/showalltaddressbookByUserID?&userId="+userId;
	 }
		
	
	

}
