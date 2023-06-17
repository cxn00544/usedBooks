package com.controller;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
//调用Service层实现的方法，实现一些操作，并与前端进行交互。
//所有的控制器都应该是由Spring管理的，所以，需要为控制器类添加@Controller注解：
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pojo.CollectBookDetail;
import com.pojo.OrderBook;
import com.pojo.OrderMessage_list;
import com.pojo.Personal;
import com.pojo.SellBook;
import com.pojo.sp;
import com.service.CollectBookOrv;
import com.service.OrderBookOrv;
import com.service.OrderMessageOrv;
import com.service.PersonalSrv;
import com.service.SellBookService;


@Controller
public class PersonalController {
    @Autowired
	@Qualifier(value="personalSrv")
	PersonalSrv perSrv;
	

	@Autowired
	@Qualifier(value="collectbookOrv")
	CollectBookOrv collectOrv;
//	订单信息 
	@Autowired
	@Qualifier(value="orderbookmessageOrv")
	OrderMessageOrv ordermessageOrv;
//地址信息
	@Autowired
	@Qualifier(value="orderbookOrv")
	OrderBookOrv OrderOrv;
	
	 @Autowired
    @Qualifier(value="sellBookService")
    private SellBookService sellBookService;
	

	
		
		@RequestMapping(value="/toIndex")
		public ModelAndView toIndex(HttpSession session) {		
			
			ModelAndView mv = new ModelAndView();
			Personal user = (Personal) session.getAttribute("user");
			List<SellBook> list = sellBookService.getAllSellBookExceptOwner(user.getUserId());
	        mv.addObject("list", list);
	        mv.setViewName("index");
			return mv;
		  } 
	
	@RequestMapping(value="/center")
	public String center(int userId,ModelAndView mv) {		
	    	mv.addObject("userId", userId);		
	          return "center";

	  }
	
//注册：通过网页表单获取用户输入的数据传给后端录入数据库。
//	请求对应的是方法,在方法的声明之前添加注解。
	
	@RequestMapping(value="/personaladd",method=RequestMethod.POST)
	public String addersonal(Personal personal,HttpSession session)  {
		  Personal u = perSrv.ischeck(personal.getUserName());
	      if (u == null) {
	    		perSrv.addpersonal(personal);		
	          return "zccg";
	      }
	  	session.setAttribute("zcMsg","用户名重复，请重新填写");		
        return "zcsb";
	  }
	
	   //用户添加意见反馈:
		@RequestMapping(value="/addsp",method=RequestMethod.POST)
		public String addsp(sp sp) {		
		    		perSrv.addsp(sp);		
		          return "spcg";

		  } 
	
//登陆：验证输入的id和密码是否和数据库里的id和密码一 一匹配来实现登录。
	

		@RequestMapping(value="/userlogin",method=RequestMethod.POST)
		public ModelAndView login(Personal Personal,HttpSession session) {
			ModelAndView mv =new ModelAndView();
			Personal user=perSrv.login(Personal);
		       System.out.println(user);  
			if(user!=null) {
	    	    session.setAttribute("user",user);	
	    		mv.addObject("user",user);	
	    		System.out.println(user.getUserId());
				List<SellBook> list = sellBookService.getAllSellBookExceptOwner(user.getUserId());
				System.out.println(000);
				System.out.println("list:" + list);
				System.out.println(000);
				List<OrderBook> list1 = OrderOrv.findAll();
		        mv.addObject("list", list); 
		        mv.addObject("addressList", list1); 
		        if (session.getAttribute("loginMsg") != null) {
		            session.removeAttribute("loginMsg");
		            }	
				mv.setViewName("index");

			}else {
				session.setAttribute("loginMsg","账号或密码错误");			
				mv.setViewName("login");
			}		
			return mv;	
		}
//退出登录	
	  @RequestMapping("/logout")
	    public String logout(HttpSession session) {
	        // 删除会话里保存的用户名信息
	        session.removeAttribute("user");

	        // 结束会话
	        session.invalidate();
	        // 跳转到前台登录页面
	        return "login"; // 逻辑视图名
	    }
	


	//管理用户个人中心：
//	在登录的时候设置了一个session对象，登录时已经把登录用户的个人信息都存进了session里。
//	而进入查看修改个人信息以及注销账户页面时需要的userid都是从session中取得的。
	
//查看个人信息时，先要重新查询，把返回结果通过model.addattributet把数据传给前端，在jsp中通过el表达式可以获取到。
//返回用户个人信息:
	   @RequestMapping("/findUserById")
	    public String FindById( Integer userId, Model model){
      System.out.println(userId);  
      List<Personal> userByID = perSrv.selectById(userId);
      model.addAttribute("userById", userByID); // 往前端传List，通过el表达式 ${}可以获取到
      return "personallook";
  }	
	   
	   
		 //显示用户个人所有的收货地址:
//		   @RequestMapping("/showalltaddressbookByUserID")
//		    public String showalltaddressbook( Integer userId, Model model){
//	      System.out.println(userId);  
//	      List<OrderBook> list1 = OrderOrv.OrderAddressByUserId(userId);	
//	      model.addAttribute("addressList", list1); 
//	      return "showalltaddressbook";
//
//	  }	  
		   

			 //显示用户个人所有的收藏:
		   @RequestMapping("/CollectDetailByUserId")
		    public String CollectDetailByUserId( Integer userId, Model model){
	      System.out.println(userId);  
	      List<CollectBookDetail> collectBookList = collectOrv.CollectBookDetailByUserId(userId);	
	      System.out.print(collectBookList);
	      model.addAttribute("collectBookList", collectBookList); 
	      return "collectBook";

	  }	  
      
//		  //显示用户个人所有的订单:
//		   @RequestMapping("/ddByUserId")
//		    public String dbByUserId( Integer userId, Model model){
//	      System.out.println(userId);  
//	      List<OrderMessage_list> OrderMessage_list = perSrv.fillAllOrderById(userId);
//	      System.out.print(OrderMessage_list);
//	      model.addAttribute("OrderMessage_list", OrderMessage_list); 
//	      return "ShowOrderMessage";
//
//	  }	
		   
	   
	   
	   
	 //返回用户所有意见:
	   @RequestMapping("/findspById")
	    public String FindspById( Integer userId, Model model){
      System.out.println(userId);  
      List<sp> problem = perSrv.selectspById(userId);
      model.addAttribute("problem", problem); 
      return "splook";

  }	

	   
	   

	 //更改个人信息前先进行查询
		 @RequestMapping("/toupdatepersonal")
		  public String toupdatepersonal(Model model,Integer userId) {
			 Personal personal = perSrv.selectByuId(userId);
			 System.out.print(personal);
			 model.addAttribute("personal1",personal);
			 return "modifyPersonal";	  
			  }
		 
//		 对个人信息进行修改，修改后跳转回个人中心页面。
		 @RequestMapping("/updatepersonal")
		 public String updatepersonal(Model model,Personal personal1) {
			System.out.print(personal1);
			perSrv.upPersonal(personal1);
//			Personal personal = perSrv.selectByuId(personal1.getUserId());
//			model.addAttribute("Personal",personal);	
			return "actionsucess";
		 }
		 //先查询再修改。
		 @RequestMapping("/toupdatepwd")
		  public String toupdatepwd(Model model,Integer userId) {
			 Personal personal = perSrv.selectByuId(userId);
			 System.out.print(personal);
			 model.addAttribute("personal2",personal);
			 return "yzmodifypwd";	  
			  }
		 @RequestMapping("/yzupdatepwd")
		  public String yzupdatepwd(Model model,Personal Personal,Integer userId ,HttpSession session) {

			 Personal yz = perSrv.yzpwd(Personal);
		   System.out.println(yz);  
			if(yz!=null) {
	    	    session.setAttribute("yz",yz);	
		        if (session.getAttribute("yzMsg") != null) {
		            session.removeAttribute("yzMsg");
		            }	
		
				return "modifypwd";	

			}else {
				session.setAttribute("yzMsg","密码错误");			
			
				return "yzmodifypwd";	  
			}		
		  
			  }
			
	
			//更改密码
		 @RequestMapping("/updatepwd")
		 public String updatepwd(Model model,Personal personal2) {
			System.out.print(personal2);
			perSrv.uppwd(personal2);
//			Personal personal = perSrv.selectByuId(personal2.getUserId());
//			model.addAttribute("Personal",personal);
			return "actionsucess";
		 }
	
	//注销账户：就是直接删除数据库中该用户所有个人信息，是物理删除。
	@RequestMapping(value="/deletezh")
	public String delete(@RequestParam Integer userId,Model model) {
		perSrv.delete(userId);
		return "zxcg";	
	}
	
	@RequestMapping(value="/deletesp")
	public String deletesp(@RequestParam Integer spID,Model model) {
		perSrv.deletesp(spID);
		return "actionsucess";	
	}
	
	


//		//返回所有用户信息
//		@RequestMapping("/showall")
//		public ModelAndView showalltaddressbook(Personal personal) {
//			ModelAndView mv=new ModelAndView();
//			List<Personal> list1 = perSrv.findAll();
//			mv.addObject("personallist",list1);
//			mv.setViewName("gl");
//			return mv;
//		}	


	
	
}
