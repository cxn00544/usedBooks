package com.controller;

import java.util.List;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;


import com.pojo.*;
import com.service.*;

@Controller
public class AdminPageJumpController {
	
	@Autowired
	@Qualifier("BookSrvImpl")
	private BookSrv bookSrv;
	
	@Autowired
	@Qualifier("AdminSrvImpl")
	private AdminSrv adminSrv;
	
	@Autowired
	@Qualifier("BookTypeSrvImpl")
	private BookTypeSrv bookTypeSrv;
	
	@Autowired
	@Qualifier("BookItemSrvImpl")
	private BookItemSrv bookItemSrv;

	@Autowired
	@Qualifier("UserSrvImpl")
	private UserSrv userSrv;
	
	@ExceptionHandler({Exception.class})       
    public String exception(Exception e,Model model) {       
        System.out.println(e.getMessage());  
        model.addAttribute("msg", "登录失败！请检查登录ID和密码");
        return "adminLogin";       
    }
	
	@RequestMapping("/adminLogin")
	public String adminLogin(String adminId,String adminPassword,Model model,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		List<Admin> a=adminSrv.selectAdminByAdminId(adminId,adminPassword);
		String re = "adminLogin";
		session.removeAttribute("msg");
		if(a.size()==1) {
			Admin admin=a.get(0);			
			request.getSession().setAttribute("adminInfo",admin);
			request.setAttribute("adminInfo",admin);
			model.addAttribute("msg","欢迎使用校园二手书交易系统_后台管理系统_查询书籍，管理员 "+a.get(0).getAdminName());
			List<Book> list=bookSrv.selectBookAll();
			model.addAttribute("bookList",list);
			List<BookType> list2=bookTypeSrv.selectBookTypeAll();
			request.getSession().setAttribute("bookTypeList",list2);
			request.setAttribute("bookTypeList",list2);
			re = "admin/admin_book";
			return re;
		}else {
			model.addAttribute("msg","登录失败！请检查登录ID和密码");
			return re;
		}
	}
	
	@RequestMapping("/adminBook")
	public String adminBook(Model model,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		model.addAttribute("msg","欢迎使用校园二手书交易系统_后台管理系统_查询书籍");
		List<Book> list=bookSrv.selectBookAll();
		model.addAttribute("bookList",list);

		List<BookType> list2=bookTypeSrv.selectBookTypeAll();
		request.getSession().setAttribute("bookTypeList",list2);
		request.setAttribute("bookTypeList",list2);
		
		String re = "admin/admin_book";
		return re;
	}

	@RequestMapping("/adminBookItem")
	public String adminBookItem(Model model,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		model.addAttribute("msg","欢迎使用校园二手书交易系统_后台管理系统_查询二手书");
		List<BookItem> list=bookItemSrv.selectBookItemAll();
		model.addAttribute("bookItemList",list);		
		String re = "admin/admin_bookItem";
		return re;
	}
	

	
	@RequestMapping("/adminInfo")
	public String adminInfo(Model model, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		Admin admin=(Admin)session.getAttribute("adminInfo");
		String re = "admin/admin_info";
		model.addAttribute("msg","欢迎使用校园二手书交易系统_后台管理系统_我的个人信息");		
		if(admin==null) {
			model.addAttribute("msg","无管理员信息，请重新登录！");		
			re = "adminLogin";
		}
		return re;
	}
	
	@RequestMapping("/adminUserLogout")
	public String adminUserLogout(Model model, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		model.addAttribute("msg","欢迎使用校园二手书交易系统_后台管理系统_用户注销");
		List<User> list=userSrv.selectUserAll();
		model.addAttribute("userList",list);
		String re = "admin/admin_userLogout";
		return re;
	}
	
}
